import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MessagesErrorSource { data, actionSend }

typedef MessagesError = ErrorData<MessagesErrorSource>;

// TODO: Other user data

@freezed
abstract class MessagesState with _$MessagesState {
  const MessagesState._();

  const factory MessagesState({
    required int otherUserId,
    required List<MessageResponseItem> list,
    required DataStatus dataStatus,
    required String currentMessage,
    required bool isActionLoading,
    required MessagesError? error,
  }) = _MessagesState;

  bool get isValid => currentMessage.isNotEmpty;

  bool get canEdit => dataStatus == .success && !isActionLoading;

  bool get isLoading =>
      dataStatus == .loading || isActionLoading;

  bool get canSubmit =>
      isValid && !isActionLoading && dataStatus == .success;
}
