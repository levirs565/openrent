import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalConfirmReturnState with _$MyRentalConfirmReturnState {
  const MyRentalConfirmReturnState._();

  const factory MyRentalConfirmReturnState({
    required RentalResponseItemDetails rental,
    required DataStatus exchangeRateStatus,
    required ExchangeRateResponse? exchangeRate,
    required String selectedFromCurrency,
    required double? payment,
    required double? lateFinePayment,
    required double? damageFinePayment,
    required bool isSubmitLoading,
    required bool isFinished,
    required GeneralErrorData? error,
  }) = _MyRentalConfirmReturnState;

  int? convertFromCurrency(double? amount) {
    if (amount == null ||
        exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedFromCurrency)) {
      return null;
    }
    return (amount / exchangeRate!.conversionRates[selectedFromCurrency]!)
        .round();
  }

  double? convertToCurrency(int? amount) {
    if (amount == null ||
        exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedFromCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedFromCurrency]!);
  }

  bool get isLoading => exchangeRateStatus == .loading || isSubmitLoading;
  bool get canEdit => exchangeRateStatus == .success && !isSubmitLoading;

  int? get paymentIdr => convertFromCurrency(payment);

  int? get lateFinePaymentIdr => convertFromCurrency(lateFinePayment);

  int? get damageFinePaymentIdr => convertFromCurrency(damageFinePayment);

  bool get isValid =>
      exchangeRateStatus == .success &&
      !isSubmitLoading &&
      paymentIdr != null &&
      paymentIdr! >= 0 &&
      lateFinePaymentIdr != null &&
      lateFinePaymentIdr! >= 0 &&
      damageFinePaymentIdr != null &&
      damageFinePaymentIdr! >= 0;

  bool get canSubmit => isValid && !isLoading;

  int get estimatedPriceIdr =>
      rental.product.pricePerDay *
      (rental.endDate.difference(rental.startDate).inDays + 1);

  int get estimatedFinalPaymentIdr =>
      max(estimatedPriceIdr - rental.payment.initial!, 0);

  // TODO: Check is right?
  int get estimatedLateFineIdr =>
      rental.product.lateFeePerDay *
      (DateUtils.dateOnly(DateTime.now()).difference(rental.endDate).inDays);

  double? get estimatedPrice => convertToCurrency(estimatedPriceIdr);

  double? get estimatedFinalPayment =>
      convertToCurrency(estimatedFinalPaymentIdr);

  double? get estimatedLateFine => convertToCurrency(estimatedLateFineIdr);

  double get totalPayment =>
      (payment ?? 0) + (lateFinePayment ?? 0) + (damageFinePayment ?? 0);

  int? get totalPaymentIdr => convertFromCurrency(totalPayment);

  int? get totalPriceIdr => totalPaymentIdr == null
      ? null
      : totalPaymentIdr! + rental.payment.initial!;
}
