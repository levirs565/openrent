import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/message.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/data/remote/user.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/data/user.dart';
import 'package:openrent_client/ui/messages/state.dart';
import 'package:timezone/timezone.dart' as tz;

class MessagesCubit extends Cubit<MessagesState> {
  final MessageRepository _repository;
  final UserRepository _userRepository;
  StreamSubscription? _fcmSubscription;

  MessagesCubit({
    required int otherUserId,
    required String? otherUserName,
    required String? otherUserAvatarUrl,
    required MessageRepository repository,
    required UserRepository userRepository,
    required SettingsRepository settingsRepository,
  }) : _userRepository = userRepository,
       _repository = repository,
       super(
         MessagesState(
           otherUserId: otherUserId,
           list: List.empty(),
           dataStatus: .initial,
           userStatus: .initial,
           currentMessage: "",
           isActionLoading: false,
           error: null,
           otherUserName: otherUserName,
           otherUserAvatarUrl: otherUserAvatarUrl,
           timeZone: tz.getLocation(settingsRepository.getTimeZone()),
         ),
       ) {
    onRefreshUser();
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"] == "message" &&
          int.tryParse(event.data["other_id"]) == state.otherUserId) {
        onRefresh();
      }
    });
  }

  @override
  Future<void> close() {
    _fcmSubscription?.cancel();
    return super.close();
  }

  void onRefreshUser() async {
    if (state.isLoading) return;

    emit(state.copyWith(userStatus: .loading));

    final result = await _userRepository.getById(id: state.otherUserId);

    switch (result) {
      case ResultSuccess<UserResponseItemShort>():
        emit(
          state.copyWith(
            userStatus: .success,
            otherUserName: result.data.name,
            otherUserAvatarUrl: result.data.avatarUrl,
          ),
        );
        onRefresh();
      case ResultError<UserResponseItemShort>():
        emit(
          state.copyWith(
            userStatus: .fail,
            error: .new(source: .dataUser, message: result.message),
          ),
        );
    }
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _repository.getByOtherUser(state.otherUserId);

    switch (result) {
      case ResultSuccess<List<MessageResponseItem>>():
        emit(
          state.copyWith(
            dataStatus: .success,
            list: result.data.map(
              (item) => item.copyWith(
                createdAt: tz.TZDateTime.from(
                  item.createdAt,
                  state.timeZone,
                ),
              ),
            ).toList(),
          ),
        );
      case ResultError<List<MessageResponseItem>>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: .new(source: .data, message: result.message),
          ),
        );
    }
  }

  void onCurrentMessageChanged(String message) {
    emit(state.copyWith(currentMessage: message));
  }

  void onSend() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _repository.send(
      otherUserId: state.otherUserId,
      message: state.currentMessage,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false, currentMessage: ""));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: .new(source: .actionSend, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MessagesError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
