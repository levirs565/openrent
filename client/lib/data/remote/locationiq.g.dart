// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationiq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationIQError _$LocationIQErrorFromJson(Map<String, dynamic> json) =>
    LocationIQError(error: json['error'] as String);

Map<String, dynamic> _$LocationIQErrorToJson(LocationIQError instance) =>
    <String, dynamic>{'error': instance.error};

LocationIQResult _$LocationIQResultFromJson(Map<String, dynamic> json) =>
    LocationIQResult(
      address: LocationIQAddressDetail.fromJson(
        json['address'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LocationIQResultToJson(LocationIQResult instance) =>
    <String, dynamic>{'address': instance.address};

LocationIQAddressDetail _$LocationIQAddressDetailFromJson(
  Map<String, dynamic> json,
) => LocationIQAddressDetail(
  country: json['country'] as String?,
  countryCode: json['country_code'] as String?,
  postcode: json['postcode'] as String?,
  state: json['state'] as String?,
  city: json['city'] as String?,
  county: json['county'] as String?,
  village: json['village'] as String?,
  cityDistrict: json['city_district'] as String?,
);

Map<String, dynamic> _$LocationIQAddressDetailToJson(
  LocationIQAddressDetail instance,
) => <String, dynamic>{
  'country': instance.country,
  'country_code': instance.countryCode,
  'postcode': instance.postcode,
  'state': instance.state,
  'city': instance.city,
  'county': instance.county,
  'village': instance.village,
  'city_district': instance.cityDistrict,
};

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _LocationIQService implements LocationIQService {
  _LocationIQService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<LocationIQResult> reverseGeocoding({
    required String key,
    required double lat,
    required double lon,
    required String language,
    String format = 'json',
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': key,
      r'lat': lat,
      r'lon': lon,
      r'accept-language': language,
      r'format': format,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<LocationIQResult>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'https://us1.locationiq.com/v1/reverse',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LocationIQResult _value;
    try {
      _value = LocationIQResult.fromJson(_result.data!);
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
