import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductRepository _productRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;

  ProductDetailCubit({
    required int id,
    required ProductRepository productRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
    required SettingsRepository settingsRepository,
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _productRepository = productRepository,
       super(
         ProductDetailState(
           id: id,
           data: null,
           exchangeRate: null,
           selectedCurrency: settingsRepository.getCurrency(),
           exchangeRateStatus: .initial,
           dataStatus: .initial,
           error: null,
         ),
       ) {
    onRefreshExchangeRate();
  }

  Future<void> onRefreshExchangeRate() async {
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
        await onRefresh();
      case ResultError<ExchangeRateResponse>():
        emit(
          state.copyWith(
            exchangeRateStatus: .fail,
            error: .new(source: .exchangeRate, message: result.message),
          ),
        );
    }
  }

  Future<void> onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _productRepository.getById(id: state.id);

    switch (result) {
      case ResultSuccess<ProductResponseItemDetail>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<ProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: .new(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
