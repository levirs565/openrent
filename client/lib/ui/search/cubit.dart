import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/date.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/search/state.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:timezone/timezone.dart' as tz;

class SearchCubit extends Cubit<SearchState> {
  final ProductRepository repository;
  final ExchangeRatesRepository _exchangeRatesRepository;
  final LocationRepository _locationRepository;
  final _searchController = StreamController<String>();
  String _lastKeyword = "";
  StreamSubscription? _searchSubscription;
  StreamSubscription? _locationSubscription;
  CancelToken? _cancelToken;

  SearchCubit({
    required this.repository,
    required ExchangeRatesRepository exchangeRatesRepository,
    required SettingsRepository settingsRepository,
    required LocationRepository locationRepository,
  }) : _locationRepository = locationRepository,
       _exchangeRatesRepository = exchangeRatesRepository,
       super(
         SearchState(
           result: List.empty(),
           isSearchLoading: false,
           error: null,
           isMapView: false,
           exchangeRate: null,
           selectedCurrency: settingsRepository.getCurrency(),
           exchangeRateStatus: .initial,
           currentPosition: null,
           startDate: null,
           endDate: null,
           disableAISearch: false,
           timeZone: tz.getLocation(settingsRepository.getTimeZone())
         ),
       ) {
    _searchSubscription = _searchController.stream
        .debounce(Duration(milliseconds: 500))
        .distinct()
        .listen((_doSearch));
    _locationSubscription = _locationRepository.watchCurrentLocation().listen((
      data,
    ) {
      if (data is ResultSuccess<LatLng> && !isClosed) {
        emit(state.copyWith(currentPosition: data.data));
      }
    });
    onRefreshExchangeRate();
  }

  void onKeywordChanged(String keyword) {
    _lastKeyword = keyword;
    _searchController.add(keyword);
  }

  void onDateRangeChanged(DateTime? startDate, DateTime? endDate) {
    emit(state.copyWith(startDate: startDate, endDate: endDate));
    _doSearch(_lastKeyword);
  }

  void onDisableAISearchChanged(bool disabled) {
    emit(state.copyWith(disableAISearch: disabled));
    _doSearch(_lastKeyword);
  }

  void onRefreshExchangeRate() async {
    if (state.exchangeRateStatus == .loading) return;

    final result = await _exchangeRatesRepository.get();

    switch (result) {
      case ResultSuccess<ExchangeRateResponse>():
        emit(
          state.copyWith(
            exchangeRateStatus: .success,
            exchangeRate: result.data,
          ),
        );
      case ResultError<ExchangeRateResponse>():
        emit(
          state.copyWith(
            exchangeRateStatus: .fail,
            error: .new(source: .exchangeRate, message: result.message),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    _searchSubscription?.cancel();
    return super.close();
  }

  void _doSearch(String keyword) async {
    _cancelToken?.cancel();
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;


    emit(state.copyWith(isSearchLoading: true));

    final result = await repository.searchProduct(
      keyword: keyword,
      disableAiSearch: state.disableAISearch,
      cancelToken: cancelToken,
      dateRange: state.startDate == null || state.endDate == null
          ? null
          : ProductDateRangeSearchParameter(
              start: normalizeStartDate(state.timeZone, state.startDate!),
              end: normalizeEndDate(state.timeZone, state.endDate!),
              quantity: 1,
            ),
    );

    if (cancelToken.isCancelled) return;

    switch (result) {
      case ResultSuccess<List<ProductResponseItemShort>>():
        emit(state.copyWith(result: result.data, isSearchLoading: false));
      case ResultError<List<ProductResponseItemShort>>():
        emit(
          state.copyWith(
            error: .new(message: result.message, source: .data),
            isSearchLoading: false,
          ),
        );
    }
  }

  void onErrorHandled(SearchError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onToggleView() {
    emit(state.copyWith(isMapView: !state.isMapView));
  }
}
