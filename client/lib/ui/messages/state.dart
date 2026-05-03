import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

part 'state.freezed.dart';

enum MessagesErrorSource { data, dataUser, actionSend }

typedef MessagesError = ErrorData<MessagesErrorSource>;

@freezed
abstract class MessagesState with _$MessagesState {
  const MessagesState._();

  const factory MessagesState({
    required int otherUserId,
    required String? otherUserName,
    required String? otherUserAvatarUrl,
    required List<MessageResponseItem> list,
    required DataStatus dataStatus,
    required DataStatus userStatus,
    required String currentMessage,
    required bool isActionLoading,
    required tz.Location timeZone,
    required MessagesError? error,
  }) = _MessagesState;

  bool get isValid => currentMessage.isNotEmpty;

  bool get canEdit =>
      dataStatus == .success && userStatus == .success && !isActionLoading;

  bool get isLoading => dataStatus == .loading || isActionLoading;

  bool get canSubmit =>
      isValid &&
      !isActionLoading &&
      dataStatus == .success &&
      userStatus == .success;
}
