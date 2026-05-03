import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyProductListState with _$MyProductListState {
  factory MyProductListState({
    required bool isLoading,
    required List<MyProductResponseItemShort> data,
    required GeneralErrorData? error,
  }) = _MyProductListState;
}