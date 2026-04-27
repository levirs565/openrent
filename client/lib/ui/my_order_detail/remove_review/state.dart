import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class RemoveReviewState with _$RemoveReviewState {
  const RemoveReviewState._();

  const factory RemoveReviewState({
    required int id,
    required ActionStatus submitState,
    required GeneralErrorData? error,
  }) = _RemoveReviewState;

  bool get isLoading => submitState == .loading;
  bool get canSubmit => !isLoading;
}
