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
mixin _$ReviewFormState {

 int? get id; int? get rentId; int? get rating; String get content; ReviewFormError? get error; DataStatus get dataStatus; ActionStatus get submissionStatus;
/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewFormStateCopyWith<ReviewFormState> get copyWith => _$ReviewFormStateCopyWithImpl<ReviewFormState>(this as ReviewFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.rentId, rentId) || other.rentId == rentId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.error, error) || other.error == error)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,rentId,rating,content,error,dataStatus,submissionStatus);

@override
String toString() {
  return 'ReviewFormState(id: $id, rentId: $rentId, rating: $rating, content: $content, error: $error, dataStatus: $dataStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class $ReviewFormStateCopyWith<$Res>  {
  factory $ReviewFormStateCopyWith(ReviewFormState value, $Res Function(ReviewFormState) _then) = _$ReviewFormStateCopyWithImpl;
@useResult
$Res call({
 int? id, int? rentId, int? rating, String content, ReviewFormError? error, DataStatus dataStatus, ActionStatus submissionStatus
});


$ErrorDataCopyWith<ReviewFormErrorSource, $Res>? get error;

}
/// @nodoc
class _$ReviewFormStateCopyWithImpl<$Res>
    implements $ReviewFormStateCopyWith<$Res> {
  _$ReviewFormStateCopyWithImpl(this._self, this._then);

  final ReviewFormState _self;
  final $Res Function(ReviewFormState) _then;

/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rentId = freezed,Object? rating = freezed,Object? content = null,Object? error = freezed,Object? dataStatus = null,Object? submissionStatus = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,rentId: freezed == rentId ? _self.rentId : rentId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ReviewFormError?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,
  ));
}
/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<ReviewFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<ReviewFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewFormState].
extension ReviewFormStatePatterns on ReviewFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewFormState value)  $default,){
final _that = this;
switch (_that) {
case _ReviewFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? rentId,  int? rating,  String content,  ReviewFormError? error,  DataStatus dataStatus,  ActionStatus submissionStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewFormState() when $default != null:
return $default(_that.id,_that.rentId,_that.rating,_that.content,_that.error,_that.dataStatus,_that.submissionStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? rentId,  int? rating,  String content,  ReviewFormError? error,  DataStatus dataStatus,  ActionStatus submissionStatus)  $default,) {final _that = this;
switch (_that) {
case _ReviewFormState():
return $default(_that.id,_that.rentId,_that.rating,_that.content,_that.error,_that.dataStatus,_that.submissionStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? rentId,  int? rating,  String content,  ReviewFormError? error,  DataStatus dataStatus,  ActionStatus submissionStatus)?  $default,) {final _that = this;
switch (_that) {
case _ReviewFormState() when $default != null:
return $default(_that.id,_that.rentId,_that.rating,_that.content,_that.error,_that.dataStatus,_that.submissionStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewFormState extends ReviewFormState {
   _ReviewFormState({required this.id, required this.rentId, required this.rating, required this.content, required this.error, required this.dataStatus, required this.submissionStatus}): super._();
  

@override final  int? id;
@override final  int? rentId;
@override final  int? rating;
@override final  String content;
@override final  ReviewFormError? error;
@override final  DataStatus dataStatus;
@override final  ActionStatus submissionStatus;

/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewFormStateCopyWith<_ReviewFormState> get copyWith => __$ReviewFormStateCopyWithImpl<_ReviewFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.rentId, rentId) || other.rentId == rentId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.error, error) || other.error == error)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,rentId,rating,content,error,dataStatus,submissionStatus);

@override
String toString() {
  return 'ReviewFormState(id: $id, rentId: $rentId, rating: $rating, content: $content, error: $error, dataStatus: $dataStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class _$ReviewFormStateCopyWith<$Res> implements $ReviewFormStateCopyWith<$Res> {
  factory _$ReviewFormStateCopyWith(_ReviewFormState value, $Res Function(_ReviewFormState) _then) = __$ReviewFormStateCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? rentId, int? rating, String content, ReviewFormError? error, DataStatus dataStatus, ActionStatus submissionStatus
});


@override $ErrorDataCopyWith<ReviewFormErrorSource, $Res>? get error;

}
/// @nodoc
class __$ReviewFormStateCopyWithImpl<$Res>
    implements _$ReviewFormStateCopyWith<$Res> {
  __$ReviewFormStateCopyWithImpl(this._self, this._then);

  final _ReviewFormState _self;
  final $Res Function(_ReviewFormState) _then;

/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rentId = freezed,Object? rating = freezed,Object? content = null,Object? error = freezed,Object? dataStatus = null,Object? submissionStatus = null,}) {
  return _then(_ReviewFormState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,rentId: freezed == rentId ? _self.rentId : rentId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ReviewFormError?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,
  ));
}

/// Create a copy of ReviewFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<ReviewFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<ReviewFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
