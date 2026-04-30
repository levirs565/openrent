import 'dart:developer';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path/path.dart' as path;

Future<void> configureDio(Dio dio) async {
  final directory = await getApplicationDocumentsDirectory();
  final cookieJar = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(path.join(directory.path, ".cookies")),
  );
  dio.interceptors.add(CookieManager(cookieJar));

  log("Mobile: ${directory} ${path.join(directory.path, "/.cookies/")}");
}