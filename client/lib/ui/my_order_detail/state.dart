import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import '../core/enum.dart';

part 'state.freezed.dart';

enum MyOrderDetailErrorSource { data, actionReceive, actionReturn }

typedef MyOrderDetailError = ErrorData<MyOrderDetailErrorSource>;

@freezed
abstract class MyOrderDetailState with _$MyOrderDetailState {
  const MyOrderDetailState._();

  const factory MyOrderDetailState({
    required int id,
    required OrderResponseItemDetails? data,
    required DataStatus dataStatus,
    required bool isActionLoading,
    required MyOrderDetailError? error,
  }) = _MyOrderDetailState;

  bool get isLoading => dataStatus == .loading || isActionLoading;

  bool get canAction => dataStatus == .success;

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
  int get estimatedPendingPrice => max(estimatedTotalPrice - (data?.payment.initial ?? 0), 0);


  int get totalPayment => data == null
      ? 0
      : data!.payment.initial! +
      data!.payment.finalAmount! +
      data!.payment.lateFine! +
      data!.payment.damageFine!;
}
