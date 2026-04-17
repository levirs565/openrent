import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

enum RegisterSubmissionStatus {
  idle, submitting, finished
}

@freezed
class RegisterState with _$RegisterState {
  final String email;
  final String name;
  final String password;
  final String repeatPassword;
  final RegisterSubmissionStatus submissionStatus;
  final ErrorWithDateTime? error;

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
