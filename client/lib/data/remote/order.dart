import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:retrofit/retrofit.dart';

import 'converter.dart';

part 'order.g.dart';

part 'order.freezed.dart';

@RestApi()
abstract class OrderService {
  factory OrderService(Dio dio, {String? baseUrl}) = _OrderService;

  @GET("/rents")
  Future<List<OrderResponseItem>> list();

  @GET("/rents/{id}")
  Future<OrderResponseItemDetails> getById(@Path() int id);

  @POST("/rents/{id}/receive")
  Future<ActionResponse> receive(@Path() int id);

  @POST("/rents/{id}/return")
  Future<ActionResponse> requestReturn(@Path() int id);
}

@freezed
abstract class OrderProductShort with _$OrderProductShort {
  factory OrderProductShort({required int id, required String name}) =
      _OrderProductShort;

  factory OrderProductShort.fromJson(Map<String, Object?> json) =>
      _$OrderProductShortFromJson(json);
}

@freezed
abstract class OrderUserShort with _$OrderUserShort {
  factory OrderUserShort({required int id, required String name}) =
      _OrderUserShort;

  factory OrderUserShort.fromJson(Map<String, Object?> json) =>
      _$OrderUserShortFromJson(json);
}

@freezed
abstract class OrderReviewShort with _$OrderReviewShort {
  factory OrderReviewShort({required int id}) = _OrderReviewShort;

  factory OrderReviewShort.fromJson(Map<String, Object?> json) =>
      _$OrderReviewShortFromJson(json);
}

@freezed
abstract class OrderResponseItem with _$OrderResponseItem {
  factory OrderResponseItem({
    required int id,
    required OrderProductShort product,
    required OrderUserShort user,
    required OrderReviewShort? review,
    required RentState state,
    @JsonKey(name: "start_date")
    @Iso8601Converter()
    required DateTime startDate,
    @JsonKey(name: "end_date") @Iso8601Converter() required DateTime endDate,
    required int quantity,
  }) = _OrderResponseItem;

  factory OrderResponseItem.fromJson(Map<String, Object?> json) =>
      _$OrderResponseItemFromJson(json);
}

@freezed
abstract class OrderUserDetails with _$OrderUserDetails {
  factory OrderUserDetails({required int id, required String name}) =
      _OrderUserDetails;

  factory OrderUserDetails.fromJson(Map<String, Object?> json) =>
      _$OrderUserDetailsFromJson(json);
}

@freezed
abstract class OrderReviewDetails with _$OrderReviewDetails {
  factory OrderReviewDetails({
    required int id,
    required int rating,
    required String content,
  }) = _OrderReviewDetails;

  factory OrderReviewDetails.fromJson(Map<String, Object?> json) =>
      _$OrderReviewDetailsFromJson(json);
}

@freezed
abstract class OrderResponseItemDetails with _$OrderResponseItemDetails {
  factory OrderResponseItemDetails({
    required int id,
    required OrderProductShort product,
    required OrderUserDetails user,
    required OrderReviewDetails? review,
    required RentState state,
    @JsonKey(name: "start_date")
    @Iso8601Converter()
    required DateTime startDate,
    @JsonKey(name: "end_date") @Iso8601Converter() required DateTime endDate,
    required int quantity,
    required RentCancellation? cancellation,
  }) = _OrderResponseItemDetails;

  factory OrderResponseItemDetails.fromJson(Map<String, Object?> json) =>
      _$OrderResponseItemDetailsFromJson(json);
}
