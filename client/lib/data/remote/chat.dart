import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:retrofit/retrofit.dart';

part 'chat.g.dart';

part 'chat.freezed.dart';

@RestApi()
abstract class ChatService {
  factory ChatService(Dio dio, {String? baseUrl}) = _ChatService;

  @GET("/chats")
  Future<List<ChatResponseItem>> list();
}

@freezed
abstract class ChatResponseItem with _$ChatResponseItem {
  const factory ChatResponseItem({
    required int id,
    required String name,
    @JsonKey(name: "last_message") required MessageResponseItem lastMessage,
  }) = _ChatResponseItem;

  factory ChatResponseItem.fromJson(Map<String, Object?> json) =>
      _$ChatResponseItemFromJson(json);
}
