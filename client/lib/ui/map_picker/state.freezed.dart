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
mixin _$MapPickerState {

 LatLng? get initialPosition; LatLng? get selectedPosition; bool get isUseCurrentPositionLoading; ReverseGeocodingResult? get reverseGeocodingResult; bool get isLoading; GeneralErrorData? get error;
/// Create a copy of MapPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPickerStateCopyWith<MapPickerState> get copyWith => _$MapPickerStateCopyWithImpl<MapPickerState>(this as MapPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPickerState&&(identical(other.initialPosition, initialPosition) || other.initialPosition == initialPosition)&&(identical(other.selectedPosition, selectedPosition) || other.selectedPosition == selectedPosition)&&(identical(other.isUseCurrentPositionLoading, isUseCurrentPositionLoading) || other.isUseCurrentPositionLoading == isUseCurrentPositionLoading)&&(identical(other.reverseGeocodingResult, reverseGeocodingResult) || other.reverseGeocodingResult == reverseGeocodingResult)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,initialPosition,selectedPosition,isUseCurrentPositionLoading,reverseGeocodingResult,isLoading,error);

@override
String toString() {
  return 'MapPickerState(initialPosition: $initialPosition, selectedPosition: $selectedPosition, isUseCurrentPositionLoading: $isUseCurrentPositionLoading, reverseGeocodingResult: $reverseGeocodingResult, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $MapPickerStateCopyWith<$Res>  {
  factory $MapPickerStateCopyWith(MapPickerState value, $Res Function(MapPickerState) _then) = _$MapPickerStateCopyWithImpl;
@useResult
$Res call({
 LatLng? initialPosition, LatLng? selectedPosition, bool isUseCurrentPositionLoading, ReverseGeocodingResult? reverseGeocodingResult, bool isLoading, GeneralErrorData? error
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MapPickerStateCopyWithImpl<$Res>
    implements $MapPickerStateCopyWith<$Res> {
  _$MapPickerStateCopyWithImpl(this._self, this._then);

  final MapPickerState _self;
  final $Res Function(MapPickerState) _then;

/// Create a copy of MapPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialPosition = freezed,Object? selectedPosition = freezed,Object? isUseCurrentPositionLoading = null,Object? reverseGeocodingResult = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
initialPosition: freezed == initialPosition ? _self.initialPosition : initialPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,selectedPosition: freezed == selectedPosition ? _self.selectedPosition : selectedPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,isUseCurrentPositionLoading: null == isUseCurrentPositionLoading ? _self.isUseCurrentPositionLoading : isUseCurrentPositionLoading // ignore: cast_nullable_to_non_nullable
as bool,reverseGeocodingResult: freezed == reverseGeocodingResult ? _self.reverseGeocodingResult : reverseGeocodingResult // ignore: cast_nullable_to_non_nullable
as ReverseGeocodingResult?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of MapPickerState
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


/// Adds pattern-matching-related methods to [MapPickerState].
extension MapPickerStatePatterns on MapPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPickerState value)  $default,){
final _that = this;
switch (_that) {
case _MapPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _MapPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng? initialPosition,  LatLng? selectedPosition,  bool isUseCurrentPositionLoading,  ReverseGeocodingResult? reverseGeocodingResult,  bool isLoading,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPickerState() when $default != null:
return $default(_that.initialPosition,_that.selectedPosition,_that.isUseCurrentPositionLoading,_that.reverseGeocodingResult,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng? initialPosition,  LatLng? selectedPosition,  bool isUseCurrentPositionLoading,  ReverseGeocodingResult? reverseGeocodingResult,  bool isLoading,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _MapPickerState():
return $default(_that.initialPosition,_that.selectedPosition,_that.isUseCurrentPositionLoading,_that.reverseGeocodingResult,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng? initialPosition,  LatLng? selectedPosition,  bool isUseCurrentPositionLoading,  ReverseGeocodingResult? reverseGeocodingResult,  bool isLoading,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _MapPickerState() when $default != null:
return $default(_that.initialPosition,_that.selectedPosition,_that.isUseCurrentPositionLoading,_that.reverseGeocodingResult,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MapPickerState extends MapPickerState {
  const _MapPickerState({required this.initialPosition, required this.selectedPosition, required this.isUseCurrentPositionLoading, required this.reverseGeocodingResult, required this.isLoading, this.error}): super._();
  

@override final  LatLng? initialPosition;
@override final  LatLng? selectedPosition;
@override final  bool isUseCurrentPositionLoading;
@override final  ReverseGeocodingResult? reverseGeocodingResult;
@override final  bool isLoading;
@override final  GeneralErrorData? error;

/// Create a copy of MapPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPickerStateCopyWith<_MapPickerState> get copyWith => __$MapPickerStateCopyWithImpl<_MapPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPickerState&&(identical(other.initialPosition, initialPosition) || other.initialPosition == initialPosition)&&(identical(other.selectedPosition, selectedPosition) || other.selectedPosition == selectedPosition)&&(identical(other.isUseCurrentPositionLoading, isUseCurrentPositionLoading) || other.isUseCurrentPositionLoading == isUseCurrentPositionLoading)&&(identical(other.reverseGeocodingResult, reverseGeocodingResult) || other.reverseGeocodingResult == reverseGeocodingResult)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,initialPosition,selectedPosition,isUseCurrentPositionLoading,reverseGeocodingResult,isLoading,error);

@override
String toString() {
  return 'MapPickerState(initialPosition: $initialPosition, selectedPosition: $selectedPosition, isUseCurrentPositionLoading: $isUseCurrentPositionLoading, reverseGeocodingResult: $reverseGeocodingResult, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MapPickerStateCopyWith<$Res> implements $MapPickerStateCopyWith<$Res> {
  factory _$MapPickerStateCopyWith(_MapPickerState value, $Res Function(_MapPickerState) _then) = __$MapPickerStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng? initialPosition, LatLng? selectedPosition, bool isUseCurrentPositionLoading, ReverseGeocodingResult? reverseGeocodingResult, bool isLoading, GeneralErrorData? error
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MapPickerStateCopyWithImpl<$Res>
    implements _$MapPickerStateCopyWith<$Res> {
  __$MapPickerStateCopyWithImpl(this._self, this._then);

  final _MapPickerState _self;
  final $Res Function(_MapPickerState) _then;

/// Create a copy of MapPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialPosition = freezed,Object? selectedPosition = freezed,Object? isUseCurrentPositionLoading = null,Object? reverseGeocodingResult = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_MapPickerState(
initialPosition: freezed == initialPosition ? _self.initialPosition : initialPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,selectedPosition: freezed == selectedPosition ? _self.selectedPosition : selectedPosition // ignore: cast_nullable_to_non_nullable
as LatLng?,isUseCurrentPositionLoading: null == isUseCurrentPositionLoading ? _self.isUseCurrentPositionLoading : isUseCurrentPositionLoading // ignore: cast_nullable_to_non_nullable
as bool,reverseGeocodingResult: freezed == reverseGeocodingResult ? _self.reverseGeocodingResult : reverseGeocodingResult // ignore: cast_nullable_to_non_nullable
as ReverseGeocodingResult?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of MapPickerState
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
