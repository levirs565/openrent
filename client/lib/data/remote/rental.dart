import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:retrofit/retrofit.dart';

part 'rental.g.dart';

part 'rental.freezed.dart';

@RestApi()
abstract class RentalService {
  factory RentalService(Dio dio, {String? baseUrl}) = _RentalService;

  @GET("/owner/rents")
  Future<List<RentalResponseItem>> list();
}

@freezed
abstract class RentalProductShort with _$RentalProductShort {
  const factory RentalProductShort({required int id, required String name}) =
      _RentalProductShort;

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
