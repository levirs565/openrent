import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyRentalDetailErrorSource { exchangeRate, data, actionApprove }

typedef MyRentalDetailError = ErrorData<MyRentalDetailErrorSource>;

@freezed
abstract class MyRentalDetailState with _$MyRentalDetailState {
  const MyRentalDetailState._();

  const factory MyRentalDetailState({
    required int id,
    required ExchangeRateResponse? exchangeRate,
    required String selectedCurrency,
    required DataStatus exchangeRateStatus,
    required RentalResponseItemDetails? data,
    required DataStatus dataStatus,
    required bool isActionLoading,
    required MyRentalDetailError? error,
  }) = _MyRentalDetailState;

  bool get isLoading =>
      dataStatus == .loading ||
      isActionLoading ||
      exchangeRateStatus == .loading;

  bool get canAction =>
      dataStatus == .success &&
      !isActionLoading &&
      exchangeRateStatus == .success;

  double? convertToCurrency(int? amount) {
    if (amount == null || exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedCurrency]!);
  }

  int get estimatedPrice => data == null
      ? 0
      : data!.product.pricePerDay *
            (data!.endDate.difference(data!.startDate).inDays + 1);

  // TODO: Check is right?
  int get estimatedLateFine => data == null
      ? 0
      : data!.product.lateFeePerDay *
            (DateUtils.dateOnly(
              data!.returnedAt ?? DateTime.now(),
            ).difference(data!.endDate).inDays);

  int get estimatedTotalPrice => estimatedPrice + estimatedLateFine;

  int get estimatedPendingPrice =>
      max(estimatedTotalPrice - (data?.payment.initial ?? 0), 0);

  int get totalPayment => data == null
      ? 0
      : data!.payment.initial! +
            data!.payment.finalAmount! +
            data!.payment.lateFine! +
            data!.payment.damageFine!;
}
