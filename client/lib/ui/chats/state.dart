import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class ChatsState with _$ChatsState {
  const factory ChatsState({
    required bool isLoading,
    required List<ChatResponseItem> list,
    required GeneralErrorData? error,
  }) = _ChatsState;
}
