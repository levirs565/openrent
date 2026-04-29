import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/resource.dart';

class AuthUserState extends Equatable {
  final int id;
  final String email;
  final String name;
  final String role;
  final String? avatarUrl;

  AuthUserState({
    required this.email,
    required this.name,
    required this.role,
    required this.id,
    required this.avatarUrl,
  });

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

  Future<Result<void>> uploadAvatar(XFile file);

  void dispose();
}

class AuthDataSource implements AuthRepository {
  final Dio _dioUploaded;
  final AuthService service;
  Resource<AuthUserState?> _lastState = ResourceLoading();
  final _stateController = StreamController<void>();

  AuthDataSource({required this.service, required Dio dioUploaded})
    : _dioUploaded = dioUploaded;

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
            id: result.id,
            email: result.email,
            name: result.name,
            role: result.role,
            avatarUrl: result.avatarUrl
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
  Future<Result<void>> uploadAvatar(XFile file) async {
    log("${await file.length()}, ${await file.mimeType}");
    final presigned = await service.createAvatarPresignedUrl(
      UserAvatarPresignedRequest(
        size: await file.length(),
        contentType: file.mimeType ?? "image/jpeg",
      ),
    );
    final headers = Map.fromEntries(
      presigned.headers.entries.map((entry) {
        if (entry.value.length == 1) {
          return MapEntry(entry.key, entry.value.first);
        }
        return MapEntry(entry.key, entry.value);
      }),
    );
    log(jsonEncode(presigned.toJson()));
    await _dioUploaded.put(
      presigned.url,
      data: await file.readAsBytes(),
      options: Options(headers: headers),
    );
    await service.confirmAvatar(UserAvatarConfirmRequest(name: presigned.name));
    _stateController.add(null);
    return ResultSuccess(null);
  }

  @override
  void dispose() {
    _stateController.close();
  }
}
