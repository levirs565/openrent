// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductUserData _$ProductUserDataFromJson(Map<String, dynamic> json) =>
    ProductUserData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductUserDataToJson(ProductUserData instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

ProductShortAddress _$ProductShortAddressFromJson(Map<String, dynamic> json) =>
    ProductShortAddress(
      id: (json['id'] as num).toInt(),
      regency: json['regency'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductShortAddressToJson(
  ProductShortAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'regency': instance.regency,
  'lat': instance.lat,
  'lng': instance.lng,
};

ProductAddress _$ProductAddressFromJson(Map<String, dynamic> json) =>
    ProductAddress(
      id: (json['id'] as num).toInt(),
      province: json['province'] as String,
      regency: json['regency'] as String,
      district: json['district'] as String,
      detail: json['detail'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductAddressToJson(ProductAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province': instance.province,
      'regency': instance.regency,
      'district': instance.district,
      'detail': instance.detail,
      'lat': instance.lat,
      'lng': instance.lng,
    };

ProductResponseItemShort _$ProductResponseItemShortFromJson(
  Map<String, dynamic> json,
) => ProductResponseItemShort(
  id: (json['id'] as num).toInt(),
  user: ProductUserData.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  pricePerDay: (json['price_per_day'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  address: ProductShortAddress.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ProductResponseItemShortToJson(
  ProductResponseItemShort instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'stock': instance.stock,
  'address': instance.address,
};

ProductResponseItem _$ProductResponseItemFromJson(Map<String, dynamic> json) =>
    ProductResponseItem(
      id: (json['id'] as num).toInt(),
      user: ProductUserData.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      pricePerDay: (json['price_per_day'] as num).toInt(),
      lateFeePerDay: (json['late_fee_per_day'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      description: json['description'] as String,
      address: ProductAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseItemToJson(
  ProductResponseItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'late_fee_per_day': instance.lateFeePerDay,
  'stock': instance.stock,
  'description': instance.description,
  'address': instance.address,
};

ProductReviewDetail _$ProductReviewDetailFromJson(Map<String, dynamic> json) =>
    ProductReviewDetail(
      (json['id'] as num).toInt(),
      ProductUserData.fromJson(json['user'] as Map<String, dynamic>),
      (json['rating'] as num).toInt(),
      json['content'] as String,
    );

Map<String, dynamic> _$ProductReviewDetailToJson(
  ProductReviewDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'rating': instance.rating,
  'content': instance.content,
};

ProductResponseItemDetail _$ProductResponseItemDetailFromJson(
  Map<String, dynamic> json,
) => ProductResponseItemDetail(
  id: (json['id'] as num).toInt(),
  user: ProductUserData.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  pricePerDay: (json['price_per_day'] as num).toInt(),
  lateFeePerDay: (json['late_fee_per_day'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  description: json['description'] as String,
  address: ProductAddress.fromJson(json['address'] as Map<String, dynamic>),
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => ProductResponseItemShort.fromJson(e as Map<String, dynamic>))
      .toList(),
  topReviews: (json['top_reviews'] as List<dynamic>)
      .map((e) => ProductReviewDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductResponseItemDetailToJson(
  ProductResponseItemDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'late_fee_per_day': instance.lateFeePerDay,
  'stock': instance.stock,
  'description': instance.description,
  'address': instance.address,
  'recommendations': instance.recommendations,
  'top_reviews': instance.topReviews,
};

ProductAddRequest _$ProductAddRequestFromJson(Map<String, dynamic> json) =>
    ProductAddRequest(
      name: json['name'] as String,
      pricePerDay: (json['price_per_day'] as num).toInt(),
      lateFeePerDay: (json['late_fee_per_day'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      description: json['description'] as String,
      addressId: (json['address_id'] as num).toInt(),
    );

Map<String, dynamic> _$ProductAddRequestToJson(ProductAddRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price_per_day': instance.pricePerDay,
      'late_fee_per_day': instance.lateFeePerDay,
      'stock': instance.stock,
      'description': instance.description,
      'address_id': instance.addressId,
    };

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _ProductService implements ProductService {
  _ProductService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<ProductResponseItemShort>> listProduct({
    bool? owner,
    String? query,
    bool? disableAiSearch,
    List<String>? regions,
    double? lat,
    double? lng,
    int? radiusKm,
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'owner': owner,
      r'q': query,
      r'no_ai_search': disableAiSearch,
      r'regions': regions,
      r'lat': lat,
      r'lng': lng,
      r'radius_km': radiusKm,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ProductResponseItemShort>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ProductResponseItemShort> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                ProductResponseItemShort.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ProductResponseItemDetail> getProduct(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ProductResponseItemDetail>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProductResponseItemDetail _value;
    try {
      _value = ProductResponseItemDetail.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ProductResponseItem> addProduct(ProductAddRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ProductResponseItem>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProductResponseItem _value;
    try {
      _value = ProductResponseItem.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ProductResponseItem> updateProduct(
    int id,
    ProductAddRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ProductResponseItem>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProductResponseItem _value;
    try {
      _value = ProductResponseItem.fromJson(_result.data!);
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
