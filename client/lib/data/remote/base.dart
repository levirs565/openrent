import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openrent_client/data/remote/base.dio.dart';
import 'package:openrent_client/data/remote/error.dart';

Future<Dio> createRemoteDio() async {
  const webBackendUrl = String.fromEnvironment("WEB_BACKEND_URL");
  const mobileBackendUrl = String.fromEnvironment("MOBILE_BACKEND_URL");
  final dio = Dio(BaseOptions(
      baseUrl: kIsWeb ? webBackendUrl : mobileBackendUrl
  ));
  await configureDio(dio);
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}