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

 MyAddressesDataStatus get dataStatus; MyAddressesActionStatus get actionStatus; List<AddressResponseItem> get data; MyAddressesError? get error;
/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAddressesStateCopyWith<MyAddressesState> get copyWith => _$MyAddressesStateCopyWithImpl<MyAddressesState>(this as MyAddressesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAddressesState&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,dataStatus,actionStatus,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'MyAddressesState(dataStatus: $dataStatus, actionStatus: $actionStatus, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyAddressesStateCopyWith<$Res>  {
  factory $MyAddressesStateCopyWith(MyAddressesState value, $Res Function(MyAddressesState) _then) = _$MyAddressesStateCopyWithImpl;
@useResult
$Res call({
 List<AddressResponseItem> data, ErrorData<MyAddressesErrorSource>? error, MyAddressesDataStatus dataStatus, MyAddressesActionStatus actionStatus
});




}
/// @nodoc
class _$MyAddressesStateCopyWithImpl<$Res>
    implements $MyAddressesStateCopyWith<$Res> {
  _$MyAddressesStateCopyWithImpl(this._self, this._then);

  final MyAddressesState _self;
  final $Res Function(MyAddressesState) _then;

/// Create a copy of MyAddressesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? error = freezed,Object? dataStatus = null,Object? actionStatus = null,}) {
  return _then(MyAddressesState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorData<MyAddressesErrorSource>?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as MyAddressesDataStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as MyAddressesActionStatus,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
