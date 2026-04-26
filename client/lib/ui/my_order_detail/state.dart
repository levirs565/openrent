import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import '../core/enum.dart';

part 'state.freezed.dart';

enum MyOrderDetailErrorSource { data, actionReceive }

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
}
