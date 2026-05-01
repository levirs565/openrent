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
mixin _$RentFormState {

 int get id; ProductResponseItemDetail? get data; DateTime get startDate; DateTime get endDate; int? get quantity; DataStatus get dataStatus;// TODO: must send rent id after succcess
 ActionStatus get actionStatus; RentFormError? get error;
/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentFormStateCopyWith<RentFormState> get copyWith => _$RentFormStateCopyWithImpl<RentFormState>(this as RentFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,startDate,endDate,quantity,dataStatus,actionStatus,error);

@override
String toString() {
  return 'RentFormState(id: $id, data: $data, startDate: $startDate, endDate: $endDate, quantity: $quantity, dataStatus: $dataStatus, actionStatus: $actionStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class $RentFormStateCopyWith<$Res>  {
  factory $RentFormStateCopyWith(RentFormState value, $Res Function(RentFormState) _then) = _$RentFormStateCopyWithImpl;
@useResult
$Res call({
 int id, ProductResponseItemDetail? data, DateTime startDate, DateTime endDate, int? quantity, DataStatus dataStatus, ActionStatus actionStatus, RentFormError? error
});


$ProductResponseItemDetailCopyWith<$Res>? get data;$ErrorDataCopyWith<RentFormErrorSource, $Res>? get error;

}
/// @nodoc
class _$RentFormStateCopyWithImpl<$Res>
    implements $RentFormStateCopyWith<$Res> {
  _$RentFormStateCopyWithImpl(this._self, this._then);

  final RentFormState _self;
  final $Res Function(RentFormState) _then;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? data = freezed,Object? startDate = null,Object? endDate = null,Object? quantity = freezed,Object? dataStatus = null,Object? actionStatus = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponseItemDetail?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RentFormError?,
  ));
}
/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductResponseItemDetailCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductResponseItemDetailCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<RentFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<RentFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentFormState].
extension RentFormStatePatterns on RentFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentFormState value)  $default,){
final _that = this;
switch (_that) {
case _RentFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentFormState value)?  $default,){
final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
return $default(_that.id,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error)  $default,) {final _that = this;
switch (_that) {
case _RentFormState():
return $default(_that.id,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error)?  $default,) {final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
return $default(_that.id,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RentFormState extends RentFormState {
   _RentFormState({required this.id, required this.data, required this.startDate, required this.endDate, required this.quantity, required this.dataStatus, required this.actionStatus, required this.error}): super._();
  

@override final  int id;
@override final  ProductResponseItemDetail? data;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int? quantity;
@override final  DataStatus dataStatus;
// TODO: must send rent id after succcess
@override final  ActionStatus actionStatus;
@override final  RentFormError? error;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentFormStateCopyWith<_RentFormState> get copyWith => __$RentFormStateCopyWithImpl<_RentFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,data,startDate,endDate,quantity,dataStatus,actionStatus,error);

@override
String toString() {
  return 'RentFormState(id: $id, data: $data, startDate: $startDate, endDate: $endDate, quantity: $quantity, dataStatus: $dataStatus, actionStatus: $actionStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RentFormStateCopyWith<$Res> implements $RentFormStateCopyWith<$Res> {
  factory _$RentFormStateCopyWith(_RentFormState value, $Res Function(_RentFormState) _then) = __$RentFormStateCopyWithImpl;
@override @useResult
$Res call({
 int id, ProductResponseItemDetail? data, DateTime startDate, DateTime endDate, int? quantity, DataStatus dataStatus, ActionStatus actionStatus, RentFormError? error
});


@override $ProductResponseItemDetailCopyWith<$Res>? get data;@override $ErrorDataCopyWith<RentFormErrorSource, $Res>? get error;

}
/// @nodoc
class __$RentFormStateCopyWithImpl<$Res>
    implements _$RentFormStateCopyWith<$Res> {
  __$RentFormStateCopyWithImpl(this._self, this._then);

  final _RentFormState _self;
  final $Res Function(_RentFormState) _then;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? data = freezed,Object? startDate = null,Object? endDate = null,Object? quantity = freezed,Object? dataStatus = null,Object? actionStatus = null,Object? error = freezed,}) {
  return _then(_RentFormState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponseItemDetail?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RentFormError?,
  ));
}

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductResponseItemDetailCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductResponseItemDetailCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<RentFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<RentFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
