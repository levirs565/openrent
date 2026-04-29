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

// dart format on
