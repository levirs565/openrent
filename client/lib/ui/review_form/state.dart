import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum ReviewFormErrorSource { data, submit }

typedef ReviewFormError = ErrorData<ReviewFormErrorSource>;

@freezed
abstract class ReviewFormState with _$ReviewFormState {
  const ReviewFormState._();

  factory ReviewFormState({
    required int? id,
    required int? rentId,
    required int? rating,
    required String content,
    required ReviewFormError? error,
    required DataStatus dataStatus,
    required ActionStatus submissionStatus,
  }) = _ReviewFormState;

  bool get isValid => rating != null && content.isNotEmpty;

  bool get canEdit => dataStatus == .success && submissionStatus == .idle;

  bool get isLoading => dataStatus == .loading || submissionStatus == .loading;

  bool get canSubmit =>
      isValid && submissionStatus == .idle && dataStatus == .success;
}
