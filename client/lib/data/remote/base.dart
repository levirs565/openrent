import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openrent_client/data/remote/base.dio.dart';
import 'package:openrent_client/data/remote/error.dart';

Future<Dio> createRemoteDio() async {
  final dio = Dio(BaseOptions(
      baseUrl: kIsWeb ? "http://localhost:1323/" : "http://3.24.7.34:1323/"
  ));
  await configureDio(dio);
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}