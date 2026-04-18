import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:flutter/foundation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/error.dart';
import 'package:openrent_client/data/remote/product.dart';

Dio createDio() {
  final dio = Dio(BaseOptions(
      baseUrl: "http://localhost:1323/"
  ));
  if (kIsWeb) {
    (dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials = true;
  }
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}

final dioInstance = createDio();
final authService = AuthService(dioInstance);
final productService = ProductService(dioInstance);