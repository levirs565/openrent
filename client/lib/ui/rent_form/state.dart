import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum RentFormErrorSource { data, submit }

typedef RentFormError = ErrorData<RentFormErrorSource>;

@freezed
abstract class RentFormState with _$RentFormState {
  RentFormState._();

  factory RentFormState({
    required int id,
    required ProductResponseItem? data,
    required DateTime startDate,
    required DateTime endDate,
    required int? quantity,
    required DataStatus dataStatus,
    // TODO: must send rent id after succcess
    required ActionStatus actionStatus,
    required RentFormError? error,
  }) = _RentFormState;

  bool get canEdit => dataStatus == .success;

  bool get isLoading => dataStatus == .loading || actionStatus == .loading;

  // TODO: Null check?
  bool get isValid =>
      quantity != null &&
      quantity! > 0 &&
      !startDate.isBefore(DateUtils.dateOnly(DateTime.now())) &&
      !endDate.isBefore(startDate);

  int get price => data == null
      ? 0
      : data!.pricePerDay * (endDate.difference(startDate).inDays + 1);

  bool get canSubmit => canEdit && isValid;
}
