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
mixin _$MyProductListState {

 bool get isLoading; List<MyProductResponseItemShort> get data; GeneralErrorData? get error;
/// Create a copy of MyProductListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductListStateCopyWith<MyProductListState> get copyWith => _$MyProductListStateCopyWithImpl<MyProductListState>(this as MyProductListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'MyProductListState(isLoading: $isLoading, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyProductListStateCopyWith<$Res>  {
  factory $MyProductListStateCopyWith(MyProductListState value, $Res Function(MyProductListState) _then) = _$MyProductListStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<MyProductResponseItemShort> data, GeneralErrorData? error
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyProductListStateCopyWithImpl<$Res>
    implements $MyProductListStateCopyWith<$Res> {
  _$MyProductListStateCopyWithImpl(this._self, this._then);

  final MyProductListState _self;
  final $Res Function(MyProductListState) _then;

/// Create a copy of MyProductListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? data = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MyProductResponseItemShort>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of MyProductListState
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


/// Adds pattern-matching-related methods to [MyProductListState].
extension MyProductListStatePatterns on MyProductListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductListState value)  $default,){
final _that = this;
switch (_that) {
case _MyProductListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductListState value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<MyProductResponseItemShort> data,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductListState() when $default != null:
return $default(_that.isLoading,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<MyProductResponseItemShort> data,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _MyProductListState():
return $default(_that.isLoading,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<MyProductResponseItemShort> data,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _MyProductListState() when $default != null:
return $default(_that.isLoading,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyProductListState implements MyProductListState {
   _MyProductListState({required this.isLoading, required final  List<MyProductResponseItemShort> data, required this.error}): _data = data;
  

@override final  bool isLoading;
 final  List<MyProductResponseItemShort> _data;
@override List<MyProductResponseItemShort> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  GeneralErrorData? error;

/// Create a copy of MyProductListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductListStateCopyWith<_MyProductListState> get copyWith => __$MyProductListStateCopyWithImpl<_MyProductListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_data),error);

@override
String toString() {
  return 'MyProductListState(isLoading: $isLoading, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyProductListStateCopyWith<$Res> implements $MyProductListStateCopyWith<$Res> {
  factory _$MyProductListStateCopyWith(_MyProductListState value, $Res Function(_MyProductListState) _then) = __$MyProductListStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<MyProductResponseItemShort> data, GeneralErrorData? error
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyProductListStateCopyWithImpl<$Res>
    implements _$MyProductListStateCopyWith<$Res> {
  __$MyProductListStateCopyWithImpl(this._self, this._then);

  final _MyProductListState _self;
  final $Res Function(_MyProductListState) _then;

/// Create a copy of MyProductListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? data = null,Object? error = freezed,}) {
  return _then(_MyProductListState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MyProductResponseItemShort>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of MyProductListState
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
