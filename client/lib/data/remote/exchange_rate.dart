import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:retrofit/retrofit.dart';

part 'exchange_rate.g.dart';
part 'exchange_rate.freezed.dart';

@RestApi()
abstract class ExchangeRateService {
  factory ExchangeRateService(Dio dio, {String? baseUrl}) =
      _ExchangeRateService;

  @GET("/exchange-rates")
  Future<ExchangeRateResponse> list();
}

@freezed
abstract class ExchangeRateResponse with _$ExchangeRateResponse {
  const factory ExchangeRateResponse({
    @JsonKey(name: "base_code") required String baseCode,
    @JsonKey(name: "conversion_rates")
    required Map<String, double> conversionRates,
    @JsonKey(name: "last_update")
    @Iso8601Converter()
    required DateTime lastUpdate,
    @JsonKey(name: "next_update")
    @Iso8601Converter()
    required DateTime nextUpdate,
  }) = _ExchangeRateResponse;

  factory ExchangeRateResponse.fromJson(Map<String, Object?> json) =>
      _$ExchangeRateResponseFromJson(json);
}
