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
mixin _$ProductFormState {

 int? get id; List<AddressResponseItem> get addressList; String get name; int? get addressId; int? get pricePerDay; int? get lateFeePerDay; int? get stock; String get description; DataStatus get dataStatus; DataStatus get addressStatus; bool get isNearbyAddressLoading; ActionStatus get submissionStatus; ProductFormError? get error;
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormStateCopyWith<ProductFormState> get copyWith => _$ProductFormStateCopyWithImpl<ProductFormState>(this as ProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormState&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.addressList, addressList)&&(identical(other.name, name) || other.name == name)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.addressStatus, addressStatus) || other.addressStatus == addressStatus)&&(identical(other.isNearbyAddressLoading, isNearbyAddressLoading) || other.isNearbyAddressLoading == isNearbyAddressLoading)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(addressList),name,addressId,pricePerDay,lateFeePerDay,stock,description,dataStatus,addressStatus,isNearbyAddressLoading,submissionStatus,error);

@override
String toString() {
  return 'ProductFormState(id: $id, addressList: $addressList, name: $name, addressId: $addressId, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, dataStatus: $dataStatus, addressStatus: $addressStatus, isNearbyAddressLoading: $isNearbyAddressLoading, submissionStatus: $submissionStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductFormStateCopyWith<$Res>  {
  factory $ProductFormStateCopyWith(ProductFormState value, $Res Function(ProductFormState) _then) = _$ProductFormStateCopyWithImpl;
@useResult
$Res call({
 int? id, List<AddressResponseItem> addressList, String name, int? addressId, int? pricePerDay, int? lateFeePerDay, int? stock, String description, DataStatus dataStatus, DataStatus addressStatus, bool isNearbyAddressLoading, ActionStatus submissionStatus, ProductFormError? error
});


$ErrorDataCopyWith<ProductFormErrorSource, $Res>? get error;

}
/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._self, this._then);

  final ProductFormState _self;
  final $Res Function(ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? addressList = null,Object? name = null,Object? addressId = freezed,Object? pricePerDay = freezed,Object? lateFeePerDay = freezed,Object? stock = freezed,Object? description = null,Object? dataStatus = null,Object? addressStatus = null,Object? isNearbyAddressLoading = null,Object? submissionStatus = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,addressList: null == addressList ? _self.addressList : addressList // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,pricePerDay: freezed == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int?,lateFeePerDay: freezed == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,addressStatus: null == addressStatus ? _self.addressStatus : addressStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isNearbyAddressLoading: null == isNearbyAddressLoading ? _self.isNearbyAddressLoading : isNearbyAddressLoading // ignore: cast_nullable_to_non_nullable
as bool,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ProductFormError?,
  ));
}
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<ProductFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<ProductFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductFormState].
extension ProductFormStatePatterns on ProductFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProductFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  List<AddressResponseItem> addressList,  String name,  int? addressId,  int? pricePerDay,  int? lateFeePerDay,  int? stock,  String description,  DataStatus dataStatus,  DataStatus addressStatus,  bool isNearbyAddressLoading,  ActionStatus submissionStatus,  ProductFormError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.id,_that.addressList,_that.name,_that.addressId,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.dataStatus,_that.addressStatus,_that.isNearbyAddressLoading,_that.submissionStatus,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  List<AddressResponseItem> addressList,  String name,  int? addressId,  int? pricePerDay,  int? lateFeePerDay,  int? stock,  String description,  DataStatus dataStatus,  DataStatus addressStatus,  bool isNearbyAddressLoading,  ActionStatus submissionStatus,  ProductFormError? error)  $default,) {final _that = this;
switch (_that) {
case _ProductFormState():
return $default(_that.id,_that.addressList,_that.name,_that.addressId,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.dataStatus,_that.addressStatus,_that.isNearbyAddressLoading,_that.submissionStatus,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  List<AddressResponseItem> addressList,  String name,  int? addressId,  int? pricePerDay,  int? lateFeePerDay,  int? stock,  String description,  DataStatus dataStatus,  DataStatus addressStatus,  bool isNearbyAddressLoading,  ActionStatus submissionStatus,  ProductFormError? error)?  $default,) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.id,_that.addressList,_that.name,_that.addressId,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.dataStatus,_that.addressStatus,_that.isNearbyAddressLoading,_that.submissionStatus,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProductFormState extends ProductFormState {
  const _ProductFormState({required this.id, required final  List<AddressResponseItem> addressList, required this.name, required this.addressId, required this.pricePerDay, required this.lateFeePerDay, required this.stock, required this.description, required this.dataStatus, required this.addressStatus, required this.isNearbyAddressLoading, required this.submissionStatus, this.error}): _addressList = addressList,super._();
  

@override final  int? id;
 final  List<AddressResponseItem> _addressList;
@override List<AddressResponseItem> get addressList {
  if (_addressList is EqualUnmodifiableListView) return _addressList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addressList);
}

@override final  String name;
@override final  int? addressId;
@override final  int? pricePerDay;
@override final  int? lateFeePerDay;
@override final  int? stock;
@override final  String description;
@override final  DataStatus dataStatus;
@override final  DataStatus addressStatus;
@override final  bool isNearbyAddressLoading;
@override final  ActionStatus submissionStatus;
@override final  ProductFormError? error;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFormStateCopyWith<_ProductFormState> get copyWith => __$ProductFormStateCopyWithImpl<_ProductFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFormState&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._addressList, _addressList)&&(identical(other.name, name) || other.name == name)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.addressStatus, addressStatus) || other.addressStatus == addressStatus)&&(identical(other.isNearbyAddressLoading, isNearbyAddressLoading) || other.isNearbyAddressLoading == isNearbyAddressLoading)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_addressList),name,addressId,pricePerDay,lateFeePerDay,stock,description,dataStatus,addressStatus,isNearbyAddressLoading,submissionStatus,error);

@override
String toString() {
  return 'ProductFormState(id: $id, addressList: $addressList, name: $name, addressId: $addressId, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, dataStatus: $dataStatus, addressStatus: $addressStatus, isNearbyAddressLoading: $isNearbyAddressLoading, submissionStatus: $submissionStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProductFormStateCopyWith<$Res> implements $ProductFormStateCopyWith<$Res> {
  factory _$ProductFormStateCopyWith(_ProductFormState value, $Res Function(_ProductFormState) _then) = __$ProductFormStateCopyWithImpl;
@override @useResult
$Res call({
 int? id, List<AddressResponseItem> addressList, String name, int? addressId, int? pricePerDay, int? lateFeePerDay, int? stock, String description, DataStatus dataStatus, DataStatus addressStatus, bool isNearbyAddressLoading, ActionStatus submissionStatus, ProductFormError? error
});


@override $ErrorDataCopyWith<ProductFormErrorSource, $Res>? get error;

}
/// @nodoc
class __$ProductFormStateCopyWithImpl<$Res>
    implements _$ProductFormStateCopyWith<$Res> {
  __$ProductFormStateCopyWithImpl(this._self, this._then);

  final _ProductFormState _self;
  final $Res Function(_ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? addressList = null,Object? name = null,Object? addressId = freezed,Object? pricePerDay = freezed,Object? lateFeePerDay = freezed,Object? stock = freezed,Object? description = null,Object? dataStatus = null,Object? addressStatus = null,Object? isNearbyAddressLoading = null,Object? submissionStatus = null,Object? error = freezed,}) {
  return _then(_ProductFormState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,addressList: null == addressList ? _self._addressList : addressList // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,pricePerDay: freezed == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int?,lateFeePerDay: freezed == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,addressStatus: null == addressStatus ? _self.addressStatus : addressStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,isNearbyAddressLoading: null == isNearbyAddressLoading ? _self.isNearbyAddressLoading : isNearbyAddressLoading // ignore: cast_nullable_to_non_nullable
as bool,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ActionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ProductFormError?,
  ));
}

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<ProductFormErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<ProductFormErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
