import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalConfirmReturnState with _$MyRentalConfirmReturnState {
  const MyRentalConfirmReturnState._();

  const factory MyRentalConfirmReturnState({
    required RentalResponseItemDetails rental,
    required int? payment,
    required int? lateFinePayment,
    required int? damageFinePayment,
    required bool isLoading,
    required bool isFinished,
    required GeneralErrorData? error,
  }) = _MyRentalConfirmReturnState;

  bool get isValid =>
      payment != null &&
      payment! >= 0 &&
      lateFinePayment != null &&
      lateFinePayment! >= 0 &&
      damageFinePayment != null &&
      damageFinePayment! >= 0;

  bool get canSubmit => isValid && !isLoading;

  int get estimatedPrice =>
      rental.product.pricePerDay *
      (rental.endDate.difference(rental.startDate).inDays + 1);

  int get estimatedFinalPayment =>
      max(estimatedPrice - rental.payment.initial!, 0);

  // TODO: Check is right?
  int get estimatedLateFine =>
      rental.product.lateFeePerDay *
      (DateUtils.dateOnly(DateTime.now()).difference(rental.endDate).inDays);

  int get totalPayment => (payment ?? 0) + (lateFinePayment ?? 0) + (damageFinePayment ?? 0);

  int get totalPrice => totalPayment + rental.payment.initial!;
}
