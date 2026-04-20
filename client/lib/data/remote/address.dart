import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:retrofit/retrofit.dart';

part 'address.g.dart';

@RestApi()
abstract class AddressService {
  factory AddressService(Dio dio, {String? baseUrl}) = _AddressService;

  @GET("/addresses")
  Future<List<AddressResponseItem>> listAddress();

  @POST("/addresses")
  Future<AddressResponseItem> add(@Body() AddressAddRequest request);

  @GET("/addresses/{id}")
  Future<AddressResponseItem> getById(@Path("id") int id);

  @PUT("/addresses/{id}")
  Future<AddressResponseItem> updateById(
    @Path("id") int id,
    @Body() AddressAddRequest request,
  );

  @DELETE("/addresses/{id}")
  Future<ActionResponse> deleteById(@Path("id") int id);
}

@JsonSerializable()
class AddressResponseItem {
  final int id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final String name;
  final String province;
  final String regency;
  final String district;
  final String detail;
  final double lat, lng;

  AddressResponseItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.province,
    required this.regency,
    required this.district,
    required this.detail,
    required this.lat,
    required this.lng,
  });

  factory AddressResponseItem.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseItemToJson(this);
}

@JsonSerializable()
class AddressAddRequest {
  final String name;
  final String province;
  final String regency;
  final String district;
  final String detail;
  final double lat, lng;

  AddressAddRequest({
    required this.name,
    required this.province,
    required this.regency,
    required this.district,
    required this.detail,
    required this.lat,
    required this.lng,
  });

  factory AddressAddRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressAddRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressAddRequestToJson(this);
}
