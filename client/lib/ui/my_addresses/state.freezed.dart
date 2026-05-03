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
mixin _$MyAddressesState {

 DataStatus get dataStatus; bool get isActionLoading; List<AddressResponseItem> get data; MyAddressesError? get error;
/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAddressesStateCopyWith<MyAddressesState> get copyWith => _$MyAddressesStateCopyWithImpl<MyAddressesState>(this as MyAddressesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAddressesState&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,dataStatus,isActionLoading,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'MyAddressesState(dataStatus: $dataStatus, isActionLoading: $isActionLoading, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyAddressesStateCopyWith<$Res>  {
  factory $MyAddressesStateCopyWith(MyAddressesState value, $Res Function(MyAddressesState) _then) = _$MyAddressesStateCopyWithImpl;
@useResult
$Res call({
 DataStatus dataStatus, bool isActionLoading, List<AddressResponseItem> data, MyAddressesError? error
});


$ErrorDataCopyWith<MyAddressesErrorSource, $Res>? get error;

}
/// @nodoc
class _$MyAddressesStateCopyWithImpl<$Res>
    implements $MyAddressesStateCopyWith<$Res> {
  _$MyAddressesStateCopyWithImpl(this._self, this._then);

  final MyAddressesState _self;
  final $Res Function(MyAddressesState) _then;

/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataStatus = null,Object? isActionLoading = null,Object? data = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyAddressesError?,
  ));
}
/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyAddressesErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyAddressesErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyAddressesState].
extension MyAddressesStatePatterns on MyAddressesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAddressesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAddressesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAddressesState value)  $default,){
final _that = this;
switch (_that) {
case _MyAddressesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAddressesState value)?  $default,){
final _that = this;
switch (_that) {
case _MyAddressesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DataStatus dataStatus,  bool isActionLoading,  List<AddressResponseItem> data,  MyAddressesError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAddressesState() when $default != null:
return $default(_that.dataStatus,_that.isActionLoading,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DataStatus dataStatus,  bool isActionLoading,  List<AddressResponseItem> data,  MyAddressesError? error)  $default,) {final _that = this;
switch (_that) {
case _MyAddressesState():
return $default(_that.dataStatus,_that.isActionLoading,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DataStatus dataStatus,  bool isActionLoading,  List<AddressResponseItem> data,  MyAddressesError? error)?  $default,) {final _that = this;
switch (_that) {
case _MyAddressesState() when $default != null:
return $default(_that.dataStatus,_that.isActionLoading,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyAddressesState extends MyAddressesState {
  const _MyAddressesState({required this.dataStatus, required this.isActionLoading, required final  List<AddressResponseItem> data, required this.error}): _data = data,super._();
  

@override final  DataStatus dataStatus;
@override final  bool isActionLoading;
 final  List<AddressResponseItem> _data;
@override List<AddressResponseItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  MyAddressesError? error;

/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAddressesStateCopyWith<_MyAddressesState> get copyWith => __$MyAddressesStateCopyWithImpl<_MyAddressesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAddressesState&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,dataStatus,isActionLoading,const DeepCollectionEquality().hash(_data),error);

@override
String toString() {
  return 'MyAddressesState(dataStatus: $dataStatus, isActionLoading: $isActionLoading, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyAddressesStateCopyWith<$Res> implements $MyAddressesStateCopyWith<$Res> {
  factory _$MyAddressesStateCopyWith(_MyAddressesState value, $Res Function(_MyAddressesState) _then) = __$MyAddressesStateCopyWithImpl;
@override @useResult
$Res call({
 DataStatus dataStatus, bool isActionLoading, List<AddressResponseItem> data, MyAddressesError? error
});


@override $ErrorDataCopyWith<MyAddressesErrorSource, $Res>? get error;

}
/// @nodoc
class __$MyAddressesStateCopyWithImpl<$Res>
    implements _$MyAddressesStateCopyWith<$Res> {
  __$MyAddressesStateCopyWithImpl(this._self, this._then);

  final _MyAddressesState _self;
  final $Res Function(_MyAddressesState) _then;

/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataStatus = null,Object? isActionLoading = null,Object? data = null,Object? error = freezed,}) {
  return _then(_MyAddressesState(
dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyAddressesError?,
  ));
}

/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyAddressesErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyAddressesErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
