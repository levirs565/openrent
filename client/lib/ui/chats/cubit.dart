import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/chat.dart';
import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/chats/state.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

class ChatsCubit extends Cubit<ChatsState> {
  final ChatRepository _repository;
  StreamSubscription? _fcmSubscription;

  ChatsCubit({
    required ChatRepository repository,
    required SettingsRepository settingsRepository,
  }) : _repository = repository,
       super(
         ChatsState(
           isLoading: false,
           list: List.empty(),
           error: null,
           timeZone: tz.getLocation(settingsRepository.getTimeZone()),
         ),
       ) {
    onRefresh();
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"] == "message") {
        onRefresh();
      }
    });
  }

  @override
  Future<void> close() {
    _fcmSubscription?.cancel();
    return super.close();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _repository.getAll();

    switch (result) {
      case ResultSuccess<List<ChatResponseItem>>():
        emit(
          state.copyWith(
            isLoading: false,
            list: result.data
                .map(
                  (element) => element.copyWith(
                    lastMessage: element.lastMessage.copyWith(
                      createdAt: tz.TZDateTime.from(
                        element.lastMessage.createdAt.toLocal(),
                        state.timeZone,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      case ResultError<List<ChatResponseItem>>():
        emit(state.copyWith(error: .general(message: result.message)));
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
