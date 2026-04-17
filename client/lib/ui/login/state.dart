import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  final String email;
  final String password;
  final bool isSubmit;
  final ErrorWithDateTime? error;

  LoginState({
    required this.email,
    required this.password,
    required this.isSubmit,
    this.error,
  });
}
