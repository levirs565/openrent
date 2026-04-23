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
mixin _$MyRentalRejectState {

 int get id; String get note; bool get isLoading; bool get isFinished; GeneralErrorData? get error;
/// Create a copy of MyRentalRejectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRentalRejectStateCopyWith<MyRentalRejectState> get copyWith => _$MyRentalRejectStateCopyWithImpl<MyRentalRejectState>(this as MyRentalRejectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRentalRejectState&&(identical(other.id, id) || other.id == id)&&(identical(other.note, note) || other.note == note)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,note,isLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalRejectState(id: $id, note: $note, isLoading: $isLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyRentalRejectStateCopyWith<$Res>  {
  factory $MyRentalRejectStateCopyWith(MyRentalRejectState value, $Res Function(MyRentalRejectState) _then) = _$MyRentalRejectStateCopyWithImpl;
@useResult
$Res call({
 int id, String note, bool isLoading, bool isFinished, GeneralErrorData? error
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyRentalRejectStateCopyWithImpl<$Res>
    implements $MyRentalRejectStateCopyWith<$Res> {
  _$MyRentalRejectStateCopyWithImpl(this._self, this._then);

  final MyRentalRejectState _self;
  final $Res Function(MyRentalRejectState) _then;

/// Create a copy of MyRentalRejectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? note = null,Object? isLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of MyRentalRejectState
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


/// Adds pattern-matching-related methods to [MyRentalRejectState].
extension MyRentalRejectStatePatterns on MyRentalRejectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRentalRejectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRentalRejectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRentalRejectState value)  $default,){
final _that = this;
switch (_that) {
case _MyRentalRejectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRentalRejectState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRentalRejectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String note,  bool isLoading,  bool isFinished,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRentalRejectState() when $default != null:
return $default(_that.id,_that.note,_that.isLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String note,  bool isLoading,  bool isFinished,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _MyRentalRejectState():
return $default(_that.id,_that.note,_that.isLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String note,  bool isLoading,  bool isFinished,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _MyRentalRejectState() when $default != null:
return $default(_that.id,_that.note,_that.isLoading,_that.isFinished,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyRentalRejectState extends MyRentalRejectState {
  const _MyRentalRejectState({required this.id, required this.note, required this.isLoading, required this.isFinished, required this.error}): super._();
  

@override final  int id;
@override final  String note;
@override final  bool isLoading;
@override final  bool isFinished;
@override final  GeneralErrorData? error;

/// Create a copy of MyRentalRejectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRentalRejectStateCopyWith<_MyRentalRejectState> get copyWith => __$MyRentalRejectStateCopyWithImpl<_MyRentalRejectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRentalRejectState&&(identical(other.id, id) || other.id == id)&&(identical(other.note, note) || other.note == note)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,note,isLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalRejectState(id: $id, note: $note, isLoading: $isLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyRentalRejectStateCopyWith<$Res> implements $MyRentalRejectStateCopyWith<$Res> {
  factory _$MyRentalRejectStateCopyWith(_MyRentalRejectState value, $Res Function(_MyRentalRejectState) _then) = __$MyRentalRejectStateCopyWithImpl;
@override @useResult
$Res call({
 int id, String note, bool isLoading, bool isFinished, GeneralErrorData? error
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyRentalRejectStateCopyWithImpl<$Res>
    implements _$MyRentalRejectStateCopyWith<$Res> {
  __$MyRentalRejectStateCopyWithImpl(this._self, this._then);

  final _MyRentalRejectState _self;
  final $Res Function(_MyRentalRejectState) _then;

/// Create a copy of MyRentalRejectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? note = null,Object? isLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_MyRentalRejectState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of MyRentalRejectState
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
