import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/core/date.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/rent.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/rent_form/state.dart';

class RentFormCubit extends Cubit<RentFormState> {
  final ProductRepository _productRepository;
  final RentRepository _rentRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;

  RentFormCubit({
    required int id,
    required ProductRepository productRepository,
    required RentRepository rentRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
    required SettingsRepository settingsRepository,
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _productRepository = productRepository,
       _rentRepository = rentRepository,
       super(
         RentFormState(
           id: id,
           data: null,
           startDate: DateUtils.dateOnly(DateTime.now()),
           endDate: DateUtils.dateOnly(DateTime.now()),
           quantity: 1,
           dataStatus: .initial,
           actionStatus: .idle,
           error: null,
           exchangeRate: null,
           selectedCurrency: settingsRepository.getCurrency(),
           exchangeRateStatus: .initial,
           timeZone: tz.getLocation(settingsRepository.getTimeZone()),
         ),
       ) {
    onRefreshExchangeRate();
  }

  int getAvailableStock(DateTime day) {
    final normalized = normalizeStartDate(state.timeZone, day);
    final stateSnapshot = state;
    if (stateSnapshot.data == null) return 0;

    int usedStock = 0;
    for (final rent in stateSnapshot.data!.availability) {
      if (rent.isOverdue ||
          (!rent.startDate.isAfter(normalized) &&
              !rent.endDate.isBefore(normalized))) {
        usedStock += rent.quantity;
      }
    }
    return stateSnapshot.data!.stock - usedStock;
  }

  void setSelectedRange(DateTime startDate, DateTime endDate) {
    final start = normalizeStartDate(state.timeZone, startDate);
    final end = normalizeEndDate(state.timeZone, endDate);

    final stateSnapshot = state;
    if (stateSnapshot.data == null) return;

    int used = 0;
    for (final rent in stateSnapshot.data!.availability) {
      if (rent.isOverdue ||
          (!rent.startDate.isAfter(end) && !rent.endDate.isBefore(start))) {
        used += rent.quantity;
      }
    }

    if (stateSnapshot.data!.stock - used <= 0) {
      emit(
        state.copyWith(
          error: .new(source: .dateRanges, message: "Tidak ada stok"),
        ),
      );
      return;
    }

    emit(state.copyWith(startDate: startDate, endDate: endDate));
  }

  void setQuantity(int? quantity) {
    emit(state.copyWith(quantity: quantity));
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
    // TODO: Maybe check only if data is loaindg?
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
            error: RentFormError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onSubmit() async {
    if (!state.canSubmit || state.isLoading) return;

    emit(state.copyWith(actionStatus: .loading));

    final start = normalizeStartDate(state.timeZone, state.startDate);
    final end = normalizeEndDate(state.timeZone, state.endDate);

    final result = await _rentRepository.startRent(
      productId: state.data!.id,
      startDate: start,
      endDate: end,
      quantity: state.quantity!,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(actionStatus: .finished));
      case ResultError<void>():
        emit(
          state.copyWith(
            actionStatus: .idle,
            error: RentFormError(source: .submit, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(RentFormError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onActionSuccessHandled() {
    if (state.actionStatus == .finished) {
      emit(state.copyWith(actionStatus: .idle));
    }
  }
}
