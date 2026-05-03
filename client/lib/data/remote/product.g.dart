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

_ProductResponseItemShort _$ProductResponseItemShortFromJson(
  Map<String, dynamic> json,
) => _ProductResponseItemShort(
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
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$ProductResponseItemShortToJson(
  _ProductResponseItemShort instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'stock': instance.stock,
  'address': instance.address,
  'image_url': instance.imageUrl,
};

_ProductResponseItemDetail _$ProductResponseItemDetailFromJson(
  Map<String, dynamic> json,
) => _ProductResponseItemDetail(
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
  imageUrl: json['image_url'] as String?,
  topReviews: (json['top_reviews'] as List<dynamic>)
      .map((e) => ProductReviewDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  availability: (json['availability'] as List<dynamic>)
      .map((e) => ProductRentsAvailability.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductResponseItemDetailToJson(
  _ProductResponseItemDetail instance,
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
  'image_url': instance.imageUrl,
  'top_reviews': instance.topReviews,
  'availability': instance.availability,
};

_MyProductResponseItemShort _$MyProductResponseItemShortFromJson(
  Map<String, dynamic> json,
) => _MyProductResponseItemShort(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  pricePerDay: (json['price_per_day'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  address: MyProductAddressShort.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
  rentCount: MyProductRentCount.fromJson(
    json['rent_count'] as Map<String, dynamic>,
  ),
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$MyProductResponseItemShortToJson(
  _MyProductResponseItemShort instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'stock': instance.stock,
  'address': instance.address,
  'rent_count': instance.rentCount,
  'image_url': instance.imageUrl,
};

_MyProductAddressShort _$MyProductAddressShortFromJson(
  Map<String, dynamic> json,
) => _MyProductAddressShort(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$MyProductAddressShortToJson(
  _MyProductAddressShort instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_MyProductRentCount _$MyProductRentCountFromJson(Map<String, dynamic> json) =>
    _MyProductRentCount(
      pending: (json['pending'] as num).toInt(),
      ready: (json['ready'] as num).toInt(),
      onRent: (json['on_rent'] as num).toInt(),
      pendingReturn: (json['pending_return'] as num).toInt(),
      late: (json['late'] as num).toInt(),
    );

Map<String, dynamic> _$MyProductRentCountToJson(_MyProductRentCount instance) =>
    <String, dynamic>{
      'pending': instance.pending,
      'ready': instance.ready,
      'on_rent': instance.onRent,
      'pending_return': instance.pendingReturn,
      'late': instance.late,
    };

_MyProductResponseItem _$MyProductResponseItemFromJson(
  Map<String, dynamic> json,
) => _MyProductResponseItem(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  pricePerDay: (json['price_per_day'] as num).toInt(),
  lateFeePerDay: (json['late_fee_per_day'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  description: json['description'] as String,
  address: MyProductAddress.fromJson(json['address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MyProductResponseItemToJson(
  _MyProductResponseItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'late_fee_per_day': instance.lateFeePerDay,
  'stock': instance.stock,
  'description': instance.description,
  'address': instance.address,
};

_MyProductAddress _$MyProductAddressFromJson(Map<String, dynamic> json) =>
    _MyProductAddress(
      id: (json['id'] as num).toInt(),
      province: json['province'] as String,
      regency: json['regency'] as String,
      district: json['district'] as String,
      detail: json['detail'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MyProductAddressToJson(_MyProductAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province': instance.province,
      'regency': instance.regency,
      'district': instance.district,
      'detail': instance.detail,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
    };

_MyProductResponseItemDetail _$MyProductResponseItemDetailFromJson(
  Map<String, dynamic> json,
) => _MyProductResponseItemDetail(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  pricePerDay: (json['price_per_day'] as num).toInt(),
  lateFeePerDay: (json['late_fee_per_day'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  description: json['description'] as String,
  address: MyProductAddress.fromJson(json['address'] as Map<String, dynamic>),
  topReviews: (json['top_reviews'] as List<dynamic>)
      .map((e) => ProductReviewDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  rents: (json['rents'] as List<dynamic>)
      .map((e) => MyProductRentItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$MyProductResponseItemDetailToJson(
  _MyProductResponseItemDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'name': instance.name,
  'price_per_day': instance.pricePerDay,
  'late_fee_per_day': instance.lateFeePerDay,
  'stock': instance.stock,
  'description': instance.description,
  'address': instance.address,
  'top_reviews': instance.topReviews,
  'rents': instance.rents,
  'image_url': instance.imageUrl,
};

_MyProductRentItem _$MyProductRentItemFromJson(Map<String, dynamic> json) =>
    _MyProductRentItem(
      id: (json['id'] as num).toInt(),
      user: ProductUserData.fromJson(json['user'] as Map<String, dynamic>),
      state: $enumDecode(_$RentStateEnumMap, json['state']),
      startDate: const Iso8601Converter().fromJson(
        json['start_date'] as String,
      ),
      endDate: const Iso8601Converter().fromJson(json['end_date'] as String),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$MyProductRentItemToJson(_MyProductRentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'state': _$RentStateEnumMap[instance.state]!,
      'start_date': const Iso8601Converter().toJson(instance.startDate),
      'end_date': const Iso8601Converter().toJson(instance.endDate),
      'quantity': instance.quantity,
    };

const _$RentStateEnumMap = {
  RentState.pendingApproval: 'pending',
  RentState.awaitingInitialPayment: 'initial_payment',
  RentState.readyForPickup: 'ready',
  RentState.awaitingHandover: 'handover_pending',
  RentState.onRent: 'on_rent',
  RentState.awaitingReturnConfirmation: 'return_pending',
  RentState.awaitingFinalPayment: 'final_payment',
  RentState.completed: 'completed',
  RentState.cancelled: 'cancelled',
};

_ProductRentsAvailability _$ProductRentsAvailabilityFromJson(
  Map<String, dynamic> json,
) => _ProductRentsAvailability(
  startDate: const Iso8601Converter().fromJson(json['start_date'] as String),
  endDate: const Iso8601Converter().fromJson(json['end_date'] as String),
  quantity: (json['quantity'] as num).toInt(),
  isOverdue: json['is_overdue'] as bool,
);

Map<String, dynamic> _$ProductRentsAvailabilityToJson(
  _ProductRentsAvailability instance,
) => <String, dynamic>{
  'start_date': const Iso8601Converter().toJson(instance.startDate),
  'end_date': const Iso8601Converter().toJson(instance.endDate),
  'quantity': instance.quantity,
  'is_overdue': instance.isOverdue,
};

_ProductImagePresignedRequest _$ProductImagePresignedRequestFromJson(
  Map<String, dynamic> json,
) => _ProductImagePresignedRequest(
  size: (json['size'] as num).toInt(),
  contentType: json['content_type'] as String,
);

Map<String, dynamic> _$ProductImagePresignedRequestToJson(
  _ProductImagePresignedRequest instance,
) => <String, dynamic>{
  'size': instance.size,
  'content_type': instance.contentType,
};

_ProductImagePresignedResponse _$ProductImagePresignedResponseFromJson(
  Map<String, dynamic> json,
) => _ProductImagePresignedResponse(
  name: json['name'] as String,
  url: json['url'] as String,
  method: json['method'] as String,
  headers: (json['headers'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
);

Map<String, dynamic> _$ProductImagePresignedResponseToJson(
  _ProductImagePresignedResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
  'method': instance.method,
  'headers': instance.headers,
};

_ProductImageConfirmRequest _$ProductImageConfirmRequestFromJson(
  Map<String, dynamic> json,
) => _ProductImageConfirmRequest(name: json['name'] as String);

Map<String, dynamic> _$ProductImageConfirmRequestToJson(
  _ProductImageConfirmRequest instance,
) => <String, dynamic>{'name': instance.name};

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
  Future<List<MyProductResponseItemShort>> getMyProductList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<MyProductResponseItemShort>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MyProductResponseItemShort> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                MyProductResponseItemShort.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MyProductResponseItemDetail> getMyProductDetail(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<MyProductResponseItemDetail>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MyProductResponseItemDetail _value;
    try {
      _value = MyProductResponseItemDetail.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MyProductResponseItem> addProduct(ProductAddRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<MyProductResponseItem>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MyProductResponseItem _value;
    try {
      _value = MyProductResponseItem.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MyProductResponseItem> updateProduct(
    int id,
    ProductAddRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<MyProductResponseItem>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MyProductResponseItem _value;
    try {
      _value = MyProductResponseItem.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ProductImagePresignedResponse> createProductImagePresigned(
    int id,
    ProductImagePresignedRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ProductImagePresignedResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products/${id}/image/presigned-url',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProductImagePresignedResponse _value;
    try {
      _value = ProductImagePresignedResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ActionResponse> confirmProductImage(
    int id,
    ProductImageConfirmRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/products/${id}/image/confirm',
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
