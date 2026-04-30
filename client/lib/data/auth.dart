import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:stream_transform/stream_transform.dart';

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
  final _stateTriggerController = StreamController<void>();
  final _stateController =
      StreamController<Resource<AuthUserState?>>.broadcast();
  StreamSubscription? _stateSubscription;

  int? _lastFcmTokenId;
  StreamSubscription? _fcmTokenUpdater, _fcmStateSubscription;
  Completer? _fcmTokenCompleter, _fcmTokenStopSignal;

  AuthDataSource({required this.service, required Dio dioUploaded})
    : _dioUploaded = dioUploaded {
    _stateSubscription = _stateTriggerController.stream
        .asyncMap((void _) => _getUserState())
        .listen((data) {
          _stateController.add(data);
        });
    _stateTriggerController.add(null);

    _fcmStateSubscription = _stateController.stream
        .map((state) {
          switch (state) {
            case ResourceLoading<AuthUserState?>():
              return false;
            case ResourceSuccess<AuthUserState?>():
              return state.data != null;
            case ResourceError<AuthUserState?>():
              return false;
          }
        })
        .distinct()
        .listen((data) {
          if (data) {
            _startFcmTokenUpdater();
          } else {
            _stopFcmTokenUpdater();
          }
        });
  }

  @override
  Stream<Resource<AuthUserState?>> getState() async* {
    yield _lastState;
    yield* _stateController.stream;
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
            avatarUrl: result.avatarUrl,
          ),
        );
      } else {
        _lastState = ResourceSuccess(null);
      }
    } catch (e) {
      log("Error while get state: $e");
      Future.delayed(Duration(seconds: 5), () {
        _stateTriggerController.add(null);
      });
    }
    return _lastState;
  }

  Stream<String?> _getFcmTokenStream() async* {
    const webVapidKey = String.fromEnvironment("WEB_VAPID_KEY");
    yield await FirebaseMessaging.instance.getToken(
      vapidKey: kIsWeb
          ? webVapidKey
          : null,
    );
    yield* FirebaseMessaging.instance.onTokenRefresh;
  }

  Future<void> _startFcmTokenUpdater() async {
    await _stopFcmTokenUpdater();

    final completer = Completer();
    final stopSignal = Completer();

    _fcmTokenCompleter = completer;
    _fcmTokenStopSignal = stopSignal;

    _fcmTokenUpdater = _getFcmTokenStream()
        .takeUntil(stopSignal.future)
        .asyncExpand((token) async* {
          log("FCM new token: $token");
          if (_lastFcmTokenId != null) {
            while (!stopSignal.isCompleted) {
              try {
                await service.deleteFCMToken(_lastFcmTokenId!);
                _lastFcmTokenId = null;
                break;
              } catch (e) {
                log("Error while deleting FCM token: $e");
                // TODO: continue when token not found
                await Future.any([
                  Future.delayed(Duration(seconds: 2)),
                  stopSignal.future,
                ]);
              }
            }
          }
          if (token != null) {
            while (!stopSignal.isCompleted) {
              try {
                final result = await service.addFCMToken(
                  FCMTokenAddRequest(token: token),
                );
                _lastFcmTokenId = result.id;
                log("FCM token id: ${result.id}");
                break;
              } catch (e) {
                log("Error while sending FCM token to server: $e");
                await Future.any([
                  Future.delayed(Duration(seconds: 2)),
                  stopSignal.future,
                ]);
              }
            }
          }
        })
        .listen((event) {}, onDone: () => completer.complete());
  }

  Future<void> _stopFcmTokenUpdater() async {
    if (_fcmTokenStopSignal?.isCompleted == false) {
      _fcmTokenStopSignal!.complete();
    }
    _fcmTokenStopSignal = null;
    if (_fcmTokenCompleter != null) await _fcmTokenCompleter!.future;
    _fcmTokenCompleter = null;
    _fcmTokenUpdater?.cancel();
    _fcmTokenUpdater = null;
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
      _stateTriggerController.add(null);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _stopFcmTokenUpdater();
      if (_lastFcmTokenId != null) {
        await service.deleteFCMToken(_lastFcmTokenId!);
        // TODO: When not found must not error
        _lastFcmTokenId = null;
      }
      await service.logout();
      _stateTriggerController.add(null);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> uploadAvatar(XFile file) async {
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
    _stateTriggerController.add(null);
    return ResultSuccess(null);
  }

  @override
  void dispose() {
    _fcmStateSubscription?.cancel();
    _stateSubscription?.cancel();
    _stateController.close();
    _stateTriggerController.close();
  }
}
