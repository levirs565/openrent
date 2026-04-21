import 'package:openrent_client/data/remote/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'review.g.dart';

@RestApi()
abstract class ReviewService {
  factory ReviewService(Dio dio, {String? baseUrl}) = _ReviewService;

  @GET("/products/{id}/reviews")
  Future<List<ProductReviewDetail>> getReviews(@Path("id") int productId);
}