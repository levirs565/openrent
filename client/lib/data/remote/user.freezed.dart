// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResponseItemShort {

 int get id; String get name;@JsonKey(name: "avatar_url") String? get avatarUrl;
/// Create a copy of UserResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponseItemShortCopyWith<UserResponseItemShort> get copyWith => _$UserResponseItemShortCopyWithImpl<UserResponseItemShort>(this as UserResponseItemShort, _$identity);

  /// Serializes this UserResponseItemShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponseItemShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'UserResponseItemShort(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserResponseItemShortCopyWith<$Res>  {
  factory $UserResponseItemShortCopyWith(UserResponseItemShort value, $Res Function(UserResponseItemShort) _then) = _$UserResponseItemShortCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: "avatar_url") String? avatarUrl
});




}
/// @nodoc
class _$UserResponseItemShortCopyWithImpl<$Res>
    implements $UserResponseItemShortCopyWith<$Res> {
  _$UserResponseItemShortCopyWithImpl(this._self, this._then);

  final UserResponseItemShort _self;
  final $Res Function(UserResponseItemShort) _then;

/// Create a copy of UserResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResponseItemShort].
extension UserResponseItemShortPatterns on UserResponseItemShort {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponseItemShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponseItemShort() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponseItemShort value)  $default,){
final _that = this;
switch (_that) {
case _UserResponseItemShort():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponseItemShort value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponseItemShort() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "avatar_url")  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponseItemShort() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "avatar_url")  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _UserResponseItemShort():
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: "avatar_url")  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserResponseItemShort() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponseItemShort implements UserResponseItemShort {
  const _UserResponseItemShort({required this.id, required this.name, @JsonKey(name: "avatar_url") required this.avatarUrl});
  factory _UserResponseItemShort.fromJson(Map<String, dynamic> json) => _$UserResponseItemShortFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: "avatar_url") final  String? avatarUrl;

/// Create a copy of UserResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponseItemShortCopyWith<_UserResponseItemShort> get copyWith => __$UserResponseItemShortCopyWithImpl<_UserResponseItemShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponseItemShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponseItemShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'UserResponseItemShort(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserResponseItemShortCopyWith<$Res> implements $UserResponseItemShortCopyWith<$Res> {
  factory _$UserResponseItemShortCopyWith(_UserResponseItemShort value, $Res Function(_UserResponseItemShort) _then) = __$UserResponseItemShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: "avatar_url") String? avatarUrl
});




}
/// @nodoc
class __$UserResponseItemShortCopyWithImpl<$Res>
    implements _$UserResponseItemShortCopyWith<$Res> {
  __$UserResponseItemShortCopyWithImpl(this._self, this._then);

  final _UserResponseItemShort _self;
  final $Res Function(_UserResponseItemShort) _then;

/// Create a copy of UserResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,}) {
  return _then(_UserResponseItemShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
