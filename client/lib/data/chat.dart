import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class ChatRepository {
  Future<Result<List<ChatResponseItem>>> getAll();

  Stream<void> watchChanged();

  void dispose();
}

class ChatDataSource implements ChatRepository {
  final ChatService _chatService;
  final _updateController = StreamController<void>.broadcast();
  StreamSubscription? _fcmSubscription, _newChatSubscription;

  ChatDataSource({
    required ChatService chatService,
    required Stream<void> newChatStream,
  }) : _chatService = chatService {
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"] == "message") {
        _updateController.add(null);
      }
    });
    _newChatSubscription = newChatStream.listen((event) {
      _updateController.add(null);
    });
  }

  @override
  void dispose() {
    _fcmSubscription?.cancel();
    _newChatSubscription?.cancel();
  }

  @override
  Stream<void> watchChanged() {
    return _updateController.stream;
  }

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
