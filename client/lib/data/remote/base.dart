import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/auth_interceptor.dart';
import 'package:openrent_client/data/remote/error.dart';
import 'package:openrent_client/data/token_storage.dart';

Future<Dio> createRemoteDio(TokenStorage tokenStorage) async {
  const webBackendUrl = String.fromEnvironment("WEB_BACKEND_URL");
  const mobileBackendUrl = String.fromEnvironment("MOBILE_BACKEND_URL");
  final dio = Dio(
    BaseOptions(baseUrl: kIsWeb ? webBackendUrl : mobileBackendUrl),
  );

  // WARNING: duplicate auth service
  final service = AuthService(dio);

  dio.interceptors.add(
    AuthInterceptor(dio: dio, storage: tokenStorage, authService: service),
  );
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}
