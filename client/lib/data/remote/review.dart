import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:dio/dio.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'review.g.dart';

part 'review.freezed.dart';

@RestApi()
abstract class ReviewService {
  factory ReviewService(Dio dio, {String? baseUrl}) = _ReviewService;

  @GET("/products/{id}/reviews")
  Future<List<ProductReviewDetail>> getReviews(@Path("id") int productId);

  @POST("/rents/{id}/review")
  Future<ActionResponse> addReview(
    @Path("id") int rentId,
    @Body() ReviewAddRequest body,
  );

  @DELETE("/reviews/{id}")
  Future<ActionResponse> remove(@Path("id") int id);
}

@freezed
abstract class ReviewAddRequest with _$ReviewAddRequest {
  factory ReviewAddRequest({required int rating, required String content}) =
      _ReviewAddRequest;

  factory ReviewAddRequest.fromJson(Map<String, Object?> json) =>
      _$ReviewAddRequestFromJson(json);
}
