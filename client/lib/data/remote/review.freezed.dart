// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewAddRequest {

 int get rating; String get content;
/// Create a copy of ReviewAddRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewAddRequestCopyWith<ReviewAddRequest> get copyWith => _$ReviewAddRequestCopyWithImpl<ReviewAddRequest>(this as ReviewAddRequest, _$identity);

  /// Serializes this ReviewAddRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewAddRequest&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating,content);

@override
String toString() {
  return 'ReviewAddRequest(rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class $ReviewAddRequestCopyWith<$Res>  {
  factory $ReviewAddRequestCopyWith(ReviewAddRequest value, $Res Function(ReviewAddRequest) _then) = _$ReviewAddRequestCopyWithImpl;
@useResult
$Res call({
 int rating, String content
});




}
/// @nodoc
class _$ReviewAddRequestCopyWithImpl<$Res>
    implements $ReviewAddRequestCopyWith<$Res> {
  _$ReviewAddRequestCopyWithImpl(this._self, this._then);

  final ReviewAddRequest _self;
  final $Res Function(ReviewAddRequest) _then;

/// Create a copy of ReviewAddRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rating = null,Object? content = null,}) {
  return _then(_self.copyWith(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewAddRequest].
extension ReviewAddRequestPatterns on ReviewAddRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewAddRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewAddRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewAddRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReviewAddRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewAddRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewAddRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rating,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewAddRequest() when $default != null:
return $default(_that.rating,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rating,  String content)  $default,) {final _that = this;
switch (_that) {
case _ReviewAddRequest():
return $default(_that.rating,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rating,  String content)?  $default,) {final _that = this;
switch (_that) {
case _ReviewAddRequest() when $default != null:
return $default(_that.rating,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewAddRequest implements ReviewAddRequest {
   _ReviewAddRequest({required this.rating, required this.content});
  factory _ReviewAddRequest.fromJson(Map<String, dynamic> json) => _$ReviewAddRequestFromJson(json);

@override final  int rating;
@override final  String content;

/// Create a copy of ReviewAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewAddRequestCopyWith<_ReviewAddRequest> get copyWith => __$ReviewAddRequestCopyWithImpl<_ReviewAddRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewAddRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewAddRequest&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating,content);

@override
String toString() {
  return 'ReviewAddRequest(rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ReviewAddRequestCopyWith<$Res> implements $ReviewAddRequestCopyWith<$Res> {
  factory _$ReviewAddRequestCopyWith(_ReviewAddRequest value, $Res Function(_ReviewAddRequest) _then) = __$ReviewAddRequestCopyWithImpl;
@override @useResult
$Res call({
 int rating, String content
});




}
/// @nodoc
class __$ReviewAddRequestCopyWithImpl<$Res>
    implements _$ReviewAddRequestCopyWith<$Res> {
  __$ReviewAddRequestCopyWithImpl(this._self, this._then);

  final _ReviewAddRequest _self;
  final $Res Function(_ReviewAddRequest) _then;

/// Create a copy of ReviewAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rating = null,Object? content = null,}) {
  return _then(_ReviewAddRequest(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
