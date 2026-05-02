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
mixin _$MyRentalConfirmReturnState {

 RentalResponseItemDetails get rental; DataStatus get exchangeRateStatus; ExchangeRateResponse? get exchangeRate; String get selectedFromCurrency; double? get payment; double? get lateFinePayment; double? get damageFinePayment; bool get isSubmitLoading; bool get isFinished; GeneralErrorData? get error;
/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRentalConfirmReturnStateCopyWith<MyRentalConfirmReturnState> get copyWith => _$MyRentalConfirmReturnStateCopyWithImpl<MyRentalConfirmReturnState>(this as MyRentalConfirmReturnState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRentalConfirmReturnState&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedFromCurrency, selectedFromCurrency) || other.selectedFromCurrency == selectedFromCurrency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.lateFinePayment, lateFinePayment) || other.lateFinePayment == lateFinePayment)&&(identical(other.damageFinePayment, damageFinePayment) || other.damageFinePayment == damageFinePayment)&&(identical(other.isSubmitLoading, isSubmitLoading) || other.isSubmitLoading == isSubmitLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,rental,exchangeRateStatus,exchangeRate,selectedFromCurrency,payment,lateFinePayment,damageFinePayment,isSubmitLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalConfirmReturnState(rental: $rental, exchangeRateStatus: $exchangeRateStatus, exchangeRate: $exchangeRate, selectedFromCurrency: $selectedFromCurrency, payment: $payment, lateFinePayment: $lateFinePayment, damageFinePayment: $damageFinePayment, isSubmitLoading: $isSubmitLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyRentalConfirmReturnStateCopyWith<$Res>  {
  factory $MyRentalConfirmReturnStateCopyWith(MyRentalConfirmReturnState value, $Res Function(MyRentalConfirmReturnState) _then) = _$MyRentalConfirmReturnStateCopyWithImpl;
@useResult
$Res call({
 RentalResponseItemDetails rental, DataStatus exchangeRateStatus, ExchangeRateResponse? exchangeRate, String selectedFromCurrency, double? payment, double? lateFinePayment, double? damageFinePayment, bool isSubmitLoading, bool isFinished, GeneralErrorData? error
});


$RentalResponseItemDetailsCopyWith<$Res> get rental;$ExchangeRateResponseCopyWith<$Res>? get exchangeRate;$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyRentalConfirmReturnStateCopyWithImpl<$Res>
    implements $MyRentalConfirmReturnStateCopyWith<$Res> {
  _$MyRentalConfirmReturnStateCopyWithImpl(this._self, this._then);

  final MyRentalConfirmReturnState _self;
  final $Res Function(MyRentalConfirmReturnState) _then;

/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rental = null,Object? exchangeRateStatus = null,Object? exchangeRate = freezed,Object? selectedFromCurrency = null,Object? payment = freezed,Object? lateFinePayment = freezed,Object? damageFinePayment = freezed,Object? isSubmitLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
rental: null == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedFromCurrency: null == selectedFromCurrency ? _self.selectedFromCurrency : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
as String,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as double?,lateFinePayment: freezed == lateFinePayment ? _self.lateFinePayment : lateFinePayment // ignore: cast_nullable_to_non_nullable
as double?,damageFinePayment: freezed == damageFinePayment ? _self.damageFinePayment : damageFinePayment // ignore: cast_nullable_to_non_nullable
as double?,isSubmitLoading: null == isSubmitLoading ? _self.isSubmitLoading : isSubmitLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res> get rental {
  
  return $RentalResponseItemDetailsCopyWith<$Res>(_self.rental, (value) {
    return _then(_self.copyWith(rental: value));
  });
}/// Create a copy of MyRentalConfirmReturnState
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
}/// Create a copy of MyRentalConfirmReturnState
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


/// Adds pattern-matching-related methods to [MyRentalConfirmReturnState].
extension MyRentalConfirmReturnStatePatterns on MyRentalConfirmReturnState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRentalConfirmReturnState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRentalConfirmReturnState value)  $default,){
final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRentalConfirmReturnState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  double? lateFinePayment,  double? damageFinePayment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState() when $default != null:
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.lateFinePayment,_that.damageFinePayment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  double? lateFinePayment,  double? damageFinePayment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState():
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.lateFinePayment,_that.damageFinePayment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  double? lateFinePayment,  double? damageFinePayment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _MyRentalConfirmReturnState() when $default != null:
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.lateFinePayment,_that.damageFinePayment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyRentalConfirmReturnState extends MyRentalConfirmReturnState {
  const _MyRentalConfirmReturnState({required this.rental, required this.exchangeRateStatus, required this.exchangeRate, required this.selectedFromCurrency, required this.payment, required this.lateFinePayment, required this.damageFinePayment, required this.isSubmitLoading, required this.isFinished, required this.error}): super._();
  

@override final  RentalResponseItemDetails rental;
@override final  DataStatus exchangeRateStatus;
@override final  ExchangeRateResponse? exchangeRate;
@override final  String selectedFromCurrency;
@override final  double? payment;
@override final  double? lateFinePayment;
@override final  double? damageFinePayment;
@override final  bool isSubmitLoading;
@override final  bool isFinished;
@override final  GeneralErrorData? error;

/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRentalConfirmReturnStateCopyWith<_MyRentalConfirmReturnState> get copyWith => __$MyRentalConfirmReturnStateCopyWithImpl<_MyRentalConfirmReturnState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRentalConfirmReturnState&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedFromCurrency, selectedFromCurrency) || other.selectedFromCurrency == selectedFromCurrency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.lateFinePayment, lateFinePayment) || other.lateFinePayment == lateFinePayment)&&(identical(other.damageFinePayment, damageFinePayment) || other.damageFinePayment == damageFinePayment)&&(identical(other.isSubmitLoading, isSubmitLoading) || other.isSubmitLoading == isSubmitLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,rental,exchangeRateStatus,exchangeRate,selectedFromCurrency,payment,lateFinePayment,damageFinePayment,isSubmitLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalConfirmReturnState(rental: $rental, exchangeRateStatus: $exchangeRateStatus, exchangeRate: $exchangeRate, selectedFromCurrency: $selectedFromCurrency, payment: $payment, lateFinePayment: $lateFinePayment, damageFinePayment: $damageFinePayment, isSubmitLoading: $isSubmitLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyRentalConfirmReturnStateCopyWith<$Res> implements $MyRentalConfirmReturnStateCopyWith<$Res> {
  factory _$MyRentalConfirmReturnStateCopyWith(_MyRentalConfirmReturnState value, $Res Function(_MyRentalConfirmReturnState) _then) = __$MyRentalConfirmReturnStateCopyWithImpl;
@override @useResult
$Res call({
 RentalResponseItemDetails rental, DataStatus exchangeRateStatus, ExchangeRateResponse? exchangeRate, String selectedFromCurrency, double? payment, double? lateFinePayment, double? damageFinePayment, bool isSubmitLoading, bool isFinished, GeneralErrorData? error
});


@override $RentalResponseItemDetailsCopyWith<$Res> get rental;@override $ExchangeRateResponseCopyWith<$Res>? get exchangeRate;@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyRentalConfirmReturnStateCopyWithImpl<$Res>
    implements _$MyRentalConfirmReturnStateCopyWith<$Res> {
  __$MyRentalConfirmReturnStateCopyWithImpl(this._self, this._then);

  final _MyRentalConfirmReturnState _self;
  final $Res Function(_MyRentalConfirmReturnState) _then;

/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rental = null,Object? exchangeRateStatus = null,Object? exchangeRate = freezed,Object? selectedFromCurrency = null,Object? payment = freezed,Object? lateFinePayment = freezed,Object? damageFinePayment = freezed,Object? isSubmitLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_MyRentalConfirmReturnState(
rental: null == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedFromCurrency: null == selectedFromCurrency ? _self.selectedFromCurrency : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
as String,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as double?,lateFinePayment: freezed == lateFinePayment ? _self.lateFinePayment : lateFinePayment // ignore: cast_nullable_to_non_nullable
as double?,damageFinePayment: freezed == damageFinePayment ? _self.damageFinePayment : damageFinePayment // ignore: cast_nullable_to_non_nullable
as double?,isSubmitLoading: null == isSubmitLoading ? _self.isSubmitLoading : isSubmitLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of MyRentalConfirmReturnState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res> get rental {
  
  return $RentalResponseItemDetailsCopyWith<$Res>(_self.rental, (value) {
    return _then(_self.copyWith(rental: value));
  });
}/// Create a copy of MyRentalConfirmReturnState
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
}/// Create a copy of MyRentalConfirmReturnState
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
