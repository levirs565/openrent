import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class ChatRepository {
  Future<Result<List<ChatResponseItem>>> getAll();
}

class ChatDataSource implements ChatRepository {
  final ChatService _chatService;

  ChatDataSource({required ChatService chatService})
    : _chatService = chatService;

  @override
  Future<Result<List<ChatResponseItem>>> getAll() async {
    try {
      final result = await _chatService.list();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
