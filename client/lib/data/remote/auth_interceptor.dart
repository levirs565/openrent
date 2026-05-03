import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/token_storage.dart';

import 'error.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenStorage storage;
  final AuthService authService;

  bool _isRefreshing = false;
  final _pendingRequests =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  AuthInterceptor({
    required this.dio,
    required this.storage,
    required this.authService,
  });

  static final List<String> excludedPath = [
    "/auth/login",
    "/auth/refresh_token",
    "/auth/logout",
  ];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (excludedPath.any((path) => options.path.contains(path))) {
      return handler.next(options);
    }
    final accessToken = await storage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    debugPrint("[AuthInterceptor] refreshing token");
    try {
      final errorData = ErrorResponse.fromJson(err.response?.data);
      if (errorData.message != "invalid token") {
        return handler.next(err);
      }
    } catch (e) {
      debugPrint('[AuthInterceptor] Failed to parse ErrorResponse: $e');
    }

    final options = err.requestOptions;

    if (excludedPath.any((path) => options.path.contains(path))) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      _pendingRequests.add((options: options, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await storage.getRefreshToken();
      debugPrint('[AuthInterceptor] Refresh token: $refreshToken');
      if (refreshToken == null) throw Exception('No refresh token');
      final newTokens = await authService.refreshToken(
        RefreshTokenRequest(refreshToken: refreshToken),
      );

      await storage.saveTokens(
        accessToken: newTokens.accessToken,
        refreshToken: newTokens.refreshToken,
      );

      await _retryRequest(options, newTokens.accessToken, handler);

      for (final pending in _pendingRequests) {
        await _retryRequest(
          pending.options,
          newTokens.accessToken,
          pending.handler,
        );
      }
    } catch (e) {
      if (e is DioException && e.response != null && e.response?.data != null) {
        try {
          final errorData = ErrorResponse.fromJson(e.response?.data);
          if (errorData.message == "invalid refresh token") {
            await storage.clearTokens();
          }
        } catch (e) {
          debugPrint('[AuthInterceptor] Failed to parse ErrorResponse: $e');
        }
      }
      final rejectError = e is DioException ? e : err;
      for (final pending in _pendingRequests) {
        pending.handler.next(rejectError);
      }
      handler.next(rejectError);
    } finally {
      _pendingRequests.clear();
      _isRefreshing = false;
    }
  }

  Future<void> _retryRequest(
    RequestOptions options,
    String newAccessToken,
    ErrorInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer $newAccessToken';
    try {
      final response = await dio.fetch(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
