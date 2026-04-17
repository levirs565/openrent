import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

  @POST("/auth/register")
  Future<ActionResponse> register(@Body() RegisterRequest data);

  @POST("/auth/login")
  Future<ActionResponse> login(@Body() LoginRequest data);

  @GET("/auth/state")
  Future<UserStateResponse?> getUserState();

  @POST("/auth/logout")
  Future<ActionResponse> logout();
}

@JsonSerializable()
class RegisterRequest {
  final String email;
  final String name;
  final String password;

  RegisterRequest({
    required this.email,
    required this.name,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class ActionResponse {
  final bool success;

  ActionResponse({required this.success});

  factory ActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActionResponseToJson(this);
}

@JsonSerializable()
class UserStateResponse {
  final String email;
  final String name;
  final String role;

  UserStateResponse({
    required this.email,
    required this.name,
    required this.role,
  });

  factory UserStateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateResponseToJson(this);
}
