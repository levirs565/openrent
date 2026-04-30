import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/biometrics/biometric.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';

sealed class AuthBlocEvent {
  const AuthBlocEvent();
}

final class AuthBlocEventStart extends AuthBlocEvent {}
final class AuthBlocEventLogout extends AuthBlocEvent {}

sealed class AuthState {}
final class AuthStateLoading extends AuthState {}
final class AuthStateBiometricFailed extends AuthState {}
final class AuthStateSuccess extends AuthState {
  final AuthUserState? user;

  AuthStateSuccess(this.user);
}

class AuthBlocState extends Equatable {
  final AuthState state;

  const AuthBlocState({required this.state});

  @override
  List<Object?> get props => [state];
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository _authRepository;
  final SettingsRepository _settingsRepository;

  AuthBloc({required AuthRepository authRepository, required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository, _authRepository = authRepository,
      super(AuthBlocState(state: AuthStateLoading())) {
    on<AuthBlocEventStart>(_onStart);
    on<AuthBlocEventLogout>(_onLogout);
  }

  @override
  Future<void> close() {
    _authRepository.dispose();
    return super.close();
  }

  Future<void> _onStart(
    AuthBlocEventStart event,
    Emitter<AuthBlocState> emit,
  ) async {
    if (_settingsRepository.getNeedBiometric() && await isBiometricSupported()) {
      try {
        final result = await biometricAuthenticate(
            reason: "Authenticate for open app");
        if (!result) {
          emit(AuthBlocState(state: AuthStateBiometricFailed()));
          return;
        }
      } catch (e) {
        emit(AuthBlocState(state: AuthStateBiometricFailed()));
        return;
      }
    }
    return emit.onEach(
      _authRepository.getState(),
      onData: (state) {
        switch (state) {
          case ResourceLoading<AuthUserState?>():
            return emit(AuthBlocState(state: AuthStateLoading()));
          case ResourceSuccess<AuthUserState?>():
            return emit(AuthBlocState(state: AuthStateSuccess(state.data)));
          case ResourceError<AuthUserState?>():
            // TODO: Handle this case. This case should not happen.
            throw UnimplementedError();
        }
      },
    );
  }

  Future<void> _onLogout(
    AuthBlocEventLogout event,
    Emitter<AuthBlocState> emit,
  ) async {
    await _authRepository.logout();
    await _settingsRepository.setNeedBiometric(false);
    if (state.state is AuthStateBiometricFailed) {
      add(AuthBlocEventStart());
    }
  }
}
