import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String? baseUrl}) = _UserService;

  @GET("/users/{id}")
  Future<UserResponseItemShort> getById(@Path("id") int id);
}

@freezed
abstract class UserResponseItemShort with _$UserResponseItemShort {
  const factory UserResponseItemShort({
    required int id,
    required String name,
    @JsonKey(name: "avatar_url") required String? avatarUrl,
  }) = _UserResponseItemShort;

  factory UserResponseItemShort.fromJson(Map<String, Object?> json) =>
      _$UserResponseItemShortFromJson(json);
}