import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:retrofit/retrofit.dart';

import 'auth.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@RestApi()
abstract class ProductService {
  factory ProductService(Dio dio, {String? baseUrl}) = _ProductService;

  @GET("/products")
  Future<List<ProductResponseItemShort>> listProduct({
    @Query("owner") bool? owner,
    @Query("q") String? query,
    @Query("no_ai_search") bool? disableAiSearch,
    @Query("regions") List<String>? regions,
    @Query("lat") double? lat,
    @Query("lng") double? lng,
    @Query("radius_km") int? radiusKm,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET("/products/{id}")
  Future<ProductResponseItemDetail> getProduct(@Path("id") int id);

  @GET("/me/products/")
  Future<List<MyProductResponseItemShort>> getMyProductList();

  @GET("/me/products/{id}")
  Future<MyProductResponseItemDetail> getMyProductDetail(@Path("id") int id);

  @POST("/me/products")
  Future<MyProductResponseItem> addProduct(@Body() ProductAddRequest request);

  @PUT("/me/products/{id}")
  Future<MyProductResponseItem> updateProduct(
    @Path("id") int id,
    @Body() ProductAddRequest request,
  );

  @POST("/me/products/{id}/image/presigned-url")
  Future<ProductImagePresignedResponse> createProductImagePresigned(
      @Path("id") int id,
      @Body() ProductImagePresignedRequest request,
      );

  @POST("/me/products/{id}/image/confirm")
  Future<ActionResponse> confirmProductImage(
      @Path("id") int id,
      @Body() ProductImageConfirmRequest request,
      );
}

@JsonSerializable()
class ProductUserData {
  final int id;
  final String name;

  ProductUserData({required this.id, required this.name});

  factory ProductUserData.fromJson(Map<String, dynamic> json) =>
      _$ProductUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductUserDataToJson(this);
}

@JsonSerializable()
class ProductShortAddress {
  final int id;
  final String regency;
  final double lat, lng;

  ProductShortAddress({
    required this.id,
    required this.regency,
    required this.lat,
    required this.lng,
  });

  factory ProductShortAddress.fromJson(Map<String, dynamic> json) =>
      _$ProductShortAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ProductShortAddressToJson(this);
}

@JsonSerializable()
class ProductAddress {
  final int id;
  final String province, regency, district, detail;
  final double lat, lng;

  ProductAddress({
    required this.id,
    required this.province,
    required this.regency,
    required this.district,
    required this.detail,
    required this.lat,
    required this.lng,
  });

  factory ProductAddress.fromJson(Map<String, dynamic> json) =>
      _$ProductAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddressToJson(this);
}

@freezed
abstract class ProductResponseItemShort with _$ProductResponseItemShort {
  const factory ProductResponseItemShort({
    required int id,
    required ProductUserData user,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String name,
    @JsonKey(name: "price_per_day") required int pricePerDay,
    required int stock,
    required ProductShortAddress address,
    @JsonKey(name: "image_url") required String? imageUrl,
  }) = _ProductResponseItemShort;

  factory ProductResponseItemShort.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseItemShortFromJson(json);
}

@JsonSerializable()
class ProductReviewDetail {
  final int id;
  final ProductUserData user;
  final int rating;
  final String content;

  ProductReviewDetail(this.id, this.user, this.rating, this.content);

  factory ProductReviewDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewDetailToJson(this);
}

@freezed
abstract class ProductResponseItemDetail with _$ProductResponseItemDetail {
  const factory ProductResponseItemDetail({
    required int id,
    required ProductUserData user,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String name,
    @JsonKey(name: "price_per_day") required int pricePerDay,
    @JsonKey(name: "late_fee_per_day") required int lateFeePerDay,
    required int stock,
    required String description,
    required ProductAddress address,
    required List<ProductResponseItemShort> recommendations,
    @JsonKey(name: "image_url") required String? imageUrl,
    @JsonKey(name: "top_reviews") required List<ProductReviewDetail> topReviews,
  }) = _ProductResponseItemDetail;

  factory ProductResponseItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseItemDetailFromJson(json);
}

@JsonSerializable()
class ProductAddRequest {
  final String name;
  @JsonKey(name: "price_per_day")
  final int pricePerDay;
  @JsonKey(name: "late_fee_per_day")
  final int lateFeePerDay;
  final int stock;
  final String description;
  @JsonKey(name: "address_id")
  final int addressId;

  ProductAddRequest({
    required this.name,
    required this.pricePerDay,
    required this.lateFeePerDay,
    required this.stock,
    required this.description,
    required this.addressId,
  });

  factory ProductAddRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductAddRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddRequestToJson(this);
}

@freezed
abstract class MyProductResponseItemShort with _$MyProductResponseItemShort {
  const factory MyProductResponseItemShort({
    required int id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String name,
    @JsonKey(name: "price_per_day") required int pricePerDay,
    required int stock,
    required MyProductAddressShort address,
    @JsonKey(name: "rent_count") required MyProductRentCount rentCount,
    @JsonKey(name: "image_url") required String? imageUrl,
  }) = _MyProductResponseItemShort;

  factory MyProductResponseItemShort.fromJson(Map<String, dynamic> json) =>
      _$MyProductResponseItemShortFromJson(json);
}

@freezed
abstract class MyProductAddressShort with _$MyProductAddressShort {
  const factory MyProductAddressShort({
    required int id,
    required String name,
  }) = _MyProductAddressShort;

  factory MyProductAddressShort.fromJson(Map<String, dynamic> json) =>
      _$MyProductAddressShortFromJson(json);
}

@freezed
abstract class MyProductRentCount with _$MyProductRentCount {
  const factory MyProductRentCount({
    required int pending,
    required int ready,
    @JsonKey(name: "on_rent") required int onRent,
    @JsonKey(name: "pending_return") required int pendingReturn,
    required int late,
  }) = _MyProductRentCount;

  factory MyProductRentCount.fromJson(Map<String, dynamic> json) =>
      _$MyProductRentCountFromJson(json);
}

@freezed
abstract class MyProductResponseItem with _$MyProductResponseItem {
  const factory MyProductResponseItem({
    required int id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String name,
    @JsonKey(name: "price_per_day") required int pricePerDay,
    @JsonKey(name: "late_fee_per_day") required int lateFeePerDay,
    required int stock,
    required String description,
    required MyProductAddress address,
  }) = _MyProductResponseItem;

  factory MyProductResponseItem.fromJson(Map<String, dynamic> json) =>
      _$MyProductResponseItemFromJson(json);
}

@freezed
abstract class MyProductAddress with _$MyProductAddress {
  const factory MyProductAddress({
    required int id,
    required String province,
    required String regency,
    required String district,
    required String detail,
    required double lat,
    required double lng,
    required String name,
  }) = _MyProductAddress;

  factory MyProductAddress.fromJson(Map<String, dynamic> json) =>
      _$MyProductAddressFromJson(json);
}

@freezed
abstract class MyProductResponseItemDetail with _$MyProductResponseItemDetail {
  const factory MyProductResponseItemDetail({
    required int id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String name,
    @JsonKey(name: "price_per_day") required int pricePerDay,
    @JsonKey(name: "late_fee_per_day") required int lateFeePerDay,
    required int stock,
    required String description,
    required MyProductAddress address,
    @JsonKey(name: "top_reviews") required List<ProductReviewDetail> topReviews,
    required List<MyProductRentItem> rents,
    @JsonKey(name: "image_url") required String? imageUrl,
  }) = _MyProductResponseItemDetail;

  factory MyProductResponseItemDetail.fromJson(Map<String, dynamic> json) =>
      _$MyProductResponseItemDetailFromJson(json);
}

@freezed
abstract class MyProductRentItem with _$MyProductRentItem {
  const factory MyProductRentItem({
    required int id,
    required ProductUserData user,
    required RentState state,
    @JsonKey(name: "start_date") @Iso8601Converter() required DateTime startDate,
    @JsonKey(name: "end_date") @Iso8601Converter() required DateTime endDate,
    required int quantity,
  }) = _MyProductRentItem;

  factory MyProductRentItem.fromJson(Map<String, dynamic> json) =>
      _$MyProductRentItemFromJson(json);
}

@freezed
abstract class ProductImagePresignedRequest with _$ProductImagePresignedRequest {
  const factory ProductImagePresignedRequest({
    required int size,
    @JsonKey(name: "content_type") required String contentType,
  }) = _ProductImagePresignedRequest;

  factory ProductImagePresignedRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductImagePresignedRequestFromJson(json);
}

@freezed
abstract class ProductImagePresignedResponse with _$ProductImagePresignedResponse {
  const factory ProductImagePresignedResponse({
    required String name,
    required String url,
    required String method,
    required Map<String, List<String>> headers,
  }) = _ProductImagePresignedResponse;

  factory ProductImagePresignedResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductImagePresignedResponseFromJson(json);
}

@freezed
abstract class ProductImageConfirmRequest with _$ProductImageConfirmRequest {
  const factory ProductImageConfirmRequest({required String name}) =
  _ProductImageConfirmRequest;

  factory ProductImageConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductImageConfirmRequestFromJson(json);
}