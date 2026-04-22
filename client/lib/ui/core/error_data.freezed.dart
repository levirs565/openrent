// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ErrorData<S> {

 DateTime get dateTime; S get source; String get message;
/// Create a copy of ErrorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<S, ErrorData<S>> get copyWith => _$ErrorDataCopyWithImpl<S, ErrorData<S>>(this as ErrorData<S>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorData<S>&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other.source, source)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,dateTime,const DeepCollectionEquality().hash(source),message);

@override
String toString() {
  return 'ErrorData<$S>(dateTime: $dateTime, source: $source, message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorDataCopyWith<S,$Res>  {
  factory $ErrorDataCopyWith(ErrorData<S> value, $Res Function(ErrorData<S>) _then) = _$ErrorDataCopyWithImpl;
@useResult
$Res call({
 S source, String message, DateTime? dateTime
});




}
/// @nodoc
class _$ErrorDataCopyWithImpl<S,$Res>
    implements $ErrorDataCopyWith<S, $Res> {
  _$ErrorDataCopyWithImpl(this._self, this._then);

  final ErrorData<S> _self;
  final $Res Function(ErrorData<S>) _then;

/// Create a copy of ErrorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? message = null,Object? dateTime = freezed,}) {
  return _then(_self.copyWith(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as S,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dateTime: freezed == dateTime ? _self.dateTime! : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorData].
extension ErrorDataPatterns<S> on ErrorData<S> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorData<S> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorData<S> value)  $default,){
final _that = this;
switch (_that) {
case _ErrorData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorData<S> value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( S source,  String message,  DateTime? dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorData() when $default != null:
return $default(_that.source,_that.message,_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( S source,  String message,  DateTime? dateTime)  $default,) {final _that = this;
switch (_that) {
case _ErrorData():
return $default(_that.source,_that.message,_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( S source,  String message,  DateTime? dateTime)?  $default,) {final _that = this;
switch (_that) {
case _ErrorData() when $default != null:
return $default(_that.source,_that.message,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _ErrorData<S> extends ErrorData<S> {
   _ErrorData({required this.source, required this.message, final  DateTime? dateTime}): super._(dateTime: dateTime);
  

@override final  S source;
@override final  String message;

/// Create a copy of ErrorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorDataCopyWith<S, _ErrorData<S>> get copyWith => __$ErrorDataCopyWithImpl<S, _ErrorData<S>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorData<S>&&const DeepCollectionEquality().equals(other.source, source)&&(identical(other.message, message) || other.message == message)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(source),message,dateTime);

@override
String toString() {
  return 'ErrorData<$S>(source: $source, message: $message, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$ErrorDataCopyWith<S,$Res> implements $ErrorDataCopyWith<S, $Res> {
  factory _$ErrorDataCopyWith(_ErrorData<S> value, $Res Function(_ErrorData<S>) _then) = __$ErrorDataCopyWithImpl;
@override @useResult
$Res call({
 S source, String message, DateTime? dateTime
});




}
/// @nodoc
class __$ErrorDataCopyWithImpl<S,$Res>
    implements _$ErrorDataCopyWith<S, $Res> {
  __$ErrorDataCopyWithImpl(this._self, this._then);

  final _ErrorData<S> _self;
  final $Res Function(_ErrorData<S>) _then;

/// Create a copy of ErrorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? message = null,Object? dateTime = freezed,}) {
  return _then(_ErrorData<S>(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as S,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
