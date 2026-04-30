import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

Future<void> configureDio(Dio dio) async {
  (dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials = true;
}
