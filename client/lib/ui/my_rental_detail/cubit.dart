import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalDetailCubit extends Cubit<MyRentalDetailState> {
  final RentalRepository _rentalRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;
  StreamSubscription? _fcmSubscription;

  MyRentalDetailCubit({
    required int id,
    required RentalRepository rentalRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
    required SettingsRepository settingsRepository
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _rentalRepository = rentalRepository,
       super(
         MyRentalDetailState(
           id: id,
           data: null,
           dataStatus: .initial,
           isActionLoading: false,
           error: null,
           exchangeRate: null,
           selectedCurrency: settingsRepository.getCurrency(),
           exchangeRateStatus: .initial,
         ),
       ) {
    onRefreshExchangeRate();
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"].toString().startsWith("rent_") &&
          int.tryParse(event.data["rent_id"]) == id) {
        onRefresh();
      }
    });
  }

  @override
  Future<void> close() {
    _fcmSubscription?.cancel();
    return super.close();
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
        onRefresh();
      case ResultError<ExchangeRateResponse>():
        emit(
          state.copyWith(
            exchangeRateStatus: .fail,
            error: .new(source: .exchangeRate, message: result.message),
          ),
        );
    }
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _rentalRepository.getById(state.id);

    switch (result) {
      case ResultSuccess<RentalResponseItemDetails>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<RentalResponseItemDetails>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyRentalDetailError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyRentalDetailError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onApprove() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.approve(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionApprove,
              message: result.message,
            ),
          ),
        );
    }
  }
}
