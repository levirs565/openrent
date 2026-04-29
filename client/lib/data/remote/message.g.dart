// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageResponseItem _$MessageResponseItemFromJson(
  Map<String, dynamic> json,
) => _MessageResponseItem(
  id: (json['id'] as num).toInt(),
  currentUser: json['current_user'] as bool,
  createdAt: const Iso8601Converter().fromJson(json['created_at'] as String),
  updatedAt: const Iso8601Converter().fromJson(json['updated_at'] as String),
  message: json['message'] as String?,
  deletedAt: _$JsonConverterFromJson<String, DateTime>(
    json['deleted_at'],
    const Iso8601Converter().fromJson,
  ),
);

Map<String, dynamic> _$MessageResponseItemToJson(
  _MessageResponseItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'current_user': instance.currentUser,
  'created_at': const Iso8601Converter().toJson(instance.createdAt),
  'updated_at': const Iso8601Converter().toJson(instance.updatedAt),
  'message': instance.message,
  'deleted_at': _$JsonConverterToJson<String, DateTime>(
    instance.deletedAt,
    const Iso8601Converter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_MessageAddRequest _$MessageAddRequestFromJson(Map<String, dynamic> json) =>
    _MessageAddRequest(message: json['message'] as String);

Map<String, dynamic> _$MessageAddRequestToJson(_MessageAddRequest instance) =>
    <String, dynamic>{'message': instance.message};

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _MessageService implements MessageService {
  _MessageService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<MessageResponseItem>> getByOtherUser(int otherId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<MessageResponseItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/chats/${otherId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MessageResponseItem> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                MessageResponseItem.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ActionResponse> send(int otherId, MessageAddRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/chats/${otherId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ActionResponse _value;
    try {
      _value = ActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
