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
mixin _$ProductFormError {

 ProductFormErrorSource get source; ErrorWithDateTime get error;
/// Create a copy of ProductFormError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormErrorCopyWith<ProductFormError> get copyWith => _$ProductFormErrorCopyWithImpl<ProductFormError>(this as ProductFormError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormError&&(identical(other.source, source) || other.source == source)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,source,error);

@override
String toString() {
  return 'ProductFormError(source: $source, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductFormErrorCopyWith<$Res>  {
  factory $ProductFormErrorCopyWith(ProductFormError value, $Res Function(ProductFormError) _then) = _$ProductFormErrorCopyWithImpl;
@useResult
$Res call({
 ProductFormErrorSource source, ErrorWithDateTime error
});




}
/// @nodoc
class _$ProductFormErrorCopyWithImpl<$Res>
    implements $ProductFormErrorCopyWith<$Res> {
  _$ProductFormErrorCopyWithImpl(this._self, this._then);

  final ProductFormError _self;
  final $Res Function(ProductFormError) _then;

/// Create a copy of ProductFormError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? error = null,}) {
  return _then(ProductFormError(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ProductFormErrorSource,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorWithDateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFormError].
extension ProductFormErrorPatterns on ProductFormError {
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

/// @nodoc
mixin _$ProductFormState {

 List<AddressResponseItem> get addressList; String get name; int? get addressId; int? get pricePerDay; int? get lateFeePerDay; int? get stock; String get description; ProductFormDataStatus get dataStatus; ProductFormSubmissionStatus get submissionStatus; ProductFormError? get error;
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormStateCopyWith<ProductFormState> get copyWith => _$ProductFormStateCopyWithImpl<ProductFormState>(this as ProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormState&&const DeepCollectionEquality().equals(other.addressList, addressList)&&(identical(other.name, name) || other.name == name)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(addressList),name,addressId,pricePerDay,lateFeePerDay,stock,description,dataStatus,submissionStatus,error);

@override
String toString() {
  return 'ProductFormState(addressList: $addressList, name: $name, addressId: $addressId, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, dataStatus: $dataStatus, submissionStatus: $submissionStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductFormStateCopyWith<$Res>  {
  factory $ProductFormStateCopyWith(ProductFormState value, $Res Function(ProductFormState) _then) = _$ProductFormStateCopyWithImpl;
@useResult
$Res call({
 List<AddressResponseItem> addressList, String name, int? addressId, int? pricePerDay, int? lateFeePerDay, int? stock, String description, ProductFormDataStatus dataStatus, ProductFormSubmissionStatus submissionStatus, ProductFormError? error
});




}
/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._self, this._then);

  final ProductFormState _self;
  final $Res Function(ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addressList = null,Object? name = null,Object? addressId = freezed,Object? pricePerDay = freezed,Object? lateFeePerDay = freezed,Object? stock = freezed,Object? description = null,Object? dataStatus = null,Object? submissionStatus = null,Object? error = freezed,}) {
  return _then(ProductFormState(
addressList: null == addressList ? _self.addressList : addressList // ignore: cast_nullable_to_non_nullable
as List<AddressResponseItem>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,pricePerDay: freezed == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int?,lateFeePerDay: freezed == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as ProductFormDataStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as ProductFormSubmissionStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ProductFormError?,
  ));
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
