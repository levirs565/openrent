import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/order.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';

import 'state.dart';

class MyOrderDetailCubit extends Cubit<MyOrderDetailState> {
  final OrderRepository _orderRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;
  StreamSubscription? _fcmSubscription;

  MyOrderDetailCubit({
    required int id,
    required OrderRepository orderRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
    required SettingsRepository settingsRepository
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _orderRepository = orderRepository,
       super(
         MyOrderDetailState(
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

  @override
  Future<void> close() {
    _fcmSubscription?.cancel();
    return super.close();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _orderRepository.getById(state.id);

    switch (result) {
      case ResultSuccess<OrderResponseItemDetails>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<OrderResponseItemDetails>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyOrderDetailError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyOrderDetailError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onReceive() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _orderRepository.receive(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyOrderDetailError(
              source: .actionReceive,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onRequestReturn() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _orderRepository.requestReturn(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyOrderDetailError(
              source: .actionReturn,
              message: result.message,
            ),
          ),
        );
    }
  }
}
