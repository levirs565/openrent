import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/message.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/messages/state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final MessageRepository _repository;
  StreamSubscription? _fcmSubscription;

  MessagesCubit({
    required int otherUserId,
    required MessageRepository repository,
  }) : _repository = repository,
       super(
         MessagesState(
           otherUserId: otherUserId,
           list: List.empty(),
           dataStatus: .initial,
           currentMessage: "",
           isActionLoading: false,
           error: null,
         ),
       ) {
    onRefresh();
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

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _repository.getByOtherUser(state.otherUserId);

    switch (result) {
      case ResultSuccess<List<MessageResponseItem>>():
        emit(
          state.copyWith(
            dataStatus: .success,
            list: result.data,
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
