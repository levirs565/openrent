import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

part 'state.freezed.dart';

@freezed
abstract class MyOrdersState with _$MyOrdersState {
  factory MyOrdersState({
    required bool isLoading,
    required List<OrderResponseItem> list,
    required GeneralErrorData? error,
    required tz.Location timeZone
  }) = _MyOrdersState;
}
