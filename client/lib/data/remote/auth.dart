import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.freezed.dart';

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

  @POST("/auth/avatar/presigned-url")
  Future<UserAvatarPresignedResponse> createAvatarPresignedUrl(
    @Body() UserAvatarPresignedRequest request,
  );

  @POST("/auth/avatar/confirm")
  Future<ActionResponse> confirmAvatar(
    @Body() UserAvatarConfirmRequest request,
  );

  @POST("/auth/me/fcm")
  Future<FCMTokenAddResponse> addFCMToken(@Body() FCMTokenAddRequest request);

  @DELETE("/auth/me/fcm/{id}")
  Future<ActionResponse> deleteFCMToken(@Path() int id);
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
  final int id;
  final String email;
  final String name;
  final String role;
  @JsonKey(name: "avatar_url")
  final String? avatarUrl;

  UserStateResponse({
    required this.email,
    required this.name,
    required this.role,
    required this.id,
    required this.avatarUrl,
  });

  factory UserStateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateResponseToJson(this);
}

@freezed
abstract class UserAvatarPresignedRequest with _$UserAvatarPresignedRequest {
  const factory UserAvatarPresignedRequest({
    required int size,
    @JsonKey(name: "content_type") required String contentType,
  }) = _UserAvatarPresignedRequest;

  factory UserAvatarPresignedRequest.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarPresignedRequestFromJson(json);
}

@freezed
abstract class UserAvatarPresignedResponse with _$UserAvatarPresignedResponse {
  const factory UserAvatarPresignedResponse({
    required String name,
    required String url,
    required String method,
    required Map<String, List<String>> headers,
  }) = _UserAvatarPresignedResponse;

  factory UserAvatarPresignedResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarPresignedResponseFromJson(json);
}

@freezed
abstract class UserAvatarConfirmRequest with _$UserAvatarConfirmRequest {
  const factory UserAvatarConfirmRequest({required String name}) =
      _UserAvatarConfirmRequest;

  factory UserAvatarConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarConfirmRequestFromJson(json);
}

@freezed
abstract class FCMTokenAddRequest with _$FCMTokenAddRequest {
  const factory FCMTokenAddRequest({required String token}) =
      _FCMTokenAddRequest;

  factory FCMTokenAddRequest.fromJson(Map<String, dynamic> json) =>
      _$FCMTokenAddRequestFromJson(json);
}

@freezed
abstract class FCMTokenAddResponse with _$FCMTokenAddResponse {
  const factory FCMTokenAddResponse({required int id}) =
      _FCMTokenAddResponse;

  factory FCMTokenAddResponse.fromJson(Map<String, dynamic> json) =>
      _$FCMTokenAddResponseFromJson(json);
}