import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/chat.dart';
import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/chats/state.dart';
import 'package:openrent_client/ui/core/error_data.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatRepository _repository;

  ChatsCubit({required ChatRepository repository})
    : _repository = repository,
      super(ChatsState(isLoading: false, list: List.empty(), error: null)) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _repository.getAll();

    switch (result) {
      case ResultSuccess<List<ChatResponseItem>>():
        emit(state.copyWith(isLoading: false, list: result.data));
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
