import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/login/state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(LoginState(email: "", password: "", isSubmit: false));

  void onEmailChanged(String email) => emit(state.copyWith(email: email));

  void onPasswordChanged(String password) =>
      emit(state.copyWith(password: password));

  Future<void> onSubmit() async {
    emit(state.copyWith(isSubmit: true));

    final result = await _authRepository.login(state.email, state.password);

    if (result is ResultError) {
      emit(
        state.copyWith(
          isSubmit: false,
          error: GeneralErrorData.general(message: result.message),
        ),
      );
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
