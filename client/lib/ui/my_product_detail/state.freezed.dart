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
mixin _$MyProductDetailState {

 MyProductResponseItemDetail? get data; MyProductDetailError? get error; int get id; DataStatus get dataStatus; bool get isImageUpload;
/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductDetailStateCopyWith<MyProductDetailState> get copyWith => _$MyProductDetailStateCopyWithImpl<MyProductDetailState>(this as MyProductDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductDetailState&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isImageUpload, isImageUpload) || other.isImageUpload == isImageUpload));
}


@override
int get hashCode => Object.hash(runtimeType,data,error,id,dataStatus,isImageUpload);

@override
String toString() {
  return 'MyProductDetailState(data: $data, error: $error, id: $id, dataStatus: $dataStatus, isImageUpload: $isImageUpload)';
}


}

/// @nodoc
abstract mixin class $MyProductDetailStateCopyWith<$Res>  {
  factory $MyProductDetailStateCopyWith(MyProductDetailState value, $Res Function(MyProductDetailState) _then) = _$MyProductDetailStateCopyWithImpl;
@useResult
$Res call({
 MyProductResponseItemDetail? data, MyProductDetailError? error, int id, DataStatus dataStatus, bool isImageUpload
});


$MyProductResponseItemDetailCopyWith<$Res>? get data;$ErrorDataCopyWith<MyProductDetailErrorSource, $Res>? get error;

}
/// @nodoc
class _$MyProductDetailStateCopyWithImpl<$Res>
    implements $MyProductDetailStateCopyWith<$Res> {
  _$MyProductDetailStateCopyWithImpl(this._self, this._then);

  final MyProductDetailState _self;
  final $Res Function(MyProductDetailState) _then;

/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? error = freezed,Object? id = null,Object? dataStatus = null,Object? isImageUpload = null,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyProductResponseItemDetail?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyProductDetailError?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isImageUpload: null == isImageUpload ? _self.isImageUpload : isImageUpload // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductResponseItemDetailCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MyProductResponseItemDetailCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyProductDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyProductDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyProductDetailState].
extension MyProductDetailStatePatterns on MyProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MyProductDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyProductResponseItemDetail? data,  MyProductDetailError? error,  int id,  DataStatus dataStatus,  bool isImageUpload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductDetailState() when $default != null:
return $default(_that.data,_that.error,_that.id,_that.dataStatus,_that.isImageUpload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyProductResponseItemDetail? data,  MyProductDetailError? error,  int id,  DataStatus dataStatus,  bool isImageUpload)  $default,) {final _that = this;
switch (_that) {
case _MyProductDetailState():
return $default(_that.data,_that.error,_that.id,_that.dataStatus,_that.isImageUpload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyProductResponseItemDetail? data,  MyProductDetailError? error,  int id,  DataStatus dataStatus,  bool isImageUpload)?  $default,) {final _that = this;
switch (_that) {
case _MyProductDetailState() when $default != null:
return $default(_that.data,_that.error,_that.id,_that.dataStatus,_that.isImageUpload);case _:
  return null;

}
}

}

/// @nodoc


class _MyProductDetailState extends MyProductDetailState {
  const _MyProductDetailState({required this.data, required this.error, required this.id, required this.dataStatus, required this.isImageUpload}): super._();
  

@override final  MyProductResponseItemDetail? data;
@override final  MyProductDetailError? error;
@override final  int id;
@override final  DataStatus dataStatus;
@override final  bool isImageUpload;

/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductDetailStateCopyWith<_MyProductDetailState> get copyWith => __$MyProductDetailStateCopyWithImpl<_MyProductDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductDetailState&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.isImageUpload, isImageUpload) || other.isImageUpload == isImageUpload));
}


@override
int get hashCode => Object.hash(runtimeType,data,error,id,dataStatus,isImageUpload);

@override
String toString() {
  return 'MyProductDetailState(data: $data, error: $error, id: $id, dataStatus: $dataStatus, isImageUpload: $isImageUpload)';
}


}

/// @nodoc
abstract mixin class _$MyProductDetailStateCopyWith<$Res> implements $MyProductDetailStateCopyWith<$Res> {
  factory _$MyProductDetailStateCopyWith(_MyProductDetailState value, $Res Function(_MyProductDetailState) _then) = __$MyProductDetailStateCopyWithImpl;
@override @useResult
$Res call({
 MyProductResponseItemDetail? data, MyProductDetailError? error, int id, DataStatus dataStatus, bool isImageUpload
});


@override $MyProductResponseItemDetailCopyWith<$Res>? get data;@override $ErrorDataCopyWith<MyProductDetailErrorSource, $Res>? get error;

}
/// @nodoc
class __$MyProductDetailStateCopyWithImpl<$Res>
    implements _$MyProductDetailStateCopyWith<$Res> {
  __$MyProductDetailStateCopyWithImpl(this._self, this._then);

  final _MyProductDetailState _self;
  final $Res Function(_MyProductDetailState) _then;

/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,Object? id = null,Object? dataStatus = null,Object? isImageUpload = null,}) {
  return _then(_MyProductDetailState(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyProductResponseItemDetail?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyProductDetailError?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isImageUpload: null == isImageUpload ? _self.isImageUpload : isImageUpload // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductResponseItemDetailCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MyProductResponseItemDetailCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MyProductDetailErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MyProductDetailErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
