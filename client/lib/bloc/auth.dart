import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';

sealed class AuthBlocEvent {
  const AuthBlocEvent();
}

final class AuthBlocEventStart extends AuthBlocEvent {}
final class AuthBlocEventLogout extends AuthBlocEvent {}

class AuthBlocState extends Equatable {
  final Resource<AuthUserState?> state;

  const AuthBlocState({required this.state});

  @override
  List<Object?> get props => [state];
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthBlocState(state: ResourceLoading())) {
    on<AuthBlocEventStart>(_onStart);
    on<AuthBlocEventLogout>(_onLogout);
  }

  Future<void> _onStart(
    AuthBlocEventStart event,
    Emitter<AuthBlocState> emit,
  ) async {
    return emit.onEach(
      _authRepository.getState(),
      onData: (state) {
        return emit(AuthBlocState(state  : state));
      },
    );
  }

  Future<void> _onLogout(
    AuthBlocEventLogout event,
    Emitter<AuthBlocState> emit,
  ) async {
    await _authRepository.logout();
  }
}
