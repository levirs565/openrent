import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/register/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(
        RegisterState(
          email: "",
          name: "",
          password: "",
          repeatPassword: "",
          submissionStatus: RegisterSubmissionStatus.idle,
        ),
      );

  void onEmailChanged(String email) => emit(state.copyWith(email: email));

  void onNameChanged(String name) => emit(state.copyWith(name: name));

  void onPasswordChanged(String password) =>
      emit(state.copyWith(password: password));

  void onRepeatPasswordChanged(String repeatPassword) =>
      emit(state.copyWith(repeatPassword: repeatPassword));

  Future<void> onSubmit() async {
    emit(state.copyWith(submissionStatus: RegisterSubmissionStatus.submitting));

    final result = await _authRepository.register(
      email: state.email,
      name: state.name,
      password: state.password,
    );

    if (result is ResultError) {
      emit(state.copyWith(
        submissionStatus: RegisterSubmissionStatus.idle,
        error: GeneralErrorData.general(message: result.message)
      ));
    } else if (result is ResultSuccess) {
      emit(state.copyWith(
        submissionStatus: RegisterSubmissionStatus.finished
      ));
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
