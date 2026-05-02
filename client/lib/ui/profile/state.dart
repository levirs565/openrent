import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isUploadingAvatar,
    required GeneralErrorData? error,
  }) = _ProfileState;
}
