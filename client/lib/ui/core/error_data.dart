import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_data.freezed.dart';

@freezed
abstract class ErrorData<S> with _$ErrorData<S> {
  @override
  final DateTime dateTime;

  ErrorData._({DateTime? dateTime}) : dateTime = dateTime ?? DateTime.now();

  factory ErrorData({
    required S source,
    required String message,
    DateTime? dateTime,
  }) = _ErrorData<S>;

  static ErrorData<void> general({
    required String message,
    DateTime? dateTime,
  }) {
    return ErrorData<void>(source: null, message: message, dateTime: dateTime);
  }
}

typedef GeneralErrorData = ErrorData<void>;
