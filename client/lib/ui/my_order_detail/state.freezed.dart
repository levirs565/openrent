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
mixin _$MyOrderDetailState {

 int get id; OrderResponseItemDetails? get data; DataStatus get dataStatus; bool get isActionLoading; MyOrderDetailError? get error;
/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOrderDetailStateCopyWith<MyOrderDetailState> get copyWith => _$MyOrderDetailStateCopyWithImpl<MyOrderDetailState>(this as MyOrderDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrderDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,dataStatus,isActionLoading,error);

@override
String toString() {
  return 'MyOrderDetailState(id: $id, data: $data, dataStatus: $dataStatus, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyOrderDetailStateCopyWith<$Res>  {
  factory $MyOrderDetailStateCopyWith(MyOrderDetailState value, $Res Function(MyOrderDetailState) _then) = _$MyOrderDetailStateCopyWithImpl;
@useResult
$Res call({
 int id, OrderResponseItemDetails? data, DataStatus dataStatus, bool isActionLoading, MyOrderDetailError? error
});


$OrderResponseItemDetailsCopyWith<$Res>? get data;$ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>? get error;

}
/// @nodoc
class _$MyOrderDetailStateCopyWithImpl<$Res>
    implements $MyOrderDetailStateCopyWith<$Res> {
  _$MyOrderDetailStateCopyWithImpl(this._self, this._then);

  final MyOrderDetailState _self;
  final $Res Function(MyOrderDetailState) _then;

/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? data = freezed,Object? dataStatus = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderResponseItemDetails?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyOrderDetailError?,
  ));
}
/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderResponseItemDetailsCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OrderResponseItemDetailsCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyOrderDetailState].
extension MyOrderDetailStatePatterns on MyOrderDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyOrderDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyOrderDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyOrderDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MyOrderDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyOrderDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MyOrderDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  OrderResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyOrderDetailError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyOrderDetailState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  OrderResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyOrderDetailError? error)  $default,) {final _that = this;
switch (_that) {
case _MyOrderDetailState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  OrderResponseItemDetails? data,  DataStatus dataStatus,  bool isActionLoading,  MyOrderDetailError? error)?  $default,) {final _that = this;
switch (_that) {
case _MyOrderDetailState() when $default != null:
return $default(_that.id,_that.data,_that.dataStatus,_that.isActionLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyOrderDetailState extends MyOrderDetailState {
  const _MyOrderDetailState({required this.id, required this.data, required this.dataStatus, required this.isActionLoading, required this.error}): super._();
  

@override final  int id;
@override final  OrderResponseItemDetails? data;
@override final  DataStatus dataStatus;
@override final  bool isActionLoading;
@override final  MyOrderDetailError? error;

/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOrderDetailStateCopyWith<_MyOrderDetailState> get copyWith => __$MyOrderDetailStateCopyWithImpl<_MyOrderDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOrderDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,dataStatus,isActionLoading,error);

@override
String toString() {
  return 'MyOrderDetailState(id: $id, data: $data, dataStatus: $dataStatus, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyOrderDetailStateCopyWith<$Res> implements $MyOrderDetailStateCopyWith<$Res> {
  factory _$MyOrderDetailStateCopyWith(_MyOrderDetailState value, $Res Function(_MyOrderDetailState) _then) = __$MyOrderDetailStateCopyWithImpl;
@override @useResult
$Res call({
 int id, OrderResponseItemDetails? data, DataStatus dataStatus, bool isActionLoading, MyOrderDetailError? error
});


@override $OrderResponseItemDetailsCopyWith<$Res>? get data;@override $ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>? get error;

}
/// @nodoc
class __$MyOrderDetailStateCopyWithImpl<$Res>
    implements _$MyOrderDetailStateCopyWith<$Res> {
  __$MyOrderDetailStateCopyWithImpl(this._self, this._then);

  final _MyOrderDetailState _self;
  final $Res Function(_MyOrderDetailState) _then;

/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? data = freezed,Object? dataStatus = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_MyOrderDetailState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderResponseItemDetails?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyOrderDetailError?,
  ));
}

/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderResponseItemDetailsCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OrderResponseItemDetailsCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyOrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyOrderDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
