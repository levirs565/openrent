import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

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

  @POST("/me/products")
  Future<ProductResponseItem> addProduct(@Body() ProductAddRequest request);

  @PUT("/me/products/{id}")
  Future<ProductResponseItem> updateProduct(
    @Path("id") int id,
    @Body() ProductAddRequest request,
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

@JsonSerializable()
class ProductResponseItemShort {
  final int id;
  final ProductUserData user;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final String name;
  @JsonKey(name: "price_per_day")
  final int pricePerDay;
  final int stock;
  final ProductShortAddress address;

  ProductResponseItemShort({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.pricePerDay,
    required this.stock,
    required this.address,
  });

  factory ProductResponseItemShort.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseItemShortFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseItemShortToJson(this);
}

@JsonSerializable()
class ProductResponseItem {
  final int id;
  final ProductUserData user;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final String name;
  @JsonKey(name: "price_per_day")
  final int pricePerDay;
  @JsonKey(name: "late_fee_per_day")
  final int lateFeePerDay;
  final int stock;
  final String description;
  final ProductAddress address;

  ProductResponseItem({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.pricePerDay,
    required this.lateFeePerDay,
    required this.stock,
    required this.description,
    required this.address,
  });

  factory ProductResponseItem.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseItemToJson(this);
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

@JsonSerializable()
class ProductResponseItemDetail extends ProductResponseItem {
  final List<ProductResponseItemShort> recommendations;
  @JsonKey(name: "top_reviews")
  final List<ProductReviewDetail> topReviews;

  ProductResponseItemDetail({
    required super.id,
    required super.user,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.pricePerDay,
    required super.lateFeePerDay,
    required super.stock,
    required super.description,
    required super.address,
    required this.recommendations,
    required this.topReviews,
  });

  factory ProductResponseItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseItemDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseItemDetailToJson(this);
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