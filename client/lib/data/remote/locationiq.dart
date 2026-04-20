import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'locationiq.g.dart';

@RestApi()
abstract class LocationIQService {
  factory LocationIQService(Dio dio, {String? baseUrl}) = _LocationIQService;

  @GET("https://us1.locationiq.com/v1/reverse")
  Future<LocationIQResult> reverseGeocoding({
    @Query("key") required String key,
    @Query("lat") required double lat,
    @Query("lon") required double lon,
    @Query("accept-language") required String language,
    @Query("format") String format = 'json',
    @CancelRequest() CancelToken? cancelToken
  });
}

@JsonSerializable()
class LocationIQError {
  final String error;

  LocationIQError({required this.error});

  factory LocationIQError.fromJson(Map<String, dynamic> json) =>
      _$LocationIQErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LocationIQErrorToJson(this);
}

@JsonSerializable()
class LocationIQResult {
  final LocationIQAddressDetail address;

  LocationIQResult({required this.address});

  factory LocationIQResult.fromJson(Map<String, dynamic> json) =>
      _$LocationIQResultFromJson(json);

  Map<String, dynamic> toJson() => _$LocationIQResultToJson(this);
}

@JsonSerializable()
class LocationIQAddressDetail {
  final String? country;
  @JsonKey(name: "country_code")
  final String? countryCode;
  final String? postcode;
  final String? state;
  final String? city;
  final String? county;
  final String? village;
  @JsonKey(name: "city_district")
  final String? cityDistrict;

  LocationIQAddressDetail({
    required this.country,
    required this.countryCode,
    required this.postcode,
    required this.state,
    required this.city,
    required this.county,
    required this.village,
    required this.cityDistrict,
  });

  factory LocationIQAddressDetail.fromJson(Map<String, dynamic> json) =>
      _$LocationIQAddressDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LocationIQAddressDetailToJson(this);
}
