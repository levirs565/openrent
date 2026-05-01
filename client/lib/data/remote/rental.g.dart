// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentalProductShort _$RentalProductShortFromJson(Map<String, dynamic> json) =>
    _RentalProductShort(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$RentalProductShortToJson(_RentalProductShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

_RentalUserShort _$RentalUserShortFromJson(Map<String, dynamic> json) =>
    _RentalUserShort(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$RentalUserShortToJson(_RentalUserShort instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_RentalResponseItem _$RentalResponseItemFromJson(
  Map<String, dynamic> json,
) => _RentalResponseItem(
  id: (json['id'] as num).toInt(),
  product: RentalProductShort.fromJson(json['product'] as Map<String, dynamic>),
  user: RentalUserShort.fromJson(json['user'] as Map<String, dynamic>),
  state: $enumDecode(_$RentStateEnumMap, json['state']),
  startDate: const Iso8601Converter().fromJson(json['start_date'] as String),
  endDate: const Iso8601Converter().fromJson(json['end_date'] as String),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$RentalResponseItemToJson(_RentalResponseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
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

_RentalUserDetails _$RentalUserDetailsFromJson(Map<String, dynamic> json) =>
    _RentalUserDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$RentalUserDetailsToJson(_RentalUserDetails instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_RentCancellation _$RentCancellationFromJson(Map<String, dynamic> json) =>
    _RentCancellation(
      reason: $enumDecode(_$RentCancelReasonEnumMap, json['reason']),
      note: json['note'] as String,
    );

Map<String, dynamic> _$RentCancellationToJson(_RentCancellation instance) =>
    <String, dynamic>{
      'reason': _$RentCancelReasonEnumMap[instance.reason]!,
      'note': instance.note,
    };

const _$RentCancelReasonEnumMap = {
  RentCancelReason.approvalTimeout: 'approval_timeout',
  RentCancelReason.ownerRejected: 'owner_rejected',
  RentCancelReason.initialPaymentTimeout: 'initial_payment_timeout',
  RentCancelReason.ownerCancelled: 'owner_cancelled',
  RentCancelReason.userCancelled: 'user_cancelled',
};

_RentalReviewDetails _$RentalReviewDetailsFromJson(Map<String, dynamic> json) =>
    _RentalReviewDetails(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$RentalReviewDetailsToJson(
  _RentalReviewDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'rating': instance.rating,
  'content': instance.content,
};

_RentalResponseItemDetails _$RentalResponseItemDetailsFromJson(
  Map<String, dynamic> json,
) => _RentalResponseItemDetails(
  id: (json['id'] as num).toInt(),
  product: RentalProductShort.fromJson(json['product'] as Map<String, dynamic>),
  user: RentalUserDetails.fromJson(json['user'] as Map<String, dynamic>),
  review: json['review'] == null
      ? null
      : RentalReviewDetails.fromJson(json['review'] as Map<String, dynamic>),
  state: $enumDecode(_$RentStateEnumMap, json['state']),
  startDate: const Iso8601Converter().fromJson(json['start_date'] as String),
  endDate: const Iso8601Converter().fromJson(json['end_date'] as String),
  quantity: (json['quantity'] as num).toInt(),
  cancellation: json['cancellation'] == null
      ? null
      : RentCancellation.fromJson(json['cancellation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RentalResponseItemDetailsToJson(
  _RentalResponseItemDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'user': instance.user,
  'review': instance.review,
  'state': _$RentStateEnumMap[instance.state]!,
  'start_date': const Iso8601Converter().toJson(instance.startDate),
  'end_date': const Iso8601Converter().toJson(instance.endDate),
  'quantity': instance.quantity,
  'cancellation': instance.cancellation,
};

_RentalRejectRequest _$RentalRejectRequestFromJson(Map<String, dynamic> json) =>
    _RentalRejectRequest(note: json['note'] as String);

Map<String, dynamic> _$RentalRejectRequestToJson(
  _RentalRejectRequest instance,
) => <String, dynamic>{'note': instance.note};

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _RentalService implements RentalService {
  _RentalService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<RentalResponseItem>> list() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<RentalResponseItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<RentalResponseItem> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                RentalResponseItem.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RentalResponseItemDetails> getById(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<RentalResponseItemDetails>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, Object?>>(_options);
    late RentalResponseItemDetails _value;
    try {
      _value = RentalResponseItemDetails.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ActionResponse> approve(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents/${id}/approve',
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

  @override
  Future<ActionResponse> reject(int id, RentalRejectRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents/${id}/reject',
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

  @override
  Future<ActionResponse> handover(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents/${id}/handover',
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

  @override
  Future<ActionResponse> confirmReturn(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/owner/rents/${id}/confirm_return',
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
