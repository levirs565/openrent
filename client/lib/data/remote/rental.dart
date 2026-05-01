import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:retrofit/retrofit.dart';

part 'rental.g.dart';

part 'rental.freezed.dart';

@RestApi()
abstract class RentalService {
  factory RentalService(Dio dio, {String? baseUrl}) = _RentalService;

  @GET("/owner/rents")
  Future<List<RentalResponseItem>> list();

  @GET("/owner/rents/{id}")
  Future<RentalResponseItemDetails> getById(@Path("id") int id);

  @POST("/owner/rents/{id}/approve")
  Future<ActionResponse> approve(@Path("id") int id);

  @POST("/owner/rents/{id}/reject")
  Future<ActionResponse> reject(
    @Path("id") int id,
    @Body() RentalRejectRequest request,
  );

  @POST("/owner/rents/{id}/handover")
  Future<ActionResponse> handover(@Path("id") int id);

  @POST("/owner/rents/{id}/confirm_return")
  Future<ActionResponse> confirmReturn(@Path("id") int id);
}

@freezed
abstract class RentalProductShort with _$RentalProductShort {
  const factory RentalProductShort({
    required int id,
    required String name,
    @JsonKey(name: "image_url") required String? imageUrl,
  }) = _RentalProductShort;

  factory RentalProductShort.fromJson(Map<String, Object?> json) =>
      _$RentalProductShortFromJson(json);
}

@freezed
abstract class RentalUserShort with _$RentalUserShort {
  const factory RentalUserShort({required int id, required String name}) =
      _RentalUserShort;

  factory RentalUserShort.fromJson(Map<String, Object?> json) =>
      _$RentalUserShortFromJson(json);
}

@JsonEnum()
enum RentState {
  @JsonValue("pending")
  pendingApproval,
  @JsonValue("initial_payment")
  awaitingInitialPayment,
  @JsonValue("ready")
  readyForPickup,
  @JsonValue("handover_pending")
  awaitingHandover,
  @JsonValue("on_rent")
  onRent,
  @JsonValue("return_pending")
  awaitingReturnConfirmation,
  @JsonValue("final_payment")
  awaitingFinalPayment,
  @JsonValue("completed")
  completed,
  @JsonValue("cancelled")
  cancelled,
}

@freezed
abstract class RentalResponseItem with _$RentalResponseItem {
  const factory RentalResponseItem({
    required int id,
    required RentalProductShort product,
    required RentalUserShort user,
    required RentState state,
    @JsonKey(name: "start_date")
    @Iso8601Converter()
    required DateTime startDate,
    @JsonKey(name: "end_date") @Iso8601Converter() required DateTime endDate,
    required int quantity,
  }) = _RentalResponseItem;

  factory RentalResponseItem.fromJson(Map<String, Object?> json) =>
      _$RentalResponseItemFromJson(json);
}

@freezed
abstract class RentalUserDetails with _$RentalUserDetails {
  const factory RentalUserDetails({required int id, required String name}) =
      _RentalUserDetails;

  factory RentalUserDetails.fromJson(Map<String, Object?> json) =>
      _$RentalUserDetailsFromJson(json);
}

@JsonEnum()
enum RentCancelReason {
  @JsonValue("approval_timeout")
  approvalTimeout,
  @JsonValue("owner_rejected")
  ownerRejected,
  @JsonValue("initial_payment_timeout")
  initialPaymentTimeout,
  @JsonValue("owner_cancelled")
  ownerCancelled,
  @JsonValue("user_cancelled")
  userCancelled,
}

@freezed
abstract class RentCancellation with _$RentCancellation {
  const factory RentCancellation({
    required RentCancelReason reason,
    required String note,
  }) = _RentCancellation;

  factory RentCancellation.fromJson(Map<String, Object?> json) =>
      _$RentCancellationFromJson(json);
}

@freezed
abstract class RentalReviewDetails with _$RentalReviewDetails {
  factory RentalReviewDetails({
    required int id,
    required int rating,
    required String content,
  }) = _RentalReviewDetails;

  factory RentalReviewDetails.fromJson(Map<String, Object?> json) =>
      _$RentalReviewDetailsFromJson(json);
}

@freezed
abstract class RentalResponseItemDetails with _$RentalResponseItemDetails {
  const factory RentalResponseItemDetails({
    required int id,
    required RentalProductShort product,
    required RentalUserDetails user,
    required RentalReviewDetails? review,
    required RentState state,
    @JsonKey(name: "start_date")
    @Iso8601Converter()
    required DateTime startDate,
    @JsonKey(name: "end_date") @Iso8601Converter() required DateTime endDate,
    required int quantity,
    required RentCancellation? cancellation,
  }) = _RentalResponseItemDetails;

  factory RentalResponseItemDetails.fromJson(Map<String, Object?> json) =>
      _$RentalResponseItemDetailsFromJson(json);
}

@freezed
abstract class RentalRejectRequest with _$RentalRejectRequest {
  const factory RentalRejectRequest({required String note}) =
      _RentalRejectRequest;

  factory RentalRejectRequest.fromJson(Map<String, Object?> json) =>
      _$RentalRejectRequestFromJson(json);
}
