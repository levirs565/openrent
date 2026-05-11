// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductRentResponse {

 int get id;
/// Create a copy of ProductRentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRentResponseCopyWith<ProductRentResponse> get copyWith => _$ProductRentResponseCopyWithImpl<ProductRentResponse>(this as ProductRentResponse, _$identity);

  /// Serializes this ProductRentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRentResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductRentResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductRentResponseCopyWith<$Res>  {
  factory $ProductRentResponseCopyWith(ProductRentResponse value, $Res Function(ProductRentResponse) _then) = _$ProductRentResponseCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$ProductRentResponseCopyWithImpl<$Res>
    implements $ProductRentResponseCopyWith<$Res> {
  _$ProductRentResponseCopyWithImpl(this._self, this._then);

  final ProductRentResponse _self;
  final $Res Function(ProductRentResponse) _then;

/// Create a copy of ProductRentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductRentResponse].
extension ProductRentResponsePatterns on ProductRentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductRentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductRentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductRentResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProductRentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductRentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProductRentResponse() when $default != null:
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
case _ProductRentResponse() when $default != null:
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
case _ProductRentResponse():
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
case _ProductRentResponse() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductRentResponse implements ProductRentResponse {
  const _ProductRentResponse({required this.id});
  factory _ProductRentResponse.fromJson(Map<String, dynamic> json) => _$ProductRentResponseFromJson(json);

@override final  int id;

/// Create a copy of ProductRentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRentResponseCopyWith<_ProductRentResponse> get copyWith => __$ProductRentResponseCopyWithImpl<_ProductRentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductRentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRentResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductRentResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ProductRentResponseCopyWith<$Res> implements $ProductRentResponseCopyWith<$Res> {
  factory _$ProductRentResponseCopyWith(_ProductRentResponse value, $Res Function(_ProductRentResponse) _then) = __$ProductRentResponseCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ProductRentResponseCopyWithImpl<$Res>
    implements _$ProductRentResponseCopyWith<$Res> {
  __$ProductRentResponseCopyWithImpl(this._self, this._then);

  final _ProductRentResponse _self;
  final $Res Function(_ProductRentResponse) _then;

/// Create a copy of ProductRentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ProductRentResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
