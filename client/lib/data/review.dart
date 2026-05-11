import 'dart:async';

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

  Future<Result<void>> remove(int id);
}

class ReviewDataSource implements ReviewRepository {
  final ReviewService _reviewService;
  final StreamController<int> _orderUpdateController;

  ReviewDataSource({
    required ReviewService reviewService,
    required StreamController<int> orderUpdateController,
  }) : _orderUpdateController = orderUpdateController,
       _reviewService = reviewService;

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
      _orderUpdateController.add(rentId);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> remove(int id) async {
    try {
      final result = await _reviewService.remove(id);
      _orderUpdateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
