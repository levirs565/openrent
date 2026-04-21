import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/remote/review.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class ReviewRepository {
  Future<Result<List<ProductReviewDetail>>> getByProduct(int productId);
}

class ReviewDataSource implements ReviewRepository {
  final ReviewService _reviewService;

  ReviewDataSource({required ReviewService reviewService})
    : _reviewService = reviewService;

  @override
  Future<Result<List<ProductReviewDetail>>> getByProduct(int productId) async {
    try {
      final result = await _reviewService.getReviews(productId);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
