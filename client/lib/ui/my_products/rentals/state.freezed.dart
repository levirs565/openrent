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
mixin _$MyRentalsState {

 List<RentalResponseItem> get list; bool get isLoading; GeneralErrorData? get error; tz.Location get timeZone;
/// Create a copy of MyRentalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRentalsStateCopyWith<MyRentalsState> get copyWith => _$MyRentalsStateCopyWithImpl<MyRentalsState>(this as MyRentalsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRentalsState&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),isLoading,error,timeZone);

@override
String toString() {
  return 'MyRentalsState(list: $list, isLoading: $isLoading, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class $MyRentalsStateCopyWith<$Res>  {
  factory $MyRentalsStateCopyWith(MyRentalsState value, $Res Function(MyRentalsState) _then) = _$MyRentalsStateCopyWithImpl;
@useResult
$Res call({
 List<RentalResponseItem> list, bool isLoading, GeneralErrorData? error, tz.Location timeZone
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyRentalsStateCopyWithImpl<$Res>
    implements $MyRentalsStateCopyWith<$Res> {
  _$MyRentalsStateCopyWithImpl(this._self, this._then);

  final MyRentalsState _self;
  final $Res Function(MyRentalsState) _then;

/// Create a copy of MyRentalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? isLoading = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<RentalResponseItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}
/// Create a copy of MyRentalsState
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


/// Adds pattern-matching-related methods to [MyRentalsState].
extension MyRentalsStatePatterns on MyRentalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRentalsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRentalsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRentalsState value)  $default,){
final _that = this;
switch (_that) {
case _MyRentalsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRentalsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRentalsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RentalResponseItem> list,  bool isLoading,  GeneralErrorData? error,  tz.Location timeZone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRentalsState() when $default != null:
return $default(_that.list,_that.isLoading,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RentalResponseItem> list,  bool isLoading,  GeneralErrorData? error,  tz.Location timeZone)  $default,) {final _that = this;
switch (_that) {
case _MyRentalsState():
return $default(_that.list,_that.isLoading,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RentalResponseItem> list,  bool isLoading,  GeneralErrorData? error,  tz.Location timeZone)?  $default,) {final _that = this;
switch (_that) {
case _MyRentalsState() when $default != null:
return $default(_that.list,_that.isLoading,_that.error,_that.timeZone);case _:
  return null;

}
}

}

/// @nodoc


class _MyRentalsState implements MyRentalsState {
  const _MyRentalsState({required final  List<RentalResponseItem> list, required this.isLoading, required this.error, required this.timeZone}): _list = list;
  

 final  List<RentalResponseItem> _list;
@override List<RentalResponseItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  bool isLoading;
@override final  GeneralErrorData? error;
@override final  tz.Location timeZone;

/// Create a copy of MyRentalsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRentalsStateCopyWith<_MyRentalsState> get copyWith => __$MyRentalsStateCopyWithImpl<_MyRentalsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRentalsState&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),isLoading,error,timeZone);

@override
String toString() {
  return 'MyRentalsState(list: $list, isLoading: $isLoading, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class _$MyRentalsStateCopyWith<$Res> implements $MyRentalsStateCopyWith<$Res> {
  factory _$MyRentalsStateCopyWith(_MyRentalsState value, $Res Function(_MyRentalsState) _then) = __$MyRentalsStateCopyWithImpl;
@override @useResult
$Res call({
 List<RentalResponseItem> list, bool isLoading, GeneralErrorData? error, tz.Location timeZone
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyRentalsStateCopyWithImpl<$Res>
    implements _$MyRentalsStateCopyWith<$Res> {
  __$MyRentalsStateCopyWithImpl(this._self, this._then);

  final _MyRentalsState _self;
  final $Res Function(_MyRentalsState) _then;

/// Create a copy of MyRentalsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? isLoading = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_MyRentalsState(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<RentalResponseItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}

/// Create a copy of MyRentalsState
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
