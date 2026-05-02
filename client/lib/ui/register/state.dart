import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    required String email,
    required String name,
    required String password,
    required String repeatPassword,
    required ActionStatus submissionStatus,
    GeneralErrorData? error,
  }) = _RegisterState;

  bool get isValid => password == repeatPassword;
}
