import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class ProductReviewsState with _$ProductReviewsState {
  const factory ProductReviewsState({
    required int productId,
    required List<ProductReviewDetail> list,
    required bool isLoading,
    required GeneralErrorData? error,
  }) = _ProductReviewsState;
}
