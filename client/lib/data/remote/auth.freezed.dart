// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAvatarPresignedRequest {

 int get size;@JsonKey(name: "content_type") String get contentType;
/// Create a copy of UserAvatarPresignedRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAvatarPresignedRequestCopyWith<UserAvatarPresignedRequest> get copyWith => _$UserAvatarPresignedRequestCopyWithImpl<UserAvatarPresignedRequest>(this as UserAvatarPresignedRequest, _$identity);

  /// Serializes this UserAvatarPresignedRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAvatarPresignedRequest&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,contentType);

@override
String toString() {
  return 'UserAvatarPresignedRequest(size: $size, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class $UserAvatarPresignedRequestCopyWith<$Res>  {
  factory $UserAvatarPresignedRequestCopyWith(UserAvatarPresignedRequest value, $Res Function(UserAvatarPresignedRequest) _then) = _$UserAvatarPresignedRequestCopyWithImpl;
@useResult
$Res call({
 int size,@JsonKey(name: "content_type") String contentType
});




}
/// @nodoc
class _$UserAvatarPresignedRequestCopyWithImpl<$Res>
    implements $UserAvatarPresignedRequestCopyWith<$Res> {
  _$UserAvatarPresignedRequestCopyWithImpl(this._self, this._then);

  final UserAvatarPresignedRequest _self;
  final $Res Function(UserAvatarPresignedRequest) _then;

/// Create a copy of UserAvatarPresignedRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? contentType = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAvatarPresignedRequest].
extension UserAvatarPresignedRequestPatterns on UserAvatarPresignedRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAvatarPresignedRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAvatarPresignedRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAvatarPresignedRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size, @JsonKey(name: "content_type")  String contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest() when $default != null:
return $default(_that.size,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size, @JsonKey(name: "content_type")  String contentType)  $default,) {final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest():
return $default(_that.size,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size, @JsonKey(name: "content_type")  String contentType)?  $default,) {final _that = this;
switch (_that) {
case _UserAvatarPresignedRequest() when $default != null:
return $default(_that.size,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAvatarPresignedRequest implements UserAvatarPresignedRequest {
  const _UserAvatarPresignedRequest({required this.size, @JsonKey(name: "content_type") required this.contentType});
  factory _UserAvatarPresignedRequest.fromJson(Map<String, dynamic> json) => _$UserAvatarPresignedRequestFromJson(json);

@override final  int size;
@override@JsonKey(name: "content_type") final  String contentType;

/// Create a copy of UserAvatarPresignedRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAvatarPresignedRequestCopyWith<_UserAvatarPresignedRequest> get copyWith => __$UserAvatarPresignedRequestCopyWithImpl<_UserAvatarPresignedRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAvatarPresignedRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAvatarPresignedRequest&&(identical(other.size, size) || other.size == size)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,contentType);

@override
String toString() {
  return 'UserAvatarPresignedRequest(size: $size, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$UserAvatarPresignedRequestCopyWith<$Res> implements $UserAvatarPresignedRequestCopyWith<$Res> {
  factory _$UserAvatarPresignedRequestCopyWith(_UserAvatarPresignedRequest value, $Res Function(_UserAvatarPresignedRequest) _then) = __$UserAvatarPresignedRequestCopyWithImpl;
@override @useResult
$Res call({
 int size,@JsonKey(name: "content_type") String contentType
});




}
/// @nodoc
class __$UserAvatarPresignedRequestCopyWithImpl<$Res>
    implements _$UserAvatarPresignedRequestCopyWith<$Res> {
  __$UserAvatarPresignedRequestCopyWithImpl(this._self, this._then);

  final _UserAvatarPresignedRequest _self;
  final $Res Function(_UserAvatarPresignedRequest) _then;

/// Create a copy of UserAvatarPresignedRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? contentType = null,}) {
  return _then(_UserAvatarPresignedRequest(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserAvatarPresignedResponse {

 String get name; String get url; String get method; Map<String, List<String>> get headers;
/// Create a copy of UserAvatarPresignedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAvatarPresignedResponseCopyWith<UserAvatarPresignedResponse> get copyWith => _$UserAvatarPresignedResponseCopyWithImpl<UserAvatarPresignedResponse>(this as UserAvatarPresignedResponse, _$identity);

  /// Serializes this UserAvatarPresignedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAvatarPresignedResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,method,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'UserAvatarPresignedResponse(name: $name, url: $url, method: $method, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $UserAvatarPresignedResponseCopyWith<$Res>  {
  factory $UserAvatarPresignedResponseCopyWith(UserAvatarPresignedResponse value, $Res Function(UserAvatarPresignedResponse) _then) = _$UserAvatarPresignedResponseCopyWithImpl;
@useResult
$Res call({
 String name, String url, String method, Map<String, List<String>> headers
});




}
/// @nodoc
class _$UserAvatarPresignedResponseCopyWithImpl<$Res>
    implements $UserAvatarPresignedResponseCopyWith<$Res> {
  _$UserAvatarPresignedResponseCopyWithImpl(this._self, this._then);

  final UserAvatarPresignedResponse _self;
  final $Res Function(UserAvatarPresignedResponse) _then;

/// Create a copy of UserAvatarPresignedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,Object? method = null,Object? headers = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAvatarPresignedResponse].
extension UserAvatarPresignedResponsePatterns on UserAvatarPresignedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAvatarPresignedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAvatarPresignedResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAvatarPresignedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url,  String method,  Map<String, List<String>> headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse() when $default != null:
return $default(_that.name,_that.url,_that.method,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url,  String method,  Map<String, List<String>> headers)  $default,) {final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse():
return $default(_that.name,_that.url,_that.method,_that.headers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url,  String method,  Map<String, List<String>> headers)?  $default,) {final _that = this;
switch (_that) {
case _UserAvatarPresignedResponse() when $default != null:
return $default(_that.name,_that.url,_that.method,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAvatarPresignedResponse implements UserAvatarPresignedResponse {
  const _UserAvatarPresignedResponse({required this.name, required this.url, required this.method, required final  Map<String, List<String>> headers}): _headers = headers;
  factory _UserAvatarPresignedResponse.fromJson(Map<String, dynamic> json) => _$UserAvatarPresignedResponseFromJson(json);

@override final  String name;
@override final  String url;
@override final  String method;
 final  Map<String, List<String>> _headers;
@override Map<String, List<String>> get headers {
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_headers);
}


/// Create a copy of UserAvatarPresignedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAvatarPresignedResponseCopyWith<_UserAvatarPresignedResponse> get copyWith => __$UserAvatarPresignedResponseCopyWithImpl<_UserAvatarPresignedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAvatarPresignedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAvatarPresignedResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,method,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'UserAvatarPresignedResponse(name: $name, url: $url, method: $method, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$UserAvatarPresignedResponseCopyWith<$Res> implements $UserAvatarPresignedResponseCopyWith<$Res> {
  factory _$UserAvatarPresignedResponseCopyWith(_UserAvatarPresignedResponse value, $Res Function(_UserAvatarPresignedResponse) _then) = __$UserAvatarPresignedResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String url, String method, Map<String, List<String>> headers
});




}
/// @nodoc
class __$UserAvatarPresignedResponseCopyWithImpl<$Res>
    implements _$UserAvatarPresignedResponseCopyWith<$Res> {
  __$UserAvatarPresignedResponseCopyWithImpl(this._self, this._then);

  final _UserAvatarPresignedResponse _self;
  final $Res Function(_UserAvatarPresignedResponse) _then;

/// Create a copy of UserAvatarPresignedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,Object? method = null,Object? headers = null,}) {
  return _then(_UserAvatarPresignedResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}


/// @nodoc
mixin _$UserAvatarConfirmRequest {

 String get name;
/// Create a copy of UserAvatarConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAvatarConfirmRequestCopyWith<UserAvatarConfirmRequest> get copyWith => _$UserAvatarConfirmRequestCopyWithImpl<UserAvatarConfirmRequest>(this as UserAvatarConfirmRequest, _$identity);

  /// Serializes this UserAvatarConfirmRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAvatarConfirmRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UserAvatarConfirmRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class $UserAvatarConfirmRequestCopyWith<$Res>  {
  factory $UserAvatarConfirmRequestCopyWith(UserAvatarConfirmRequest value, $Res Function(UserAvatarConfirmRequest) _then) = _$UserAvatarConfirmRequestCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$UserAvatarConfirmRequestCopyWithImpl<$Res>
    implements $UserAvatarConfirmRequestCopyWith<$Res> {
  _$UserAvatarConfirmRequestCopyWithImpl(this._self, this._then);

  final UserAvatarConfirmRequest _self;
  final $Res Function(UserAvatarConfirmRequest) _then;

/// Create a copy of UserAvatarConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAvatarConfirmRequest].
extension UserAvatarConfirmRequestPatterns on UserAvatarConfirmRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAvatarConfirmRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAvatarConfirmRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAvatarConfirmRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _UserAvatarConfirmRequest() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAvatarConfirmRequest implements UserAvatarConfirmRequest {
  const _UserAvatarConfirmRequest({required this.name});
  factory _UserAvatarConfirmRequest.fromJson(Map<String, dynamic> json) => _$UserAvatarConfirmRequestFromJson(json);

@override final  String name;

/// Create a copy of UserAvatarConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAvatarConfirmRequestCopyWith<_UserAvatarConfirmRequest> get copyWith => __$UserAvatarConfirmRequestCopyWithImpl<_UserAvatarConfirmRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAvatarConfirmRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAvatarConfirmRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UserAvatarConfirmRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserAvatarConfirmRequestCopyWith<$Res> implements $UserAvatarConfirmRequestCopyWith<$Res> {
  factory _$UserAvatarConfirmRequestCopyWith(_UserAvatarConfirmRequest value, $Res Function(_UserAvatarConfirmRequest) _then) = __$UserAvatarConfirmRequestCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$UserAvatarConfirmRequestCopyWithImpl<$Res>
    implements _$UserAvatarConfirmRequestCopyWith<$Res> {
  __$UserAvatarConfirmRequestCopyWithImpl(this._self, this._then);

  final _UserAvatarConfirmRequest _self;
  final $Res Function(_UserAvatarConfirmRequest) _then;

/// Create a copy of UserAvatarConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_UserAvatarConfirmRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FCMTokenAddRequest {

 String get token;
/// Create a copy of FCMTokenAddRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FCMTokenAddRequestCopyWith<FCMTokenAddRequest> get copyWith => _$FCMTokenAddRequestCopyWithImpl<FCMTokenAddRequest>(this as FCMTokenAddRequest, _$identity);

  /// Serializes this FCMTokenAddRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FCMTokenAddRequest&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'FCMTokenAddRequest(token: $token)';
}


}

/// @nodoc
abstract mixin class $FCMTokenAddRequestCopyWith<$Res>  {
  factory $FCMTokenAddRequestCopyWith(FCMTokenAddRequest value, $Res Function(FCMTokenAddRequest) _then) = _$FCMTokenAddRequestCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$FCMTokenAddRequestCopyWithImpl<$Res>
    implements $FCMTokenAddRequestCopyWith<$Res> {
  _$FCMTokenAddRequestCopyWithImpl(this._self, this._then);

  final FCMTokenAddRequest _self;
  final $Res Function(FCMTokenAddRequest) _then;

/// Create a copy of FCMTokenAddRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FCMTokenAddRequest].
extension FCMTokenAddRequestPatterns on FCMTokenAddRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FCMTokenAddRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FCMTokenAddRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FCMTokenAddRequest value)  $default,){
final _that = this;
switch (_that) {
case _FCMTokenAddRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FCMTokenAddRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FCMTokenAddRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FCMTokenAddRequest() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token)  $default,) {final _that = this;
switch (_that) {
case _FCMTokenAddRequest():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token)?  $default,) {final _that = this;
switch (_that) {
case _FCMTokenAddRequest() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FCMTokenAddRequest implements FCMTokenAddRequest {
  const _FCMTokenAddRequest({required this.token});
  factory _FCMTokenAddRequest.fromJson(Map<String, dynamic> json) => _$FCMTokenAddRequestFromJson(json);

@override final  String token;

/// Create a copy of FCMTokenAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FCMTokenAddRequestCopyWith<_FCMTokenAddRequest> get copyWith => __$FCMTokenAddRequestCopyWithImpl<_FCMTokenAddRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FCMTokenAddRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FCMTokenAddRequest&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'FCMTokenAddRequest(token: $token)';
}


}

/// @nodoc
abstract mixin class _$FCMTokenAddRequestCopyWith<$Res> implements $FCMTokenAddRequestCopyWith<$Res> {
  factory _$FCMTokenAddRequestCopyWith(_FCMTokenAddRequest value, $Res Function(_FCMTokenAddRequest) _then) = __$FCMTokenAddRequestCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$FCMTokenAddRequestCopyWithImpl<$Res>
    implements _$FCMTokenAddRequestCopyWith<$Res> {
  __$FCMTokenAddRequestCopyWithImpl(this._self, this._then);

  final _FCMTokenAddRequest _self;
  final $Res Function(_FCMTokenAddRequest) _then;

/// Create a copy of FCMTokenAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_FCMTokenAddRequest(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FCMTokenAddResponse {

 int get id;
/// Create a copy of FCMTokenAddResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FCMTokenAddResponseCopyWith<FCMTokenAddResponse> get copyWith => _$FCMTokenAddResponseCopyWithImpl<FCMTokenAddResponse>(this as FCMTokenAddResponse, _$identity);

  /// Serializes this FCMTokenAddResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FCMTokenAddResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FCMTokenAddResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class $FCMTokenAddResponseCopyWith<$Res>  {
  factory $FCMTokenAddResponseCopyWith(FCMTokenAddResponse value, $Res Function(FCMTokenAddResponse) _then) = _$FCMTokenAddResponseCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$FCMTokenAddResponseCopyWithImpl<$Res>
    implements $FCMTokenAddResponseCopyWith<$Res> {
  _$FCMTokenAddResponseCopyWithImpl(this._self, this._then);

  final FCMTokenAddResponse _self;
  final $Res Function(FCMTokenAddResponse) _then;

/// Create a copy of FCMTokenAddResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FCMTokenAddResponse].
extension FCMTokenAddResponsePatterns on FCMTokenAddResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FCMTokenAddResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FCMTokenAddResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FCMTokenAddResponse value)  $default,){
final _that = this;
switch (_that) {
case _FCMTokenAddResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FCMTokenAddResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FCMTokenAddResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FCMTokenAddResponse() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _FCMTokenAddResponse():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _FCMTokenAddResponse() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FCMTokenAddResponse implements FCMTokenAddResponse {
  const _FCMTokenAddResponse({required this.id});
  factory _FCMTokenAddResponse.fromJson(Map<String, dynamic> json) => _$FCMTokenAddResponseFromJson(json);

@override final  int id;

/// Create a copy of FCMTokenAddResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FCMTokenAddResponseCopyWith<_FCMTokenAddResponse> get copyWith => __$FCMTokenAddResponseCopyWithImpl<_FCMTokenAddResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FCMTokenAddResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FCMTokenAddResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FCMTokenAddResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FCMTokenAddResponseCopyWith<$Res> implements $FCMTokenAddResponseCopyWith<$Res> {
  factory _$FCMTokenAddResponseCopyWith(_FCMTokenAddResponse value, $Res Function(_FCMTokenAddResponse) _then) = __$FCMTokenAddResponseCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FCMTokenAddResponseCopyWithImpl<$Res>
    implements _$FCMTokenAddResponseCopyWith<$Res> {
  __$FCMTokenAddResponseCopyWithImpl(this._self, this._then);

  final _FCMTokenAddResponse _self;
  final $Res Function(_FCMTokenAddResponse) _then;

/// Create a copy of FCMTokenAddResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FCMTokenAddResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LoginResponse {

 int get id; String get role;@JsonKey(name: "refresh_token") String get refreshToken;@JsonKey(name: "refresh_token_expires_at") DateTime get refreshTokenExpiresAt;@JsonKey(name: "access_token") String get accessToken;@JsonKey(name: "access_token_expires_at") DateTime get accessTokenExpiresAt;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,refreshToken,refreshTokenExpiresAt,accessToken,accessTokenExpiresAt);

@override
String toString() {
  return 'LoginResponse(id: $id, role: $role, refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt, accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 int id, String role,@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "refresh_token_expires_at") DateTime refreshTokenExpiresAt,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "access_token_expires_at") DateTime accessTokenExpiresAt
});




}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? accessToken = null,Object? accessTokenExpiresAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String role, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.id,_that.role,_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String role, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.id,_that.role,_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String role, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.id,_that.role,_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.id, required this.role, @JsonKey(name: "refresh_token") required this.refreshToken, @JsonKey(name: "refresh_token_expires_at") required this.refreshTokenExpiresAt, @JsonKey(name: "access_token") required this.accessToken, @JsonKey(name: "access_token_expires_at") required this.accessTokenExpiresAt});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  int id;
@override final  String role;
@override@JsonKey(name: "refresh_token") final  String refreshToken;
@override@JsonKey(name: "refresh_token_expires_at") final  DateTime refreshTokenExpiresAt;
@override@JsonKey(name: "access_token") final  String accessToken;
@override@JsonKey(name: "access_token_expires_at") final  DateTime accessTokenExpiresAt;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,refreshToken,refreshTokenExpiresAt,accessToken,accessTokenExpiresAt);

@override
String toString() {
  return 'LoginResponse(id: $id, role: $role, refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt, accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String role,@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "refresh_token_expires_at") DateTime refreshTokenExpiresAt,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "access_token_expires_at") DateTime accessTokenExpiresAt
});




}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? accessToken = null,Object? accessTokenExpiresAt = null,}) {
  return _then(_LoginResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RefreshTokenResponse {

@JsonKey(name: "refresh_token") String get refreshToken;@JsonKey(name: "refresh_token_expires_at") DateTime get refreshTokenExpiresAt;@JsonKey(name: "access_token") String get accessToken;@JsonKey(name: "access_token_expires_at") DateTime get accessTokenExpiresAt;
/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith => _$RefreshTokenResponseCopyWithImpl<RefreshTokenResponse>(this as RefreshTokenResponse, _$identity);

  /// Serializes this RefreshTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenResponse&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken,refreshTokenExpiresAt,accessToken,accessTokenExpiresAt);

@override
String toString() {
  return 'RefreshTokenResponse(refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt, accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenResponseCopyWith<$Res>  {
  factory $RefreshTokenResponseCopyWith(RefreshTokenResponse value, $Res Function(RefreshTokenResponse) _then) = _$RefreshTokenResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "refresh_token_expires_at") DateTime refreshTokenExpiresAt,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "access_token_expires_at") DateTime accessTokenExpiresAt
});




}
/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._self, this._then);

  final RefreshTokenResponse _self;
  final $Res Function(RefreshTokenResponse) _then;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? accessToken = null,Object? accessTokenExpiresAt = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenResponse].
extension RefreshTokenResponsePatterns on RefreshTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
return $default(_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponse():
return $default(_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "refresh_token_expires_at")  DateTime refreshTokenExpiresAt, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "access_token_expires_at")  DateTime accessTokenExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
return $default(_that.refreshToken,_that.refreshTokenExpiresAt,_that.accessToken,_that.accessTokenExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenResponse implements RefreshTokenResponse {
  const _RefreshTokenResponse({@JsonKey(name: "refresh_token") required this.refreshToken, @JsonKey(name: "refresh_token_expires_at") required this.refreshTokenExpiresAt, @JsonKey(name: "access_token") required this.accessToken, @JsonKey(name: "access_token_expires_at") required this.accessTokenExpiresAt});
  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);

@override@JsonKey(name: "refresh_token") final  String refreshToken;
@override@JsonKey(name: "refresh_token_expires_at") final  DateTime refreshTokenExpiresAt;
@override@JsonKey(name: "access_token") final  String accessToken;
@override@JsonKey(name: "access_token_expires_at") final  DateTime accessTokenExpiresAt;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenResponseCopyWith<_RefreshTokenResponse> get copyWith => __$RefreshTokenResponseCopyWithImpl<_RefreshTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenResponse&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken,refreshTokenExpiresAt,accessToken,accessTokenExpiresAt);

@override
String toString() {
  return 'RefreshTokenResponse(refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt, accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenResponseCopyWith<$Res> implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$RefreshTokenResponseCopyWith(_RefreshTokenResponse value, $Res Function(_RefreshTokenResponse) _then) = __$RefreshTokenResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "refresh_token_expires_at") DateTime refreshTokenExpiresAt,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "access_token_expires_at") DateTime accessTokenExpiresAt
});




}
/// @nodoc
class __$RefreshTokenResponseCopyWithImpl<$Res>
    implements _$RefreshTokenResponseCopyWith<$Res> {
  __$RefreshTokenResponseCopyWithImpl(this._self, this._then);

  final _RefreshTokenResponse _self;
  final $Res Function(_RefreshTokenResponse) _then;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? accessToken = null,Object? accessTokenExpiresAt = null,}) {
  return _then(_RefreshTokenResponse(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RefreshTokenRequest {

@JsonKey(name: "refresh_token") String get refreshToken;
/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenRequestCopyWith<RefreshTokenRequest> get copyWith => _$RefreshTokenRequestCopyWithImpl<RefreshTokenRequest>(this as RefreshTokenRequest, _$identity);

  /// Serializes this RefreshTokenRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenRequestCopyWith<$Res>  {
  factory $RefreshTokenRequestCopyWith(RefreshTokenRequest value, $Res Function(RefreshTokenRequest) _then) = _$RefreshTokenRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken
});




}
/// @nodoc
class _$RefreshTokenRequestCopyWithImpl<$Res>
    implements $RefreshTokenRequestCopyWith<$Res> {
  _$RefreshTokenRequestCopyWithImpl(this._self, this._then);

  final RefreshTokenRequest _self;
  final $Res Function(RefreshTokenRequest) _then;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenRequest].
extension RefreshTokenRequestPatterns on RefreshTokenRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequest():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "refresh_token")  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenRequest implements RefreshTokenRequest {
  const _RefreshTokenRequest({@JsonKey(name: "refresh_token") required this.refreshToken});
  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);

@override@JsonKey(name: "refresh_token") final  String refreshToken;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenRequestCopyWith<_RefreshTokenRequest> get copyWith => __$RefreshTokenRequestCopyWithImpl<_RefreshTokenRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenRequestCopyWith<$Res> implements $RefreshTokenRequestCopyWith<$Res> {
  factory _$RefreshTokenRequestCopyWith(_RefreshTokenRequest value, $Res Function(_RefreshTokenRequest) _then) = __$RefreshTokenRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken
});




}
/// @nodoc
class __$RefreshTokenRequestCopyWithImpl<$Res>
    implements _$RefreshTokenRequestCopyWith<$Res> {
  __$RefreshTokenRequestCopyWithImpl(this._self, this._then);

  final _RefreshTokenRequest _self;
  final $Res Function(_RefreshTokenRequest) _then;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshTokenRequest(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LogoutRequest {

@JsonKey(name: "refresh_token") String get refreshToken;
/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutRequestCopyWith<LogoutRequest> get copyWith => _$LogoutRequestCopyWithImpl<LogoutRequest>(this as LogoutRequest, _$identity);

  /// Serializes this LogoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'LogoutRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $LogoutRequestCopyWith<$Res>  {
  factory $LogoutRequestCopyWith(LogoutRequest value, $Res Function(LogoutRequest) _then) = _$LogoutRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken
});




}
/// @nodoc
class _$LogoutRequestCopyWithImpl<$Res>
    implements $LogoutRequestCopyWith<$Res> {
  _$LogoutRequestCopyWithImpl(this._self, this._then);

  final LogoutRequest _self;
  final $Res Function(LogoutRequest) _then;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutRequest].
extension LogoutRequestPatterns on LogoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _LogoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "refresh_token")  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _LogoutRequest():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "refresh_token")  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutRequest implements LogoutRequest {
  const _LogoutRequest({@JsonKey(name: "refresh_token") required this.refreshToken});
  factory _LogoutRequest.fromJson(Map<String, dynamic> json) => _$LogoutRequestFromJson(json);

@override@JsonKey(name: "refresh_token") final  String refreshToken;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutRequestCopyWith<_LogoutRequest> get copyWith => __$LogoutRequestCopyWithImpl<_LogoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'LogoutRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$LogoutRequestCopyWith<$Res> implements $LogoutRequestCopyWith<$Res> {
  factory _$LogoutRequestCopyWith(_LogoutRequest value, $Res Function(_LogoutRequest) _then) = __$LogoutRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "refresh_token") String refreshToken
});




}
/// @nodoc
class __$LogoutRequestCopyWithImpl<$Res>
    implements _$LogoutRequestCopyWith<$Res> {
  __$LogoutRequestCopyWithImpl(this._self, this._then);

  final _LogoutRequest _self;
  final $Res Function(_LogoutRequest) _then;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_LogoutRequest(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
