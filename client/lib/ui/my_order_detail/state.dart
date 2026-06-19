import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/rental_calculator.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

import '../core/enum.dart';

part 'state.freezed.dart';

enum MyOrderDetailErrorSource {
  data,
  exchangeRate,
  actionReceive,
  actionReturn,
}

typedef MyOrderDetailError = ErrorData<MyOrderDetailErrorSource>;

@freezed
abstract class MyOrderDetailState with _$MyOrderDetailState {
  const MyOrderDetailState._();

  const factory MyOrderDetailState({
    required int id,
    required ExchangeRateResponse? exchangeRate,
    required String selectedCurrency,
    required DataStatus exchangeRateStatus,
    required OrderResponseItemDetails? data,
    required DataStatus dataStatus,
    required bool isActionLoading,
    required MyOrderDetailError? error,
    required tz.Location timeZone,
  }) = _MyOrderDetailState;

  bool get isLoading =>
      dataStatus == .loading ||
      isActionLoading ||
      exchangeRateStatus == .loading;

  bool get canAction =>
      dataStatus == .success &&
      !isActionLoading &&
      exchangeRateStatus == .success;

  double? convertToCurrency(int? amount) {
    if (amount == null ||
        exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedCurrency]!);
  }

  RentalCalculator? get calculator => data?.toCalculator();

  int get estimatedPrice => calculator?.estimatedPrice ?? 0;

  int get estimatedLateFine => calculator?.estimatedLateFine ?? 0;

  int get estimatedTotalPrice => calculator?.estimatedTotalPrice ?? 0;

  int get estimatedPendingPrice =>
      max(estimatedTotalPrice - (data?.payment.initial ?? 0), 0);

  int get totalPayment => data == null
      ? 0
      : data!.payment.initial! +
            data!.payment.finalAmount! +
            data!.payment.lateFine! +
            data!.payment.damageFine!;
}
