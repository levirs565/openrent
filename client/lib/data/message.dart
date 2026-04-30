import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class MessageRepository {
  Future<Result<List<MessageResponseItem>>> getByOtherUser(int otherUserId);

  Future<Result<void>> send({
    required int otherUserId,
    required String message,
  });
}

class MessageDataSource implements MessageRepository {
  final MessageService _service;

  MessageDataSource({required MessageService service}) : _service = service;

  @override
  Future<Result<List<MessageResponseItem>>> getByOtherUser(
    int otherUserId,
  ) async {
    try {
      final result = await _service.getByOtherUser(otherUserId);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> send({required int otherUserId, required String message}) async {
    try {
      await _service.send(otherUserId, MessageAddRequest(message: message));
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
