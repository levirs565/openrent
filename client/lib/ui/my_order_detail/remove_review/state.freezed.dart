// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoveReviewState {

 int get id; ActionStatus get submitState; GeneralErrorData? get error;
/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveReviewStateCopyWith<RemoveReviewState> get copyWith => _$RemoveReviewStateCopyWithImpl<RemoveReviewState>(this as RemoveReviewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveReviewState&&(identical(other.id, id) || other.id == id)&&(identical(other.submitState, submitState) || other.submitState == submitState)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,submitState,error);

@override
String toString() {
  return 'RemoveReviewState(id: $id, submitState: $submitState, error: $error)';
}


}

/// @nodoc
abstract mixin class $RemoveReviewStateCopyWith<$Res>  {
  factory $RemoveReviewStateCopyWith(RemoveReviewState value, $Res Function(RemoveReviewState) _then) = _$RemoveReviewStateCopyWithImpl;
@useResult
$Res call({
 int id, ActionStatus submitState, GeneralErrorData? error
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$RemoveReviewStateCopyWithImpl<$Res>
    implements $RemoveReviewStateCopyWith<$Res> {
  _$RemoveReviewStateCopyWithImpl(this._self, this._then);

  final RemoveReviewState _self;
  final $Res Function(RemoveReviewState) _then;

/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? submitState = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,submitState: null == submitState ? _self.submitState : submitState // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<void, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<void, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [RemoveReviewState].
extension RemoveReviewStatePatterns on RemoveReviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoveReviewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoveReviewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoveReviewState value)  $default,){
final _that = this;
switch (_that) {
case _RemoveReviewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoveReviewState value)?  $default,){
final _that = this;
switch (_that) {
case _RemoveReviewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ActionStatus submitState,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoveReviewState() when $default != null:
return $default(_that.id,_that.submitState,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ActionStatus submitState,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _RemoveReviewState():
return $default(_that.id,_that.submitState,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ActionStatus submitState,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _RemoveReviewState() when $default != null:
return $default(_that.id,_that.submitState,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RemoveReviewState extends RemoveReviewState {
  const _RemoveReviewState({required this.id, required this.submitState, required this.error}): super._();
  

@override final  int id;
@override final  ActionStatus submitState;
@override final  GeneralErrorData? error;

/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveReviewStateCopyWith<_RemoveReviewState> get copyWith => __$RemoveReviewStateCopyWithImpl<_RemoveReviewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveReviewState&&(identical(other.id, id) || other.id == id)&&(identical(other.submitState, submitState) || other.submitState == submitState)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,submitState,error);

@override
String toString() {
  return 'RemoveReviewState(id: $id, submitState: $submitState, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RemoveReviewStateCopyWith<$Res> implements $RemoveReviewStateCopyWith<$Res> {
  factory _$RemoveReviewStateCopyWith(_RemoveReviewState value, $Res Function(_RemoveReviewState) _then) = __$RemoveReviewStateCopyWithImpl;
@override @useResult
$Res call({
 int id, ActionStatus submitState, GeneralErrorData? error
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$RemoveReviewStateCopyWithImpl<$Res>
    implements _$RemoveReviewStateCopyWith<$Res> {
  __$RemoveReviewStateCopyWithImpl(this._self, this._then);

  final _RemoveReviewState _self;
  final $Res Function(_RemoveReviewState) _then;

/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? submitState = null,Object? error = freezed,}) {
  return _then(_RemoveReviewState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,submitState: null == submitState ? _self.submitState : submitState // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of RemoveReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<void, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<void, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
