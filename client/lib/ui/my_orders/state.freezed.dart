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
mixin _$MyOrdersState {

 bool get isLoading; List<OrderResponseItem> get list; GeneralErrorData? get error; tz.Location get timeZone;
/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOrdersStateCopyWith<MyOrdersState> get copyWith => _$MyOrdersStateCopyWithImpl<MyOrdersState>(this as MyOrdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(list),error,timeZone);

@override
String toString() {
  return 'MyOrdersState(isLoading: $isLoading, list: $list, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class $MyOrdersStateCopyWith<$Res>  {
  factory $MyOrdersStateCopyWith(MyOrdersState value, $Res Function(MyOrdersState) _then) = _$MyOrdersStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<OrderResponseItem> list, GeneralErrorData? error, tz.Location timeZone
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$MyOrdersStateCopyWithImpl<$Res>
    implements $MyOrdersStateCopyWith<$Res> {
  _$MyOrdersStateCopyWithImpl(this._self, this._then);

  final MyOrdersState _self;
  final $Res Function(MyOrdersState) _then;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? list = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<OrderResponseItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}
/// Create a copy of MyOrdersState
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


/// Adds pattern-matching-related methods to [MyOrdersState].
extension MyOrdersStatePatterns on MyOrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyOrdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyOrdersState value)  $default,){
final _that = this;
switch (_that) {
case _MyOrdersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyOrdersState value)?  $default,){
final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<OrderResponseItem> list,  GeneralErrorData? error,  tz.Location timeZone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
return $default(_that.isLoading,_that.list,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<OrderResponseItem> list,  GeneralErrorData? error,  tz.Location timeZone)  $default,) {final _that = this;
switch (_that) {
case _MyOrdersState():
return $default(_that.isLoading,_that.list,_that.error,_that.timeZone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<OrderResponseItem> list,  GeneralErrorData? error,  tz.Location timeZone)?  $default,) {final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
return $default(_that.isLoading,_that.list,_that.error,_that.timeZone);case _:
  return null;

}
}

}

/// @nodoc


class _MyOrdersState implements MyOrdersState {
   _MyOrdersState({required this.isLoading, required final  List<OrderResponseItem> list, required this.error, required this.timeZone}): _list = list;
  

@override final  bool isLoading;
 final  List<OrderResponseItem> _list;
@override List<OrderResponseItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  GeneralErrorData? error;
@override final  tz.Location timeZone;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOrdersStateCopyWith<_MyOrdersState> get copyWith => __$MyOrdersStateCopyWithImpl<_MyOrdersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOrdersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_list),error,timeZone);

@override
String toString() {
  return 'MyOrdersState(isLoading: $isLoading, list: $list, error: $error, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class _$MyOrdersStateCopyWith<$Res> implements $MyOrdersStateCopyWith<$Res> {
  factory _$MyOrdersStateCopyWith(_MyOrdersState value, $Res Function(_MyOrdersState) _then) = __$MyOrdersStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<OrderResponseItem> list, GeneralErrorData? error, tz.Location timeZone
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$MyOrdersStateCopyWithImpl<$Res>
    implements _$MyOrdersStateCopyWith<$Res> {
  __$MyOrdersStateCopyWithImpl(this._self, this._then);

  final _MyOrdersState _self;
  final $Res Function(_MyOrdersState) _then;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? list = null,Object? error = freezed,Object? timeZone = null,}) {
  return _then(_MyOrdersState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<OrderResponseItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as tz.Location,
  ));
}

/// Create a copy of MyOrdersState
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
