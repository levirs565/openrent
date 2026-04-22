import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  final String email;
  final String name;
  final String password;
  final String repeatPassword;
  final ActionStatus submissionStatus;
  final GeneralErrorData? error;

  RegisterState({
    required this.email,
    required this.name,
    required this.password,
    required this.repeatPassword,
    required this.submissionStatus,
    this.error,
  });

  bool get isValid => password == repeatPassword;
}
