import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalRejectState with _$MyRentalRejectState {
  const MyRentalRejectState._();

  const factory MyRentalRejectState({
    required int id,
    required String note,
    required bool isLoading,
    required bool isFinished,
    required GeneralErrorData? error,
  }) = _MyRentalRejectState;

  bool get isValid => note.isNotEmpty;

  bool get canSubmit => isValid && !isLoading;
}
