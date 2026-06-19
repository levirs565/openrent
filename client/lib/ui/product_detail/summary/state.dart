import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class ProductSummaryState with _$ProductSummaryState {
  const factory ProductSummaryState({
    required int id,
    required String? summary,
    required bool isLoading,
    required GeneralErrorData? error,
  }) = _ProductSummaryState;
}