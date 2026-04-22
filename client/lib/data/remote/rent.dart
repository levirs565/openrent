import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openrent_client/data/remote/auth.dart';
import 'package:openrent_client/data/remote/converter.dart';
import 'package:retrofit/retrofit.dart';

part 'rent.g.dart';

@RestApi()
abstract class RentService {
  factory RentService(Dio dio, {String? baseUrl}) = _RentService;

  @POST("/products/{id}/rent")
  Future<ActionResponse> rent(
    @Path("id") int productId,
    @Body() ProductRentRequest request,
  );
}

@JsonSerializable()
@Iso8601Converter()
class ProductRentRequest {
  @JsonKey(name: "start_date")
  final DateTime startDate;
  @JsonKey(name: "end_date")
  final DateTime endDate;
  final int quantity;

  ProductRentRequest({
    required this.startDate,
    required this.endDate,
    required this.quantity,
  });

  factory ProductRentRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRentRequestToJson(this);
}
