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
mixin _$SearchState {

 ExchangeRateResponse? get exchangeRate; String get selectedCurrency; DataStatus get exchangeRateStatus; List<ProductResponseItemShort> get result; bool get isSearchLoading; SearchError? get error; LatLng? get currentPosition; bool get isMapView;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.isSearchLoading, isSearchLoading) || other.isSearchLoading == isSearchLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.isMapView, isMapView) || other.isMapView == isMapView));
}


@override
int get hashCode => Object.hash(runtimeType,exchangeRate,selectedCurrency,exchangeRateStatus,const DeepCollectionEquality().hash(result),isSearchLoading,error,currentPosition,isMapView);

@override
String toString() {
  return 'SearchState(exchangeRate: $exchangeRate, selectedCurrency: $selectedCurrency, exchangeRateStatus: $exchangeRateStatus, result: $result, isSearchLoading: $isSearchLoading, error: $error, currentPosition: $currentPosition, isMapView: $isMapView)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 ExchangeRateResponse? exchangeRate, String selectedCurrency, DataStatus exchangeRateStatus, List<ProductResponseItemShort> result, bool isSearchLoading, SearchError? error, LatLng? currentPosition, bool isMapView
});


$ExchangeRateResponseCopyWith<$Res>? get exchangeRate;$ErrorDataCopyWith<SearchErrorSource, $Res>? get error;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exchangeRate = freezed,Object? selectedCurrency = null,Object? exchangeRateStatus = null,Object? result = null,Object? isSearchLoading = null,Object? error = freezed,Object? currentPosition = freezed,Object? isMapView = null,}) {
  return _then(_self.copyWith(
exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as String,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<ProductResponseItemShort>,isSearchLoading: null == isSearchLoading ? _self.isSearchLoading : isSearchLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SearchError?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,isMapView: null == isMapView ? _self.isMapView : isMapView // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SearchState
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
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<SearchErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<SearchErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  List<ProductResponseItemShort> result,  bool isSearchLoading,  SearchError? error,  LatLng? currentPosition,  bool isMapView)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.result,_that.isSearchLoading,_that.error,_that.currentPosition,_that.isMapView);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  List<ProductResponseItemShort> result,  bool isSearchLoading,  SearchError? error,  LatLng? currentPosition,  bool isMapView)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.result,_that.isSearchLoading,_that.error,_that.currentPosition,_that.isMapView);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExchangeRateResponse? exchangeRate,  String selectedCurrency,  DataStatus exchangeRateStatus,  List<ProductResponseItemShort> result,  bool isSearchLoading,  SearchError? error,  LatLng? currentPosition,  bool isMapView)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.exchangeRate,_that.selectedCurrency,_that.exchangeRateStatus,_that.result,_that.isSearchLoading,_that.error,_that.currentPosition,_that.isMapView);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
   _SearchState({required this.exchangeRate, required this.selectedCurrency, required this.exchangeRateStatus, required final  List<ProductResponseItemShort> result, required this.isSearchLoading, required this.error, required this.currentPosition, required this.isMapView}): _result = result,super._();
  

@override final  ExchangeRateResponse? exchangeRate;
@override final  String selectedCurrency;
@override final  DataStatus exchangeRateStatus;
 final  List<ProductResponseItemShort> _result;
@override List<ProductResponseItemShort> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}

@override final  bool isSearchLoading;
@override final  SearchError? error;
@override final  LatLng? currentPosition;
@override final  bool isMapView;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.exchangeRateStatus, exchangeRateStatus) || other.exchangeRateStatus == exchangeRateStatus)&&const DeepCollectionEquality().equals(other._result, _result)&&(identical(other.isSearchLoading, isSearchLoading) || other.isSearchLoading == isSearchLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.isMapView, isMapView) || other.isMapView == isMapView));
}


@override
int get hashCode => Object.hash(runtimeType,exchangeRate,selectedCurrency,exchangeRateStatus,const DeepCollectionEquality().hash(_result),isSearchLoading,error,currentPosition,isMapView);

@override
String toString() {
  return 'SearchState(exchangeRate: $exchangeRate, selectedCurrency: $selectedCurrency, exchangeRateStatus: $exchangeRateStatus, result: $result, isSearchLoading: $isSearchLoading, error: $error, currentPosition: $currentPosition, isMapView: $isMapView)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 ExchangeRateResponse? exchangeRate, String selectedCurrency, DataStatus exchangeRateStatus, List<ProductResponseItemShort> result, bool isSearchLoading, SearchError? error, LatLng? currentPosition, bool isMapView
});


@override $ExchangeRateResponseCopyWith<$Res>? get exchangeRate;@override $ErrorDataCopyWith<SearchErrorSource, $Res>? get error;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exchangeRate = freezed,Object? selectedCurrency = null,Object? exchangeRateStatus = null,Object? result = null,Object? isSearchLoading = null,Object? error = freezed,Object? currentPosition = freezed,Object? isMapView = null,}) {
  return _then(_SearchState(
exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRateResponse?,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as String,exchangeRateStatus: null == exchangeRateStatus ? _self.exchangeRateStatus : exchangeRateStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<ProductResponseItemShort>,isSearchLoading: null == isSearchLoading ? _self.isSearchLoading : isSearchLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SearchError?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,isMapView: null == isMapView ? _self.isMapView : isMapView // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SearchState
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
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<SearchErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<SearchErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
