import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  factory SearchState({
    required List<ProductResponseItemShort> result,
    required bool isLoading,
    required GeneralErrorData? error,
    required bool isMapView,
  }) = _SearchState;
}
