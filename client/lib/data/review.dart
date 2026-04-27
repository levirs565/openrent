import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/remote/review.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class ReviewRepository {
  Future<Result<List<ProductReviewDetail>>> getByProduct(int productId);

  Future<Result<void>> add({
    required int rentId,
    required int rating,
    required String content,
  });
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

  @override
  Future<Result<void>> add({
    required int rentId,
    required int rating,
    required String content,
  }) async {
    try {
      final result = await _reviewService.addReview(
        rentId,
        ReviewAddRequest(rating: rating, content: content),
      );
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
