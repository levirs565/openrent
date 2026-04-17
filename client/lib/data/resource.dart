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