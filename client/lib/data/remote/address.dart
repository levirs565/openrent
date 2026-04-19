import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'address.g.dart';

@RestApi()
abstract class AddressService {
  factory AddressService(Dio dio, {String? baseUrl}) = _AddressService;

  @GET("/addresses")
  Future<List<AddressResponseItem>> listAddress();
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
