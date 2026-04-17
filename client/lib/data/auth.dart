import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/error.dart';
import 'package:openrent_client/data/resource.dart';

class AuthUserState extends Equatable {
  final String email;
  final String name;
  final String role;

  AuthUserState({required this.email, required this.name, required this.role});

  @override
  List<Object?> get props => [email, name, role];
}

abstract interface class AuthRepository {
  Stream<Resource<AuthUserState?>> getState();

  Future<Result<void>> register({
    required String email,
    required String name,
    required String password,
  });

  Future<Result<void>> login(String email, String password);

  Future<Result<void>> logout();

  void dispose();
}

Result<T> mapDioErrorToResult<T>(Object e) {
  if (e is DioException) {
    if (e.error is ErrorResponse) {
      return ResultError((e.error as ErrorResponse).message);
    }
    return ResultError(e.error.toString());
  }
  return ResultError(e.toString());
}

class AuthDataSource implements AuthRepository {
  final AuthService service;
  Resource<AuthUserState?> _lastState = ResourceLoading();
  final _stateController = StreamController<void>();

  AuthDataSource({required this.service});

  @override
  Stream<Resource<AuthUserState?>> getState() async* {
    // Fix Auth
    yield _lastState;
    if (_lastState is ResourceLoading) {
      yield await _getUserState();
    }
    yield* _stateController.stream.asyncMap((void _) => _getUserState());
  }

  Future<Resource<AuthUserState?>> _getUserState() async {
    try {
      final result = await service.getUserState();

      if (result != null) {
        _lastState = ResourceSuccess(
          AuthUserState(
            email: result.email,
            name: result.name,
            role: result.role,
          ),
        );
      } else {
        _lastState = ResourceSuccess(null);
      }
    } catch (_) {
      Future.delayed(Duration(seconds: 5), () {
        _stateController.add(null);
      });
    }
    return _lastState;
  }

  @override
  Future<Result<void>> register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      await service.register(
        RegisterRequest(email: email, name: name, password: password),
      );
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> login(String email, String password) async {
    try {
      await service.login(LoginRequest(email: email, password: password));
      _stateController.add(null);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await service.logout();
      _stateController.add(null);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  void dispose() {
    _stateController.close();
  }
}
