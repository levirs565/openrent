import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

@freezed
class ProductReviewsState with _$ProductReviewsState {
  final int productId;
  final List<ProductReviewDetail> list;
  final bool isLoading;
  final ErrorWithDateTime? error;

  ProductReviewsState({
    required this.productId,
    required this.list,
    required this.isLoading,
    required this.error,
  });
}
