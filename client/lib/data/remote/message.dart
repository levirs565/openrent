import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:retrofit/retrofit.dart';

part 'message.g.dart';

part 'message.freezed.dart';

@RestApi()
abstract class MessageService {
  factory MessageService(Dio dio, {String? baseUrl}) = _MessageService;

  @GET("/chats/{id}")
  Future<List<MessageResponseItem>> getByOtherUser(@Path("id") int otherId);

  @POST("/chats/{id}")
  Future<ActionResponse> send(
    @Path("id") int otherId,
    @Body() MessageAddRequest request,
  );
}

@freezed
abstract class MessageResponseItem with _$MessageResponseItem {
  const factory MessageResponseItem({
    required int id,
    @JsonKey(name: "current_user") required bool currentUser,
    @JsonKey(name: "created_at")
    @Iso8601Converter()
    required DateTime createdAt,
    @JsonKey(name: "updated_at")
    @Iso8601Converter()
    required DateTime updatedAt,
    required String? message,
    @JsonKey(name: "deleted_at")
    @Iso8601Converter()
    required DateTime? deletedAt,
    // TODO: useless, because delete message fill removed
  }) = _MessageResponseItem;

  factory MessageResponseItem.fromJson(Map<String, Object?> json) =>
      _$MessageResponseItemFromJson(json);
}

@freezed
abstract class MessageAddRequest with _$MessageAddRequest {
  const factory MessageAddRequest({required String message}) =
      _MessageAddRequest;

  factory MessageAddRequest.fromJson(Map<String, Object?> json) =>
      _$MessageAddRequestFromJson(json);
}
