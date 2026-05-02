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
mixin _$MyRentalHandoverState {

 RentalResponseItemDetails get rental; DataStatus get exchangeRateStatus; ExchangeRateResponse? get exchangeRate; String get selectedFromCurrency; double? get payment; bool get isSubmitLoading; bool get isFinished; GeneralErrorData? get error;
/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRentalHandoverStateCopyWith<MyRentalHandoverState> get copyWith => _$MyRentalHandoverStateCopyWithImpl<MyRentalHandoverState>(this as MyRentalHandoverState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRentalHandoverState&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedFromCurrency, selectedFromCurrency) || other.selectedFromCurrency == selectedFromCurrency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isSubmitLoading, isSubmitLoading) || other.isSubmitLoading == isSubmitLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,rental,exchangeRateStatus,exchangeRate,selectedFromCurrency,payment,isSubmitLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalHandoverState(rental: $rental, exchangeRateStatus: $exchangeRateStatus, exchangeRate: $exchangeRate, selectedFromCurrency: $selectedFromCurrency, payment: $payment, isSubmitLoading: $isSubmitLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyRentalHandoverStateCopyWith<$Res>  {
  factory $MyRentalHandoverStateCopyWith(MyRentalHandoverState value, $Res Function(MyRentalHandoverState) _then) = _$MyRentalHandoverStateCopyWithImpl;
@useResult
$Res call({
 RentalResponseItemDetails rental, DataStatus exchangeRateStatus, ExchangeRateResponse? exchangeRate, String selectedFromCurrency, double? payment, bool isSubmitLoading, bool isFinished, GeneralErrorData? error
});


$RentalResponseItemDetailsCopyWith<$Res> get rental;$ExchangeRateResponseCopyWith<$Res>? get exchangeRate;$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyRentalHandoverStateCopyWithImpl<$Res>
    implements $MyRentalHandoverStateCopyWith<$Res> {
  _$MyRentalHandoverStateCopyWithImpl(this._self, this._then);

  final MyRentalHandoverState _self;
  final $Res Function(MyRentalHandoverState) _then;

/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rental = null,Object? exchangeRateStatus = null,Object? exchangeRate = freezed,Object? selectedFromCurrency = null,Object? payment = freezed,Object? isSubmitLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
rental: null == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedFromCurrency: null == selectedFromCurrency ? _self.selectedFromCurrency : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
as String,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as double?,isSubmitLoading: null == isSubmitLoading ? _self.isSubmitLoading : isSubmitLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res> get rental {
  
  return $RentalResponseItemDetailsCopyWith<$Res>(_self.rental, (value) {
    return _then(_self.copyWith(rental: value));
  });
}/// Create a copy of MyRentalHandoverState
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
}/// Create a copy of MyRentalHandoverState
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


/// Adds pattern-matching-related methods to [MyRentalHandoverState].
extension MyRentalHandoverStatePatterns on MyRentalHandoverState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRentalHandoverState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRentalHandoverState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRentalHandoverState value)  $default,){
final _that = this;
switch (_that) {
case _MyRentalHandoverState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRentalHandoverState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRentalHandoverState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRentalHandoverState() when $default != null:
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _MyRentalHandoverState():
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RentalResponseItemDetails rental,  DataStatus exchangeRateStatus,  ExchangeRateResponse? exchangeRate,  String selectedFromCurrency,  double? payment,  bool isSubmitLoading,  bool isFinished,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _MyRentalHandoverState() when $default != null:
return $default(_that.rental,_that.exchangeRateStatus,_that.exchangeRate,_that.selectedFromCurrency,_that.payment,_that.isSubmitLoading,_that.isFinished,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyRentalHandoverState extends MyRentalHandoverState {
  const _MyRentalHandoverState({required this.rental, required this.exchangeRateStatus, required this.exchangeRate, required this.selectedFromCurrency, required this.payment, required this.isSubmitLoading, required this.isFinished, required this.error}): super._();
  

@override final  RentalResponseItemDetails rental;
@override final  DataStatus exchangeRateStatus;
@override final  ExchangeRateResponse? exchangeRate;
@override final  String selectedFromCurrency;
@override final  double? payment;
@override final  bool isSubmitLoading;
@override final  bool isFinished;
@override final  GeneralErrorData? error;

/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRentalHandoverStateCopyWith<_MyRentalHandoverState> get copyWith => __$MyRentalHandoverStateCopyWithImpl<_MyRentalHandoverState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRentalHandoverState&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedFromCurrency, selectedFromCurrency) || other.selectedFromCurrency == selectedFromCurrency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isSubmitLoading, isSubmitLoading) || other.isSubmitLoading == isSubmitLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,rental,exchangeRateStatus,exchangeRate,selectedFromCurrency,payment,isSubmitLoading,isFinished,error);

@override
String toString() {
  return 'MyRentalHandoverState(rental: $rental, exchangeRateStatus: $exchangeRateStatus, exchangeRate: $exchangeRate, selectedFromCurrency: $selectedFromCurrency, payment: $payment, isSubmitLoading: $isSubmitLoading, isFinished: $isFinished, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyRentalHandoverStateCopyWith<$Res> implements $MyRentalHandoverStateCopyWith<$Res> {
  factory _$MyRentalHandoverStateCopyWith(_MyRentalHandoverState value, $Res Function(_MyRentalHandoverState) _then) = __$MyRentalHandoverStateCopyWithImpl;
@override @useResult
$Res call({
 RentalResponseItemDetails rental, DataStatus exchangeRateStatus, ExchangeRateResponse? exchangeRate, String selectedFromCurrency, double? payment, bool isSubmitLoading, bool isFinished, GeneralErrorData? error
});


@override $RentalResponseItemDetailsCopyWith<$Res> get rental;@override $ExchangeRateResponseCopyWith<$Res>? get exchangeRate;@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyRentalHandoverStateCopyWithImpl<$Res>
    implements _$MyRentalHandoverStateCopyWith<$Res> {
  __$MyRentalHandoverStateCopyWithImpl(this._self, this._then);

  final _MyRentalHandoverState _self;
  final $Res Function(_MyRentalHandoverState) _then;

/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rental = null,Object? exchangeRateStatus = null,Object? exchangeRate = freezed,Object? selectedFromCurrency = null,Object? payment = freezed,Object? isSubmitLoading = null,Object? isFinished = null,Object? error = freezed,}) {
  return _then(_MyRentalHandoverState(
rental: null == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as RentalResponseItemDetails,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedFromCurrency: null == selectedFromCurrency ? _self.selectedFromCurrency : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
as String,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as double?,isSubmitLoading: null == isSubmitLoading ? _self.isSubmitLoading : isSubmitLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of MyRentalHandoverState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<$Res> get rental {
  
  return $RentalResponseItemDetailsCopyWith<$Res>(_self.rental, (value) {
    return _then(_self.copyWith(rental: value));
  });
}/// Create a copy of MyRentalHandoverState
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
}/// Create a copy of MyRentalHandoverState
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
