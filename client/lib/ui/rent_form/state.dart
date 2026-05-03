import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum RentFormErrorSource { data, exchangeRate, dateRanges, submit }

typedef RentFormError = ErrorData<RentFormErrorSource>;

@freezed
abstract class RentFormState with _$RentFormState {
  RentFormState._();

  factory RentFormState({
    required int id,
    required ExchangeRateResponse? exchangeRate,
    required String selectedCurrency,
    required DataStatus exchangeRateStatus,
    required ProductResponseItemDetail? data,
    required DateTime startDate,
    required DateTime endDate,
    required int? quantity,
    required DataStatus dataStatus,
    // TODO: must send rent id after succcess
    required ActionStatus actionStatus,
    required RentFormError? error,
  }) = _RentFormState;

  double? convertToCurrency(int? amount) {
    if (amount == null ||
        exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedCurrency]!);
  }

  bool get canEdit => dataStatus == .success && exchangeRateStatus == .success;

  bool get isLoading =>
      dataStatus == .loading ||
      actionStatus == .loading ||
      exchangeRateStatus == .loading;

  // TODO: Null check?
  bool get isValid =>
      quantity != null &&
      quantity! > 0 &&
      !startDate.isBefore(DateUtils.dateOnly(DateTime.now())) &&
      !endDate.isBefore(startDate);

  int get priceIdr => data == null
      ? 0
      : data!.pricePerDay * (endDate.difference(startDate).inDays + 1);

  double? get price => convertToCurrency(priceIdr);

  bool get canSubmit => canEdit && isValid;
}
