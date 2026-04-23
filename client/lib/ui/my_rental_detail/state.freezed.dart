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
mixin _$MyRentalDetailState {

 int get id; RentalResponseItemDetails? get data; DataStatus get dataStatus; bool get isActionLoading; MyRentalDetailError? get error;
/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRentalDetailStateCopyWith<MyRentalDetailState> get copyWith => _$MyRentalDetailStateCopyWithImpl<MyRentalDetailState>(this as MyRentalDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRentalDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,dataStatus,isActionLoading,error);

@override
String toString() {
  return 'MyRentalDetailState(id: $id, data: $data, dataStatus: $dataStatus, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyRentalDetailStateCopyWith<$Res>  {
  factory $MyRentalDetailStateCopyWith(MyRentalDetailState value, $Res Function(MyRentalDetailState) _then) = _$MyRentalDetailStateCopyWithImpl;
@useResult
$Res call({
 int id, RentalResponseItemDetails? data, DataStatus dataStatus, bool isActionLoading, MyRentalDetailError? error
});


$RentalResponseItemDetailsCopyWith<$Res>? get data;$ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>? get error;

}
/// @nodoc
class _$MyRentalDetailStateCopyWithImpl<$Res>
    implements $MyRentalDetailStateCopyWith<$Res> {
  _$MyRentalDetailStateCopyWithImpl(this._self, this._then);

  final MyRentalDetailState _self;
  final $Res Function(MyRentalDetailState) _then;

/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? data = freezed,Object? dataStatus = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyRentalDetailError?,
  ));
}
/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RentalResponseItemDetailsCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyRentalDetailState].
extension MyRentalDetailStatePatterns on MyRentalDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRentalDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRentalDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRentalDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MyRentalDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRentalDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRentalDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  RentalResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyRentalDetailError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRentalDetailState() when $default != null:
return $default(_that.id,_that.data,_that.dataStatus,_that.isActionLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  RentalResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyRentalDetailError? error)  $default,) {final _that = this;
switch (_that) {
case _MyRentalDetailState():
return $default(_that.id,_that.data,_that.dataStatus,_that.isActionLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  RentalResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyRentalDetailError? error)?  $default,) {final _that = this;
switch (_that) {
case _MyRentalDetailState() when $default != null:
return $default(_that.id,_that.data,_that.dataStatus,_that.isActionLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyRentalDetailState extends MyRentalDetailState {
  const _MyRentalDetailState({required this.id, required this.data, required this.dataStatus, required this.isActionLoading, required this.error}): super._();
  

@override final  int id;
@override final  RentalResponseItemDetails? data;
@override final  DataStatus dataStatus;
@override final  bool isActionLoading;
@override final  MyRentalDetailError? error;

/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRentalDetailStateCopyWith<_MyRentalDetailState> get copyWith => __$MyRentalDetailStateCopyWithImpl<_MyRentalDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRentalDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,dataStatus,isActionLoading,error);

@override
String toString() {
  return 'MyRentalDetailState(id: $id, data: $data, dataStatus: $dataStatus, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyRentalDetailStateCopyWith<$Res> implements $MyRentalDetailStateCopyWith<$Res> {
  factory _$MyRentalDetailStateCopyWith(_MyRentalDetailState value, $Res Function(_MyRentalDetailState) _then) = __$MyRentalDetailStateCopyWithImpl;
@override @useResult
$Res call({
 int id, RentalResponseItemDetails? data, DataStatus dataStatus, bool isActionLoading, MyRentalDetailError? error
});


@override $RentalResponseItemDetailsCopyWith<$Res>? get data;@override $ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>? get error;

}
/// @nodoc
class __$MyRentalDetailStateCopyWithImpl<$Res>
    implements _$MyRentalDetailStateCopyWith<$Res> {
  __$MyRentalDetailStateCopyWithImpl(this._self, this._then);

  final _MyRentalDetailState _self;
  final $Res Function(_MyRentalDetailState) _then;

/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? data = freezed,Object? dataStatus = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_MyRentalDetailState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyRentalDetailError?,
  ));
}

/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RentalResponseItemDetailsCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyRentalDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyRentalDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
