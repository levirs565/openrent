import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String message;

  ErrorResponse({required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null && err.response?.data != null) {
      try {
        final error = ErrorResponse.fromJson(err.response?.data);
        final exception = DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: error,
        );
        return handler.next(exception);
      } catch (_) {
        return handler.next(err);
      }
    }
    super.onError(err, handler);
  }
}
