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
mixin _$AddressFormState {

 int? get id; LatLng get position; String get province; String get regency; String get district; String get detail; String get name; AddressFormError? get error; DataStatus get dataStatus; ActionStatus get submissionStatus;
/// Create a copy of AddressFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressFormStateCopyWith<AddressFormState> get copyWith => _$AddressFormStateCopyWithImpl<AddressFormState>(this as AddressFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.province, province) || other.province == province)&&(identical(other.regency, regency) || other.regency == regency)&&(identical(other.district, district) || other.district == district)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.name, name) || other.name == name)&&(identical(other.error, error) || other.error == error)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,position,province,regency,district,detail,name,error,dataStatus,submissionStatus);

@override
String toString() {
  return 'AddressFormState(id: $id, position: $position, province: $province, regency: $regency, district: $district, detail: $detail, name: $name, error: $error, dataStatus: $dataStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class $AddressFormStateCopyWith<$Res>  {
  factory $AddressFormStateCopyWith(AddressFormState value, $Res Function(AddressFormState) _then) = _$AddressFormStateCopyWithImpl;
@useResult
$Res call({
 int? id, LatLng position, String province, String regency, String district, String detail, String name, ActionStatus submissionStatus, ErrorData<AddressFormErrorSource>? error, DataStatus dataStatus
});




}
/// @nodoc
class _$AddressFormStateCopyWithImpl<$Res>
    implements $AddressFormStateCopyWith<$Res> {
  _$AddressFormStateCopyWithImpl(this._self, this._then);

  final AddressFormState _self;
  final $Res Function(AddressFormState) _then;

/// Create a copy of AddressFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? position = null,Object? province = null,Object? regency = null,Object? district = null,Object? detail = null,Object? name = null,Object? submissionStatus = null,Object? error = freezed,Object? dataStatus = null,}) {
  return _then(AddressFormState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,regency: null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorData<AddressFormErrorSource>?,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressFormState].
extension AddressFormStatePatterns on AddressFormState {
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
