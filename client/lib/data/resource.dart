import 'package:dio/dio.dart';
import 'package:openrent_client/data/remote/error.dart';

sealed class Resource<T> {
  const Resource();
}

class ResourceLoading<T> extends Resource<T> {}

class ResourceSuccess<T> extends Resource<T> {
  final T data;
  const ResourceSuccess(this.data);
}

class ResourceError<T> extends Resource<T> {
  final String message;
  const ResourceError(this.message);
}

sealed class Result<T> {
  const Result();
}

class ResultSuccess<T> extends Result<T> {
  final T data;
  const ResultSuccess(this.data);
}

class ResultError<T> extends Result<T> {
  final String message;
  const ResultError(this.message);
}

Result<T> mapDioErrorToResult<T>(Object e) {
  if (e is DioException) {
    if (e.error is ErrorResponse) {
      return ResultError((e.error as ErrorResponse).message);
    }
    return ResultError(e.toString());
  }
  return ResultError(e.toString());
}