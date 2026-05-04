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

 int get id; ExchangeRateResponse? get exchangeRate; String get selectedCurrency; DataStatus get exchangeRateStatus; ProductResponseItemDetail? get data; DateTime get startDate; DateTime get endDate; int? get quantity; DataStatus get dataStatus;// TODO: must send rent id after succcess
 ActionStatus get actionStatus; RentFormError? get error; tz.Location get timeZone;
/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentFormStateCopyWith<RentFormState> get copyWith => _$RentFormStateCopyWithImpl<RentFormState>(this as RentFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.data, data) || other.data == data)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,id,exchangeRate,selectedCurrency,exchangeRateStatus,data,startDate,endDate,quantity,dataStatus,actionStatus,error,timeZone);

@override
String toString() {
  return 'RentFormState(id: $id, exchangeRate: $exchangeRate, selectedCurrency: $selectedCurrency, exchangeRateStatus: $exchangeRateStatus, data: $data, startDate: $startDate, endDate: $endDate, quantity: $quantity, dataStatus: $dataStatus, actionStatus: $actionStatus, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class $RentFormStateCopyWith<$Res>  {
  factory $RentFormStateCopyWith(RentFormState value, $Res Function(RentFormState) _then) = _$RentFormStateCopyWithImpl;
@useResult
$Res call({
 int id, ExchangeRateResponse? exchangeRate, String selectedCurrency, DataStatus exchangeRateStatus, ProductResponseItemDetail? data, DateTime startDate, DateTime endDate, int? quantity, DataStatus dataStatus, ActionStatus actionStatus, RentFormError? error, tz.Location timeZone
});


$ExchangeRateResponseCopyWith<$Res>? get exchangeRate;$ProductResponseItemDetailCopyWith<$Res>? get data;$ErrorDataCopyWith<RentFormErrorSource, $Res>? get error;

}
/// @nodoc
class _$RentFormStateCopyWithImpl<$Res>
    implements $RentFormStateCopyWith<$Res> {
  _$RentFormStateCopyWithImpl(this._self, this._then);

  final RentFormState _self;
  final $Res Function(RentFormState) _then;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exchangeRate = freezed,Object? selectedCurrency = null,Object? exchangeRateStatus = null,Object? data = freezed,Object? startDate = null,Object? endDate = null,Object? quantity = freezed,Object? dataStatus = null,Object? actionStatus = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as String,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponseItemDetail?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RentFormError?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}
/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeRateResponseCopyWith<$Res>? get exchangeRate {
    if (_self.exchangeRate == null) {
    return null;
  }

  return $ExchangeRateResponseCopyWith<$Res>(_self.exchangeRate!, (value) {
    return _then(_self.copyWith(exchangeRate: value));
  });
}/// Create a copy of RentFormState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error,  tz.Location timeZone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
return $default(_that.id,_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error,  tz.Location timeZone)  $default,) {final _that = this;
switch (_that) {
case _RentFormState():
return $default(_that.id,_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  ProductResponseItemDetail? data,  DateTime startDate,  DateTime endDate,  int? quantity,  DataStatus dataStatus,  ActionStatus actionStatus,  RentFormError? error,  tz.Location timeZone)?  $default,) {final _that = this;
switch (_that) {
case _RentFormState() when $default != null:
return $default(_that.id,_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.data,_that.startDate,_that.endDate,_that.quantity,_that.dataStatus,_that.actionStatus,_that.error,_that.timeZone);case _:
  return null;

}
}

}

/// @nodoc


class _RentFormState extends RentFormState {
   _RentFormState({required this.id, required this.exchangeRate, required this.selectedCurrency, required this.exchangeRateStatus, required this.data, required this.startDate, required this.endDate, required this.quantity, required this.dataStatus, required this.actionStatus, required this.error, required this.timeZone}): super._();
  

@override final  int id;
@override final  ExchangeRateResponse? exchangeRate;
@override final  String selectedCurrency;
@override final  DataStatus exchangeRateStatus;
@override final  ProductResponseItemDetail? data;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int? quantity;
@override final  DataStatus dataStatus;
// TODO: must send rent id after succcess
@override final  ActionStatus actionStatus;
@override final  RentFormError? error;
@override final  tz.Location timeZone;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentFormStateCopyWith<_RentFormState> get copyWith => __$RentFormStateCopyWithImpl<_RentFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.data, data) || other.data == data)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,id,exchangeRate,selectedCurrency,exchangeRateStatus,data,startDate,endDate,quantity,dataStatus,actionStatus,error,timeZone);

@override
String toString() {
  return 'RentFormState(id: $id, exchangeRate: $exchangeRate, selectedCurrency: $selectedCurrency, exchangeRateStatus: $exchangeRateStatus, data: $data, startDate: $startDate, endDate: $endDate, quantity: $quantity, dataStatus: $dataStatus, actionStatus: $actionStatus, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class _$RentFormStateCopyWith<$Res> implements $RentFormStateCopyWith<$Res> {
  factory _$RentFormStateCopyWith(_RentFormState value, $Res Function(_RentFormState) _then) = __$RentFormStateCopyWithImpl;
@override @useResult
$Res call({
 int id, ExchangeRateResponse? exchangeRate, String selectedCurrency, DataStatus exchangeRateStatus, ProductResponseItemDetail? data, DateTime startDate, DateTime endDate, int? quantity, DataStatus dataStatus, ActionStatus actionStatus, RentFormError? error, tz.Location timeZone
});


@override $ExchangeRateResponseCopyWith<$Res>? get exchangeRate;@override $ProductResponseItemDetailCopyWith<$Res>? get data;@override $ErrorDataCopyWith<RentFormErrorSource, $Res>? get error;

}
/// @nodoc
class __$RentFormStateCopyWithImpl<$Res>
    implements _$RentFormStateCopyWith<$Res> {
  __$RentFormStateCopyWithImpl(this._self, this._then);

  final _RentFormState _self;
  final $Res Function(_RentFormState) _then;

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exchangeRate = freezed,Object? selectedCurrency = null,Object? exchangeRateStatus = null,Object? data = freezed,Object? startDate = null,Object? endDate = null,Object? quantity = freezed,Object? dataStatus = null,Object? actionStatus = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_RentFormState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as String,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponseItemDetail?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RentFormError?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}

/// Create a copy of RentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeRateResponseCopyWith<$Res>? get exchangeRate {
    if (_self.exchangeRate == null) {
    return null;
  }

  return $ExchangeRateResponseCopyWith<$Res>(_self.exchangeRate!, (value) {
    return _then(_self.copyWith(exchangeRate: value));
  });
}/// Create a copy of RentFormState
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
