import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:flutter/foundation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/error.dart';
import 'package:openrent_client/data/remote/locationiq.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/remote/review.dart';

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
final addressService = AddressService(dioInstance);
final productService = ProductService(dioInstance);
final reviewService = ReviewService(dioInstance);
final locationIQService = LocationIQService(Dio());