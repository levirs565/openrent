// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentalProductShort {

 int get id; String get name;@JsonKey(name: "image_url") String? get imageUrl;
/// Create a copy of RentalProductShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalProductShortCopyWith<RentalProductShort> get copyWith => _$RentalProductShortCopyWithImpl<RentalProductShort>(this as RentalProductShort, _$identity);

  /// Serializes this RentalProductShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString() {
  return 'RentalProductShort(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RentalProductShortCopyWith<$Res>  {
  factory $RentalProductShortCopyWith(RentalProductShort value, $Res Function(RentalProductShort) _then) = _$RentalProductShortCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class _$RentalProductShortCopyWithImpl<$Res>
    implements $RentalProductShortCopyWith<$Res> {
  _$RentalProductShortCopyWithImpl(this._self, this._then);

  final RentalProductShort _self;
  final $Res Function(RentalProductShort) _then;

/// Create a copy of RentalProductShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalProductShort].
extension RentalProductShortPatterns on RentalProductShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalProductShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalProductShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalProductShort value)  $default,){
final _that = this;
switch (_that) {
case _RentalProductShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalProductShort value)?  $default,){
final _that = this;
switch (_that) {
case _RentalProductShort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalProductShort() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _RentalProductShort():
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _RentalProductShort() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalProductShort implements RentalProductShort {
  const _RentalProductShort({required this.id, required this.name, @JsonKey(name: "image_url") required this.imageUrl});
  factory _RentalProductShort.fromJson(Map<String, dynamic> json) => _$RentalProductShortFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: "image_url") final  String? imageUrl;

/// Create a copy of RentalProductShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalProductShortCopyWith<_RentalProductShort> get copyWith => __$RentalProductShortCopyWithImpl<_RentalProductShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalProductShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString() {
  return 'RentalProductShort(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RentalProductShortCopyWith<$Res> implements $RentalProductShortCopyWith<$Res> {
  factory _$RentalProductShortCopyWith(_RentalProductShort value, $Res Function(_RentalProductShort) _then) = __$RentalProductShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class __$RentalProductShortCopyWithImpl<$Res>
    implements _$RentalProductShortCopyWith<$Res> {
  __$RentalProductShortCopyWithImpl(this._self, this._then);

  final _RentalProductShort _self;
  final $Res Function(_RentalProductShort) _then;

/// Create a copy of RentalProductShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(_RentalProductShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RentalProductAddressDetails {

 String get province; String get regency; String get district; String get detail; double get latitude; double get longitude;
/// Create a copy of RentalProductAddressDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalProductAddressDetailsCopyWith<RentalProductAddressDetails> get copyWith => _$RentalProductAddressDetailsCopyWithImpl<RentalProductAddressDetails>(this as RentalProductAddressDetails, _$identity);

  /// Serializes this RentalProductAddressDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalProductAddressDetails&&(identical(other.province, province) || other.province == province)&&(identical(other.regency, regency) || other.regency == regency)&&(identical(other.district, district) || other.district == district)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,province,regency,district,detail,latitude,longitude);

@override
String toString() {
  return 'RentalProductAddressDetails(province: $province, regency: $regency, district: $district, detail: $detail, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $RentalProductAddressDetailsCopyWith<$Res>  {
  factory $RentalProductAddressDetailsCopyWith(RentalProductAddressDetails value, $Res Function(RentalProductAddressDetails) _then) = _$RentalProductAddressDetailsCopyWithImpl;
@useResult
$Res call({
 String province, String regency, String district, String detail, double latitude, double longitude
});




}
/// @nodoc
class _$RentalProductAddressDetailsCopyWithImpl<$Res>
    implements $RentalProductAddressDetailsCopyWith<$Res> {
  _$RentalProductAddressDetailsCopyWithImpl(this._self, this._then);

  final RentalProductAddressDetails _self;
  final $Res Function(RentalProductAddressDetails) _then;

/// Create a copy of RentalProductAddressDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? province = null,Object? regency = null,Object? district = null,Object? detail = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,regency: null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalProductAddressDetails].
extension RentalProductAddressDetailsPatterns on RentalProductAddressDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalProductAddressDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalProductAddressDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalProductAddressDetails value)  $default,){
final _that = this;
switch (_that) {
case _RentalProductAddressDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalProductAddressDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RentalProductAddressDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String province,  String regency,  String district,  String detail,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalProductAddressDetails() when $default != null:
return $default(_that.province,_that.regency,_that.district,_that.detail,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String province,  String regency,  String district,  String detail,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _RentalProductAddressDetails():
return $default(_that.province,_that.regency,_that.district,_that.detail,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String province,  String regency,  String district,  String detail,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _RentalProductAddressDetails() when $default != null:
return $default(_that.province,_that.regency,_that.district,_that.detail,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalProductAddressDetails implements RentalProductAddressDetails {
  const _RentalProductAddressDetails({required this.province, required this.regency, required this.district, required this.detail, required this.latitude, required this.longitude});
  factory _RentalProductAddressDetails.fromJson(Map<String, dynamic> json) => _$RentalProductAddressDetailsFromJson(json);

@override final  String province;
@override final  String regency;
@override final  String district;
@override final  String detail;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of RentalProductAddressDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalProductAddressDetailsCopyWith<_RentalProductAddressDetails> get copyWith => __$RentalProductAddressDetailsCopyWithImpl<_RentalProductAddressDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalProductAddressDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalProductAddressDetails&&(identical(other.province, province) || other.province == province)&&(identical(other.regency, regency) || other.regency == regency)&&(identical(other.district, district) || other.district == district)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,province,regency,district,detail,latitude,longitude);

@override
String toString() {
  return 'RentalProductAddressDetails(province: $province, regency: $regency, district: $district, detail: $detail, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$RentalProductAddressDetailsCopyWith<$Res> implements $RentalProductAddressDetailsCopyWith<$Res> {
  factory _$RentalProductAddressDetailsCopyWith(_RentalProductAddressDetails value, $Res Function(_RentalProductAddressDetails) _then) = __$RentalProductAddressDetailsCopyWithImpl;
@override @useResult
$Res call({
 String province, String regency, String district, String detail, double latitude, double longitude
});




}
/// @nodoc
class __$RentalProductAddressDetailsCopyWithImpl<$Res>
    implements _$RentalProductAddressDetailsCopyWith<$Res> {
  __$RentalProductAddressDetailsCopyWithImpl(this._self, this._then);

  final _RentalProductAddressDetails _self;
  final $Res Function(_RentalProductAddressDetails) _then;

/// Create a copy of RentalProductAddressDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? province = null,Object? regency = null,Object? district = null,Object? detail = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_RentalProductAddressDetails(
province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,regency: null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RentalProductDetail {

 int get id; String get name;@JsonKey(name: "image_url") String? get imageUrl;@JsonKey(name: "price_per_day") int get pricePerDay;@JsonKey(name: "late_fee_per_day") int get lateFeePerDay; RentalProductAddressDetails get address;
/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalProductDetailCopyWith<RentalProductDetail> get copyWith => _$RentalProductDetailCopyWithImpl<RentalProductDetail>(this as RentalProductDetail, _$identity);

  /// Serializes this RentalProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,pricePerDay,lateFeePerDay,address);

@override
String toString() {
  return 'RentalProductDetail(id: $id, name: $name, imageUrl: $imageUrl, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, address: $address)';
}


}

/// @nodoc
abstract mixin class $RentalProductDetailCopyWith<$Res>  {
  factory $RentalProductDetailCopyWith(RentalProductDetail value, $Res Function(RentalProductDetail) _then) = _$RentalProductDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, RentalProductAddressDetails address
});


$RentalProductAddressDetailsCopyWith<$Res> get address;

}
/// @nodoc
class _$RentalProductDetailCopyWithImpl<$Res>
    implements $RentalProductDetailCopyWith<$Res> {
  _$RentalProductDetailCopyWithImpl(this._self, this._then);

  final RentalProductDetail _self;
  final $Res Function(RentalProductDetail) _then;

/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as RentalProductAddressDetails,
  ));
}
/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductAddressDetailsCopyWith<$Res> get address {
  
  return $RentalProductAddressDetailsCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalProductDetail].
extension RentalProductDetailPatterns on RentalProductDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalProductDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalProductDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalProductDetail value)  $default,){
final _that = this;
switch (_that) {
case _RentalProductDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalProductDetail value)?  $default,){
final _that = this;
switch (_that) {
case _RentalProductDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  RentalProductAddressDetails address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.pricePerDay,_that.lateFeePerDay,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  RentalProductAddressDetails address)  $default,) {final _that = this;
switch (_that) {
case _RentalProductDetail():
return $default(_that.id,_that.name,_that.imageUrl,_that.pricePerDay,_that.lateFeePerDay,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  RentalProductAddressDetails address)?  $default,) {final _that = this;
switch (_that) {
case _RentalProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.pricePerDay,_that.lateFeePerDay,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalProductDetail implements RentalProductDetail {
  const _RentalProductDetail({required this.id, required this.name, @JsonKey(name: "image_url") required this.imageUrl, @JsonKey(name: "price_per_day") required this.pricePerDay, @JsonKey(name: "late_fee_per_day") required this.lateFeePerDay, required this.address});
  factory _RentalProductDetail.fromJson(Map<String, dynamic> json) => _$RentalProductDetailFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: "image_url") final  String? imageUrl;
@override@JsonKey(name: "price_per_day") final  int pricePerDay;
@override@JsonKey(name: "late_fee_per_day") final  int lateFeePerDay;
@override final  RentalProductAddressDetails address;

/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalProductDetailCopyWith<_RentalProductDetail> get copyWith => __$RentalProductDetailCopyWithImpl<_RentalProductDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalProductDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,pricePerDay,lateFeePerDay,address);

@override
String toString() {
  return 'RentalProductDetail(id: $id, name: $name, imageUrl: $imageUrl, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, address: $address)';
}


}

/// @nodoc
abstract mixin class _$RentalProductDetailCopyWith<$Res> implements $RentalProductDetailCopyWith<$Res> {
  factory _$RentalProductDetailCopyWith(_RentalProductDetail value, $Res Function(_RentalProductDetail) _then) = __$RentalProductDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, RentalProductAddressDetails address
});


@override $RentalProductAddressDetailsCopyWith<$Res> get address;

}
/// @nodoc
class __$RentalProductDetailCopyWithImpl<$Res>
    implements _$RentalProductDetailCopyWith<$Res> {
  __$RentalProductDetailCopyWithImpl(this._self, this._then);

  final _RentalProductDetail _self;
  final $Res Function(_RentalProductDetail) _then;

/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? address = null,}) {
  return _then(_RentalProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as RentalProductAddressDetails,
  ));
}

/// Create a copy of RentalProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductAddressDetailsCopyWith<$Res> get address {
  
  return $RentalProductAddressDetailsCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$RentalUserShort {

 int get id; String get name;
/// Create a copy of RentalUserShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalUserShortCopyWith<RentalUserShort> get copyWith => _$RentalUserShortCopyWithImpl<RentalUserShort>(this as RentalUserShort, _$identity);

  /// Serializes this RentalUserShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalUserShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RentalUserShortCopyWith<$Res>  {
  factory $RentalUserShortCopyWith(RentalUserShort value, $Res Function(RentalUserShort) _then) = _$RentalUserShortCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$RentalUserShortCopyWithImpl<$Res>
    implements $RentalUserShortCopyWith<$Res> {
  _$RentalUserShortCopyWithImpl(this._self, this._then);

  final RentalUserShort _self;
  final $Res Function(RentalUserShort) _then;

/// Create a copy of RentalUserShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalUserShort].
extension RentalUserShortPatterns on RentalUserShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalUserShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalUserShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalUserShort value)  $default,){
final _that = this;
switch (_that) {
case _RentalUserShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalUserShort value)?  $default,){
final _that = this;
switch (_that) {
case _RentalUserShort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalUserShort() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _RentalUserShort():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _RentalUserShort() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalUserShort implements RentalUserShort {
  const _RentalUserShort({required this.id, required this.name});
  factory _RentalUserShort.fromJson(Map<String, dynamic> json) => _$RentalUserShortFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of RentalUserShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalUserShortCopyWith<_RentalUserShort> get copyWith => __$RentalUserShortCopyWithImpl<_RentalUserShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalUserShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalUserShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RentalUserShortCopyWith<$Res> implements $RentalUserShortCopyWith<$Res> {
  factory _$RentalUserShortCopyWith(_RentalUserShort value, $Res Function(_RentalUserShort) _then) = __$RentalUserShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$RentalUserShortCopyWithImpl<$Res>
    implements _$RentalUserShortCopyWith<$Res> {
  __$RentalUserShortCopyWithImpl(this._self, this._then);

  final _RentalUserShort _self;
  final $Res Function(_RentalUserShort) _then;

/// Create a copy of RentalUserShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RentalUserShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RentalResponseItem {

 int get id; RentalProductShort get product; RentalUserShort get user; RentState get state;@JsonKey(name: "start_date")@Iso8601Converter() DateTime get startDate;@JsonKey(name: "end_date")@Iso8601Converter() DateTime get endDate; int get quantity;
/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalResponseItemCopyWith<RentalResponseItem> get copyWith => _$RentalResponseItemCopyWithImpl<RentalResponseItem>(this as RentalResponseItem, _$identity);

  /// Serializes this RentalResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,state,startDate,endDate,quantity);

@override
String toString() {
  return 'RentalResponseItem(id: $id, product: $product, user: $user, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $RentalResponseItemCopyWith<$Res>  {
  factory $RentalResponseItemCopyWith(RentalResponseItem value, $Res Function(RentalResponseItem) _then) = _$RentalResponseItemCopyWithImpl;
@useResult
$Res call({
 int id, RentalProductShort product, RentalUserShort user, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


$RentalProductShortCopyWith<$Res> get product;$RentalUserShortCopyWith<$Res> get user;

}
/// @nodoc
class _$RentalResponseItemCopyWithImpl<$Res>
    implements $RentalResponseItemCopyWith<$Res> {
  _$RentalResponseItemCopyWithImpl(this._self, this._then);

  final RentalResponseItem _self;
  final $Res Function(RentalResponseItem) _then;

/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? user = null,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as RentalProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RentalUserShort,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductShortCopyWith<$Res> get product {
  
  return $RentalProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalUserShortCopyWith<$Res> get user {
  
  return $RentalUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalResponseItem].
extension RentalResponseItemPatterns on RentalResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _RentalResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _RentalResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  RentalProductShort product,  RentalUserShort user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalResponseItem() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  RentalProductShort product,  RentalUserShort user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _RentalResponseItem():
return $default(_that.id,_that.product,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  RentalProductShort product,  RentalUserShort user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _RentalResponseItem() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalResponseItem implements RentalResponseItem {
  const _RentalResponseItem({required this.id, required this.product, required this.user, required this.state, @JsonKey(name: "start_date")@Iso8601Converter() required this.startDate, @JsonKey(name: "end_date")@Iso8601Converter() required this.endDate, required this.quantity});
  factory _RentalResponseItem.fromJson(Map<String, dynamic> json) => _$RentalResponseItemFromJson(json);

@override final  int id;
@override final  RentalProductShort product;
@override final  RentalUserShort user;
@override final  RentState state;
@override@JsonKey(name: "start_date")@Iso8601Converter() final  DateTime startDate;
@override@JsonKey(name: "end_date")@Iso8601Converter() final  DateTime endDate;
@override final  int quantity;

/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalResponseItemCopyWith<_RentalResponseItem> get copyWith => __$RentalResponseItemCopyWithImpl<_RentalResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,state,startDate,endDate,quantity);

@override
String toString() {
  return 'RentalResponseItem(id: $id, product: $product, user: $user, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$RentalResponseItemCopyWith<$Res> implements $RentalResponseItemCopyWith<$Res> {
  factory _$RentalResponseItemCopyWith(_RentalResponseItem value, $Res Function(_RentalResponseItem) _then) = __$RentalResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id, RentalProductShort product, RentalUserShort user, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


@override $RentalProductShortCopyWith<$Res> get product;@override $RentalUserShortCopyWith<$Res> get user;

}
/// @nodoc
class __$RentalResponseItemCopyWithImpl<$Res>
    implements _$RentalResponseItemCopyWith<$Res> {
  __$RentalResponseItemCopyWithImpl(this._self, this._then);

  final _RentalResponseItem _self;
  final $Res Function(_RentalResponseItem) _then;

/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? user = null,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_RentalResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as RentalProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RentalUserShort,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductShortCopyWith<$Res> get product {
  
  return $RentalProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of RentalResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalUserShortCopyWith<$Res> get user {
  
  return $RentalUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RentalUserDetails {

 int get id; String get name;
/// Create a copy of RentalUserDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalUserDetailsCopyWith<RentalUserDetails> get copyWith => _$RentalUserDetailsCopyWithImpl<RentalUserDetails>(this as RentalUserDetails, _$identity);

  /// Serializes this RentalUserDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalUserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalUserDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RentalUserDetailsCopyWith<$Res>  {
  factory $RentalUserDetailsCopyWith(RentalUserDetails value, $Res Function(RentalUserDetails) _then) = _$RentalUserDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$RentalUserDetailsCopyWithImpl<$Res>
    implements $RentalUserDetailsCopyWith<$Res> {
  _$RentalUserDetailsCopyWithImpl(this._self, this._then);

  final RentalUserDetails _self;
  final $Res Function(RentalUserDetails) _then;

/// Create a copy of RentalUserDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalUserDetails].
extension RentalUserDetailsPatterns on RentalUserDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalUserDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalUserDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalUserDetails value)  $default,){
final _that = this;
switch (_that) {
case _RentalUserDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalUserDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RentalUserDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalUserDetails() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _RentalUserDetails():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _RentalUserDetails() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalUserDetails implements RentalUserDetails {
  const _RentalUserDetails({required this.id, required this.name});
  factory _RentalUserDetails.fromJson(Map<String, dynamic> json) => _$RentalUserDetailsFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of RentalUserDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalUserDetailsCopyWith<_RentalUserDetails> get copyWith => __$RentalUserDetailsCopyWithImpl<_RentalUserDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalUserDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalUserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalUserDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RentalUserDetailsCopyWith<$Res> implements $RentalUserDetailsCopyWith<$Res> {
  factory _$RentalUserDetailsCopyWith(_RentalUserDetails value, $Res Function(_RentalUserDetails) _then) = __$RentalUserDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$RentalUserDetailsCopyWithImpl<$Res>
    implements _$RentalUserDetailsCopyWith<$Res> {
  __$RentalUserDetailsCopyWithImpl(this._self, this._then);

  final _RentalUserDetails _self;
  final $Res Function(_RentalUserDetails) _then;

/// Create a copy of RentalUserDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RentalUserDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RentCancellation {

 RentCancelReason get reason; String get note;
/// Create a copy of RentCancellation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentCancellationCopyWith<RentCancellation> get copyWith => _$RentCancellationCopyWithImpl<RentCancellation>(this as RentCancellation, _$identity);

  /// Serializes this RentCancellation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentCancellation&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,note);

@override
String toString() {
  return 'RentCancellation(reason: $reason, note: $note)';
}


}

/// @nodoc
abstract mixin class $RentCancellationCopyWith<$Res>  {
  factory $RentCancellationCopyWith(RentCancellation value, $Res Function(RentCancellation) _then) = _$RentCancellationCopyWithImpl;
@useResult
$Res call({
 RentCancelReason reason, String note
});




}
/// @nodoc
class _$RentCancellationCopyWithImpl<$Res>
    implements $RentCancellationCopyWith<$Res> {
  _$RentCancellationCopyWithImpl(this._self, this._then);

  final RentCancellation _self;
  final $Res Function(RentCancellation) _then;

/// Create a copy of RentCancellation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? note = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as RentCancelReason,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RentCancellation].
extension RentCancellationPatterns on RentCancellation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentCancellation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentCancellation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentCancellation value)  $default,){
final _that = this;
switch (_that) {
case _RentCancellation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentCancellation value)?  $default,){
final _that = this;
switch (_that) {
case _RentCancellation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RentCancelReason reason,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentCancellation() when $default != null:
return $default(_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RentCancelReason reason,  String note)  $default,) {final _that = this;
switch (_that) {
case _RentCancellation():
return $default(_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RentCancelReason reason,  String note)?  $default,) {final _that = this;
switch (_that) {
case _RentCancellation() when $default != null:
return $default(_that.reason,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentCancellation implements RentCancellation {
  const _RentCancellation({required this.reason, required this.note});
  factory _RentCancellation.fromJson(Map<String, dynamic> json) => _$RentCancellationFromJson(json);

@override final  RentCancelReason reason;
@override final  String note;

/// Create a copy of RentCancellation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentCancellationCopyWith<_RentCancellation> get copyWith => __$RentCancellationCopyWithImpl<_RentCancellation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentCancellationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentCancellation&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,note);

@override
String toString() {
  return 'RentCancellation(reason: $reason, note: $note)';
}


}

/// @nodoc
abstract mixin class _$RentCancellationCopyWith<$Res> implements $RentCancellationCopyWith<$Res> {
  factory _$RentCancellationCopyWith(_RentCancellation value, $Res Function(_RentCancellation) _then) = __$RentCancellationCopyWithImpl;
@override @useResult
$Res call({
 RentCancelReason reason, String note
});




}
/// @nodoc
class __$RentCancellationCopyWithImpl<$Res>
    implements _$RentCancellationCopyWith<$Res> {
  __$RentCancellationCopyWithImpl(this._self, this._then);

  final _RentCancellation _self;
  final $Res Function(_RentCancellation) _then;

/// Create a copy of RentCancellation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? note = null,}) {
  return _then(_RentCancellation(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as RentCancelReason,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RentPayment {

 int? get initial;@JsonKey(name: 'final') int? get finalAmount;@JsonKey(name: 'late_fine') int? get lateFine;@JsonKey(name: 'damage_fine') int? get damageFine;
/// Create a copy of RentPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentPaymentCopyWith<RentPayment> get copyWith => _$RentPaymentCopyWithImpl<RentPayment>(this as RentPayment, _$identity);

  /// Serializes this RentPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentPayment&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.lateFine, lateFine) || other.lateFine == lateFine)&&(identical(other.damageFine, damageFine) || other.damageFine == damageFine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,initial,finalAmount,lateFine,damageFine);

@override
String toString() {
  return 'RentPayment(initial: $initial, finalAmount: $finalAmount, lateFine: $lateFine, damageFine: $damageFine)';
}


}

/// @nodoc
abstract mixin class $RentPaymentCopyWith<$Res>  {
  factory $RentPaymentCopyWith(RentPayment value, $Res Function(RentPayment) _then) = _$RentPaymentCopyWithImpl;
@useResult
$Res call({
 int? initial,@JsonKey(name: 'final') int? finalAmount,@JsonKey(name: 'late_fine') int? lateFine,@JsonKey(name: 'damage_fine') int? damageFine
});




}
/// @nodoc
class _$RentPaymentCopyWithImpl<$Res>
    implements $RentPaymentCopyWith<$Res> {
  _$RentPaymentCopyWithImpl(this._self, this._then);

  final RentPayment _self;
  final $Res Function(RentPayment) _then;

/// Create a copy of RentPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initial = freezed,Object? finalAmount = freezed,Object? lateFine = freezed,Object? damageFine = freezed,}) {
  return _then(_self.copyWith(
initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,lateFine: freezed == lateFine ? _self.lateFine : lateFine // ignore: cast_nullable_to_non_nullable
as int?,damageFine: freezed == damageFine ? _self.damageFine : damageFine // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RentPayment].
extension RentPaymentPatterns on RentPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentPayment value)  $default,){
final _that = this;
switch (_that) {
case _RentPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentPayment value)?  $default,){
final _that = this;
switch (_that) {
case _RentPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? initial, @JsonKey(name: 'final')  int? finalAmount, @JsonKey(name: 'late_fine')  int? lateFine, @JsonKey(name: 'damage_fine')  int? damageFine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentPayment() when $default != null:
return $default(_that.initial,_that.finalAmount,_that.lateFine,_that.damageFine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? initial, @JsonKey(name: 'final')  int? finalAmount, @JsonKey(name: 'late_fine')  int? lateFine, @JsonKey(name: 'damage_fine')  int? damageFine)  $default,) {final _that = this;
switch (_that) {
case _RentPayment():
return $default(_that.initial,_that.finalAmount,_that.lateFine,_that.damageFine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? initial, @JsonKey(name: 'final')  int? finalAmount, @JsonKey(name: 'late_fine')  int? lateFine, @JsonKey(name: 'damage_fine')  int? damageFine)?  $default,) {final _that = this;
switch (_that) {
case _RentPayment() when $default != null:
return $default(_that.initial,_that.finalAmount,_that.lateFine,_that.damageFine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentPayment implements RentPayment {
  const _RentPayment({this.initial, @JsonKey(name: 'final') this.finalAmount, @JsonKey(name: 'late_fine') this.lateFine, @JsonKey(name: 'damage_fine') this.damageFine});
  factory _RentPayment.fromJson(Map<String, dynamic> json) => _$RentPaymentFromJson(json);

@override final  int? initial;
@override@JsonKey(name: 'final') final  int? finalAmount;
@override@JsonKey(name: 'late_fine') final  int? lateFine;
@override@JsonKey(name: 'damage_fine') final  int? damageFine;

/// Create a copy of RentPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentPaymentCopyWith<_RentPayment> get copyWith => __$RentPaymentCopyWithImpl<_RentPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentPayment&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.lateFine, lateFine) || other.lateFine == lateFine)&&(identical(other.damageFine, damageFine) || other.damageFine == damageFine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,initial,finalAmount,lateFine,damageFine);

@override
String toString() {
  return 'RentPayment(initial: $initial, finalAmount: $finalAmount, lateFine: $lateFine, damageFine: $damageFine)';
}


}

/// @nodoc
abstract mixin class _$RentPaymentCopyWith<$Res> implements $RentPaymentCopyWith<$Res> {
  factory _$RentPaymentCopyWith(_RentPayment value, $Res Function(_RentPayment) _then) = __$RentPaymentCopyWithImpl;
@override @useResult
$Res call({
 int? initial,@JsonKey(name: 'final') int? finalAmount,@JsonKey(name: 'late_fine') int? lateFine,@JsonKey(name: 'damage_fine') int? damageFine
});




}
/// @nodoc
class __$RentPaymentCopyWithImpl<$Res>
    implements _$RentPaymentCopyWith<$Res> {
  __$RentPaymentCopyWithImpl(this._self, this._then);

  final _RentPayment _self;
  final $Res Function(_RentPayment) _then;

/// Create a copy of RentPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initial = freezed,Object? finalAmount = freezed,Object? lateFine = freezed,Object? damageFine = freezed,}) {
  return _then(_RentPayment(
initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,lateFine: freezed == lateFine ? _self.lateFine : lateFine // ignore: cast_nullable_to_non_nullable
as int?,damageFine: freezed == damageFine ? _self.damageFine : damageFine // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RentalReviewDetails {

 int get id; int get rating; String get content;
/// Create a copy of RentalReviewDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalReviewDetailsCopyWith<RentalReviewDetails> get copyWith => _$RentalReviewDetailsCopyWithImpl<RentalReviewDetails>(this as RentalReviewDetails, _$identity);

  /// Serializes this RentalReviewDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalReviewDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,content);

@override
String toString() {
  return 'RentalReviewDetails(id: $id, rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class $RentalReviewDetailsCopyWith<$Res>  {
  factory $RentalReviewDetailsCopyWith(RentalReviewDetails value, $Res Function(RentalReviewDetails) _then) = _$RentalReviewDetailsCopyWithImpl;
@useResult
$Res call({
 int id, int rating, String content
});




}
/// @nodoc
class _$RentalReviewDetailsCopyWithImpl<$Res>
    implements $RentalReviewDetailsCopyWith<$Res> {
  _$RentalReviewDetailsCopyWithImpl(this._self, this._then);

  final RentalReviewDetails _self;
  final $Res Function(RentalReviewDetails) _then;

/// Create a copy of RentalReviewDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rating = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalReviewDetails].
extension RentalReviewDetailsPatterns on RentalReviewDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalReviewDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalReviewDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalReviewDetails value)  $default,){
final _that = this;
switch (_that) {
case _RentalReviewDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalReviewDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RentalReviewDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int rating,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalReviewDetails() when $default != null:
return $default(_that.id,_that.rating,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int rating,  String content)  $default,) {final _that = this;
switch (_that) {
case _RentalReviewDetails():
return $default(_that.id,_that.rating,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int rating,  String content)?  $default,) {final _that = this;
switch (_that) {
case _RentalReviewDetails() when $default != null:
return $default(_that.id,_that.rating,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalReviewDetails implements RentalReviewDetails {
   _RentalReviewDetails({required this.id, required this.rating, required this.content});
  factory _RentalReviewDetails.fromJson(Map<String, dynamic> json) => _$RentalReviewDetailsFromJson(json);

@override final  int id;
@override final  int rating;
@override final  String content;

/// Create a copy of RentalReviewDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalReviewDetailsCopyWith<_RentalReviewDetails> get copyWith => __$RentalReviewDetailsCopyWithImpl<_RentalReviewDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalReviewDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalReviewDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,content);

@override
String toString() {
  return 'RentalReviewDetails(id: $id, rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class _$RentalReviewDetailsCopyWith<$Res> implements $RentalReviewDetailsCopyWith<$Res> {
  factory _$RentalReviewDetailsCopyWith(_RentalReviewDetails value, $Res Function(_RentalReviewDetails) _then) = __$RentalReviewDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, int rating, String content
});




}
/// @nodoc
class __$RentalReviewDetailsCopyWithImpl<$Res>
    implements _$RentalReviewDetailsCopyWith<$Res> {
  __$RentalReviewDetailsCopyWithImpl(this._self, this._then);

  final _RentalReviewDetails _self;
  final $Res Function(_RentalReviewDetails) _then;

/// Create a copy of RentalReviewDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rating = null,Object? content = null,}) {
  return _then(_RentalReviewDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RentalResponseItemDetails {

 int get id; RentalProductDetail get product; RentalUserDetails get user; RentalReviewDetails? get review; RentState get state;@JsonKey(name: "start_date")@Iso8601Converter() DateTime get startDate;@JsonKey(name: "end_date")@Iso8601Converter() DateTime get endDate; int get quantity; RentCancellation? get cancellation; RentPayment get payment;@JsonKey(name: "returned_at")@Iso8601Converter() DateTime? get returnedAt;
/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalResponseItemDetailsCopyWith<RentalResponseItemDetails> get copyWith => _$RentalResponseItemDetailsCopyWithImpl<RentalResponseItemDetails>(this as RentalResponseItemDetails, _$identity);

  /// Serializes this RentalResponseItemDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalResponseItemDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.cancellation, cancellation) || other.cancellation == cancellation)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.returnedAt, returnedAt) || other.returnedAt == returnedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity,cancellation,payment,returnedAt);

@override
String toString() {
  return 'RentalResponseItemDetails(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity, cancellation: $cancellation, payment: $payment, returnedAt: $returnedAt)';
}


}

/// @nodoc
abstract mixin class $RentalResponseItemDetailsCopyWith<$Res>  {
  factory $RentalResponseItemDetailsCopyWith(RentalResponseItemDetails value, $Res Function(RentalResponseItemDetails) _then) = _$RentalResponseItemDetailsCopyWithImpl;
@useResult
$Res call({
 int id, RentalProductDetail product, RentalUserDetails user, RentalReviewDetails? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity, RentCancellation? cancellation, RentPayment payment,@JsonKey(name: "returned_at")@Iso8601Converter() DateTime? returnedAt
});


$RentalProductDetailCopyWith<$Res> get product;$RentalUserDetailsCopyWith<$Res> get user;$RentalReviewDetailsCopyWith<$Res>? get review;$RentCancellationCopyWith<$Res>? get cancellation;$RentPaymentCopyWith<$Res> get payment;

}
/// @nodoc
class _$RentalResponseItemDetailsCopyWithImpl<$Res>
    implements $RentalResponseItemDetailsCopyWith<$Res> {
  _$RentalResponseItemDetailsCopyWithImpl(this._self, this._then);

  final RentalResponseItemDetails _self;
  final $Res Function(RentalResponseItemDetails) _then;

/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,Object? cancellation = freezed,Object? payment = null,Object? returnedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as RentalProductDetail,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RentalUserDetails,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as RentalReviewDetails?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,cancellation: freezed == cancellation ? _self.cancellation : cancellation // ignore: cast_nullable_to_non_nullable
as RentCancellation?,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as RentPayment,returnedAt: freezed == returnedAt ? _self.returnedAt : returnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductDetailCopyWith<$Res> get product {
  
  return $RentalProductDetailCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalUserDetailsCopyWith<$Res> get user {
  
  return $RentalUserDetailsCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalReviewDetailsCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $RentalReviewDetailsCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentCancellationCopyWith<$Res>? get cancellation {
    if (_self.cancellation == null) {
    return null;
  }

  return $RentCancellationCopyWith<$Res>(_self.cancellation!, (value) {
    return _then(_self.copyWith(cancellation: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentPaymentCopyWith<$Res> get payment {
  
  return $RentPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalResponseItemDetails].
extension RentalResponseItemDetailsPatterns on RentalResponseItemDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalResponseItemDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalResponseItemDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalResponseItemDetails value)  $default,){
final _that = this;
switch (_that) {
case _RentalResponseItemDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalResponseItemDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RentalResponseItemDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  RentalProductDetail product,  RentalUserDetails user,  RentalReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity,  RentCancellation? cancellation,  RentPayment payment, @JsonKey(name: "returned_at")@Iso8601Converter()  DateTime? returnedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalResponseItemDetails() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity,_that.cancellation,_that.payment,_that.returnedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  RentalProductDetail product,  RentalUserDetails user,  RentalReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity,  RentCancellation? cancellation,  RentPayment payment, @JsonKey(name: "returned_at")@Iso8601Converter()  DateTime? returnedAt)  $default,) {final _that = this;
switch (_that) {
case _RentalResponseItemDetails():
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity,_that.cancellation,_that.payment,_that.returnedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  RentalProductDetail product,  RentalUserDetails user,  RentalReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity,  RentCancellation? cancellation,  RentPayment payment, @JsonKey(name: "returned_at")@Iso8601Converter()  DateTime? returnedAt)?  $default,) {final _that = this;
switch (_that) {
case _RentalResponseItemDetails() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity,_that.cancellation,_that.payment,_that.returnedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalResponseItemDetails implements RentalResponseItemDetails {
  const _RentalResponseItemDetails({required this.id, required this.product, required this.user, required this.review, required this.state, @JsonKey(name: "start_date")@Iso8601Converter() required this.startDate, @JsonKey(name: "end_date")@Iso8601Converter() required this.endDate, required this.quantity, required this.cancellation, required this.payment, @JsonKey(name: "returned_at")@Iso8601Converter() required this.returnedAt});
  factory _RentalResponseItemDetails.fromJson(Map<String, dynamic> json) => _$RentalResponseItemDetailsFromJson(json);

@override final  int id;
@override final  RentalProductDetail product;
@override final  RentalUserDetails user;
@override final  RentalReviewDetails? review;
@override final  RentState state;
@override@JsonKey(name: "start_date")@Iso8601Converter() final  DateTime startDate;
@override@JsonKey(name: "end_date")@Iso8601Converter() final  DateTime endDate;
@override final  int quantity;
@override final  RentCancellation? cancellation;
@override final  RentPayment payment;
@override@JsonKey(name: "returned_at")@Iso8601Converter() final  DateTime? returnedAt;

/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalResponseItemDetailsCopyWith<_RentalResponseItemDetails> get copyWith => __$RentalResponseItemDetailsCopyWithImpl<_RentalResponseItemDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalResponseItemDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalResponseItemDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.cancellation, cancellation) || other.cancellation == cancellation)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.returnedAt, returnedAt) || other.returnedAt == returnedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity,cancellation,payment,returnedAt);

@override
String toString() {
  return 'RentalResponseItemDetails(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity, cancellation: $cancellation, payment: $payment, returnedAt: $returnedAt)';
}


}

/// @nodoc
abstract mixin class _$RentalResponseItemDetailsCopyWith<$Res> implements $RentalResponseItemDetailsCopyWith<$Res> {
  factory _$RentalResponseItemDetailsCopyWith(_RentalResponseItemDetails value, $Res Function(_RentalResponseItemDetails) _then) = __$RentalResponseItemDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, RentalProductDetail product, RentalUserDetails user, RentalReviewDetails? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity, RentCancellation? cancellation, RentPayment payment,@JsonKey(name: "returned_at")@Iso8601Converter() DateTime? returnedAt
});


@override $RentalProductDetailCopyWith<$Res> get product;@override $RentalUserDetailsCopyWith<$Res> get user;@override $RentalReviewDetailsCopyWith<$Res>? get review;@override $RentCancellationCopyWith<$Res>? get cancellation;@override $RentPaymentCopyWith<$Res> get payment;

}
/// @nodoc
class __$RentalResponseItemDetailsCopyWithImpl<$Res>
    implements _$RentalResponseItemDetailsCopyWith<$Res> {
  __$RentalResponseItemDetailsCopyWithImpl(this._self, this._then);

  final _RentalResponseItemDetails _self;
  final $Res Function(_RentalResponseItemDetails) _then;

/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,Object? cancellation = freezed,Object? payment = null,Object? returnedAt = freezed,}) {
  return _then(_RentalResponseItemDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as RentalProductDetail,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RentalUserDetails,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as RentalReviewDetails?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,cancellation: freezed == cancellation ? _self.cancellation : cancellation // ignore: cast_nullable_to_non_nullable
as RentCancellation?,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as RentPayment,returnedAt: freezed == returnedAt ? _self.returnedAt : returnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalProductDetailCopyWith<$Res> get product {
  
  return $RentalProductDetailCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalUserDetailsCopyWith<$Res> get user {
  
  return $RentalUserDetailsCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentalReviewDetailsCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $RentalReviewDetailsCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentCancellationCopyWith<$Res>? get cancellation {
    if (_self.cancellation == null) {
    return null;
  }

  return $RentCancellationCopyWith<$Res>(_self.cancellation!, (value) {
    return _then(_self.copyWith(cancellation: value));
  });
}/// Create a copy of RentalResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentPaymentCopyWith<$Res> get payment {
  
  return $RentPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// @nodoc
mixin _$RentalRejectRequest {

 String get note;
/// Create a copy of RentalRejectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalRejectRequestCopyWith<RentalRejectRequest> get copyWith => _$RentalRejectRequestCopyWithImpl<RentalRejectRequest>(this as RentalRejectRequest, _$identity);

  /// Serializes this RentalRejectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalRejectRequest&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'RentalRejectRequest(note: $note)';
}


}

/// @nodoc
abstract mixin class $RentalRejectRequestCopyWith<$Res>  {
  factory $RentalRejectRequestCopyWith(RentalRejectRequest value, $Res Function(RentalRejectRequest) _then) = _$RentalRejectRequestCopyWithImpl;
@useResult
$Res call({
 String note
});




}
/// @nodoc
class _$RentalRejectRequestCopyWithImpl<$Res>
    implements $RentalRejectRequestCopyWith<$Res> {
  _$RentalRejectRequestCopyWithImpl(this._self, this._then);

  final RentalRejectRequest _self;
  final $Res Function(RentalRejectRequest) _then;

/// Create a copy of RentalRejectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? note = null,}) {
  return _then(_self.copyWith(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalRejectRequest].
extension RentalRejectRequestPatterns on RentalRejectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalRejectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalRejectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalRejectRequest value)  $default,){
final _that = this;
switch (_that) {
case _RentalRejectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalRejectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RentalRejectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalRejectRequest() when $default != null:
return $default(_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String note)  $default,) {final _that = this;
switch (_that) {
case _RentalRejectRequest():
return $default(_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String note)?  $default,) {final _that = this;
switch (_that) {
case _RentalRejectRequest() when $default != null:
return $default(_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalRejectRequest implements RentalRejectRequest {
  const _RentalRejectRequest({required this.note});
  factory _RentalRejectRequest.fromJson(Map<String, dynamic> json) => _$RentalRejectRequestFromJson(json);

@override final  String note;

/// Create a copy of RentalRejectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalRejectRequestCopyWith<_RentalRejectRequest> get copyWith => __$RentalRejectRequestCopyWithImpl<_RentalRejectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalRejectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalRejectRequest&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'RentalRejectRequest(note: $note)';
}


}

/// @nodoc
abstract mixin class _$RentalRejectRequestCopyWith<$Res> implements $RentalRejectRequestCopyWith<$Res> {
  factory _$RentalRejectRequestCopyWith(_RentalRejectRequest value, $Res Function(_RentalRejectRequest) _then) = __$RentalRejectRequestCopyWithImpl;
@override @useResult
$Res call({
 String note
});




}
/// @nodoc
class __$RentalRejectRequestCopyWithImpl<$Res>
    implements _$RentalRejectRequestCopyWith<$Res> {
  __$RentalRejectRequestCopyWithImpl(this._self, this._then);

  final _RentalRejectRequest _self;
  final $Res Function(_RentalRejectRequest) _then;

/// Create a copy of RentalRejectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_RentalRejectRequest(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RentalHandoverRequest {

 int get payment;
/// Create a copy of RentalHandoverRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalHandoverRequestCopyWith<RentalHandoverRequest> get copyWith => _$RentalHandoverRequestCopyWithImpl<RentalHandoverRequest>(this as RentalHandoverRequest, _$identity);

  /// Serializes this RentalHandoverRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalHandoverRequest&&(identical(other.payment, payment) || other.payment == payment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment);

@override
String toString() {
  return 'RentalHandoverRequest(payment: $payment)';
}


}

/// @nodoc
abstract mixin class $RentalHandoverRequestCopyWith<$Res>  {
  factory $RentalHandoverRequestCopyWith(RentalHandoverRequest value, $Res Function(RentalHandoverRequest) _then) = _$RentalHandoverRequestCopyWithImpl;
@useResult
$Res call({
 int payment
});




}
/// @nodoc
class _$RentalHandoverRequestCopyWithImpl<$Res>
    implements $RentalHandoverRequestCopyWith<$Res> {
  _$RentalHandoverRequestCopyWithImpl(this._self, this._then);

  final RentalHandoverRequest _self;
  final $Res Function(RentalHandoverRequest) _then;

/// Create a copy of RentalHandoverRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payment = null,}) {
  return _then(_self.copyWith(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalHandoverRequest].
extension RentalHandoverRequestPatterns on RentalHandoverRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalHandoverRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalHandoverRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalHandoverRequest value)  $default,){
final _that = this;
switch (_that) {
case _RentalHandoverRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalHandoverRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RentalHandoverRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int payment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalHandoverRequest() when $default != null:
return $default(_that.payment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int payment)  $default,) {final _that = this;
switch (_that) {
case _RentalHandoverRequest():
return $default(_that.payment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int payment)?  $default,) {final _that = this;
switch (_that) {
case _RentalHandoverRequest() when $default != null:
return $default(_that.payment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalHandoverRequest implements RentalHandoverRequest {
  const _RentalHandoverRequest({required this.payment});
  factory _RentalHandoverRequest.fromJson(Map<String, dynamic> json) => _$RentalHandoverRequestFromJson(json);

@override final  int payment;

/// Create a copy of RentalHandoverRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalHandoverRequestCopyWith<_RentalHandoverRequest> get copyWith => __$RentalHandoverRequestCopyWithImpl<_RentalHandoverRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalHandoverRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalHandoverRequest&&(identical(other.payment, payment) || other.payment == payment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment);

@override
String toString() {
  return 'RentalHandoverRequest(payment: $payment)';
}


}

/// @nodoc
abstract mixin class _$RentalHandoverRequestCopyWith<$Res> implements $RentalHandoverRequestCopyWith<$Res> {
  factory _$RentalHandoverRequestCopyWith(_RentalHandoverRequest value, $Res Function(_RentalHandoverRequest) _then) = __$RentalHandoverRequestCopyWithImpl;
@override @useResult
$Res call({
 int payment
});




}
/// @nodoc
class __$RentalHandoverRequestCopyWithImpl<$Res>
    implements _$RentalHandoverRequestCopyWith<$Res> {
  __$RentalHandoverRequestCopyWithImpl(this._self, this._then);

  final _RentalHandoverRequest _self;
  final $Res Function(_RentalHandoverRequest) _then;

/// Create a copy of RentalHandoverRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payment = null,}) {
  return _then(_RentalHandoverRequest(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RentalConfirmRequest {

@JsonKey(name: "final_payment") int get finalPayment;@JsonKey(name: "late_fine_payment") int get lateFinePayment;@JsonKey(name: "damage_fine_payment") int get damageFinePayment;
/// Create a copy of RentalConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalConfirmRequestCopyWith<RentalConfirmRequest> get copyWith => _$RentalConfirmRequestCopyWithImpl<RentalConfirmRequest>(this as RentalConfirmRequest, _$identity);

  /// Serializes this RentalConfirmRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalConfirmRequest&&(identical(other.finalPayment, finalPayment) || other.finalPayment == finalPayment)&&(identical(other.lateFinePayment, lateFinePayment) || other.lateFinePayment == lateFinePayment)&&(identical(other.damageFinePayment, damageFinePayment) || other.damageFinePayment == damageFinePayment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finalPayment,lateFinePayment,damageFinePayment);

@override
String toString() {
  return 'RentalConfirmRequest(finalPayment: $finalPayment, lateFinePayment: $lateFinePayment, damageFinePayment: $damageFinePayment)';
}


}

/// @nodoc
abstract mixin class $RentalConfirmRequestCopyWith<$Res>  {
  factory $RentalConfirmRequestCopyWith(RentalConfirmRequest value, $Res Function(RentalConfirmRequest) _then) = _$RentalConfirmRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "final_payment") int finalPayment,@JsonKey(name: "late_fine_payment") int lateFinePayment,@JsonKey(name: "damage_fine_payment") int damageFinePayment
});




}
/// @nodoc
class _$RentalConfirmRequestCopyWithImpl<$Res>
    implements $RentalConfirmRequestCopyWith<$Res> {
  _$RentalConfirmRequestCopyWithImpl(this._self, this._then);

  final RentalConfirmRequest _self;
  final $Res Function(RentalConfirmRequest) _then;

/// Create a copy of RentalConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? finalPayment = null,Object? lateFinePayment = null,Object? damageFinePayment = null,}) {
  return _then(_self.copyWith(
finalPayment: null == finalPayment ? _self.finalPayment : finalPayment // ignore: cast_nullable_to_non_nullable
as int,lateFinePayment: null == lateFinePayment ? _self.lateFinePayment : lateFinePayment // ignore: cast_nullable_to_non_nullable
as int,damageFinePayment: null == damageFinePayment ? _self.damageFinePayment : damageFinePayment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalConfirmRequest].
extension RentalConfirmRequestPatterns on RentalConfirmRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalConfirmRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalConfirmRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalConfirmRequest value)  $default,){
final _that = this;
switch (_that) {
case _RentalConfirmRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalConfirmRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RentalConfirmRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "final_payment")  int finalPayment, @JsonKey(name: "late_fine_payment")  int lateFinePayment, @JsonKey(name: "damage_fine_payment")  int damageFinePayment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalConfirmRequest() when $default != null:
return $default(_that.finalPayment,_that.lateFinePayment,_that.damageFinePayment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "final_payment")  int finalPayment, @JsonKey(name: "late_fine_payment")  int lateFinePayment, @JsonKey(name: "damage_fine_payment")  int damageFinePayment)  $default,) {final _that = this;
switch (_that) {
case _RentalConfirmRequest():
return $default(_that.finalPayment,_that.lateFinePayment,_that.damageFinePayment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "final_payment")  int finalPayment, @JsonKey(name: "late_fine_payment")  int lateFinePayment, @JsonKey(name: "damage_fine_payment")  int damageFinePayment)?  $default,) {final _that = this;
switch (_that) {
case _RentalConfirmRequest() when $default != null:
return $default(_that.finalPayment,_that.lateFinePayment,_that.damageFinePayment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalConfirmRequest implements RentalConfirmRequest {
  const _RentalConfirmRequest({@JsonKey(name: "final_payment") required this.finalPayment, @JsonKey(name: "late_fine_payment") required this.lateFinePayment, @JsonKey(name: "damage_fine_payment") required this.damageFinePayment});
  factory _RentalConfirmRequest.fromJson(Map<String, dynamic> json) => _$RentalConfirmRequestFromJson(json);

@override@JsonKey(name: "final_payment") final  int finalPayment;
@override@JsonKey(name: "late_fine_payment") final  int lateFinePayment;
@override@JsonKey(name: "damage_fine_payment") final  int damageFinePayment;

/// Create a copy of RentalConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalConfirmRequestCopyWith<_RentalConfirmRequest> get copyWith => __$RentalConfirmRequestCopyWithImpl<_RentalConfirmRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalConfirmRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalConfirmRequest&&(identical(other.finalPayment, finalPayment) || other.finalPayment == finalPayment)&&(identical(other.lateFinePayment, lateFinePayment) || other.lateFinePayment == lateFinePayment)&&(identical(other.damageFinePayment, damageFinePayment) || other.damageFinePayment == damageFinePayment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finalPayment,lateFinePayment,damageFinePayment);

@override
String toString() {
  return 'RentalConfirmRequest(finalPayment: $finalPayment, lateFinePayment: $lateFinePayment, damageFinePayment: $damageFinePayment)';
}


}

/// @nodoc
abstract mixin class _$RentalConfirmRequestCopyWith<$Res> implements $RentalConfirmRequestCopyWith<$Res> {
  factory _$RentalConfirmRequestCopyWith(_RentalConfirmRequest value, $Res Function(_RentalConfirmRequest) _then) = __$RentalConfirmRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "final_payment") int finalPayment,@JsonKey(name: "late_fine_payment") int lateFinePayment,@JsonKey(name: "damage_fine_payment") int damageFinePayment
});




}
/// @nodoc
class __$RentalConfirmRequestCopyWithImpl<$Res>
    implements _$RentalConfirmRequestCopyWith<$Res> {
  __$RentalConfirmRequestCopyWithImpl(this._self, this._then);

  final _RentalConfirmRequest _self;
  final $Res Function(_RentalConfirmRequest) _then;

/// Create a copy of RentalConfirmRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? finalPayment = null,Object? lateFinePayment = null,Object? damageFinePayment = null,}) {
  return _then(_RentalConfirmRequest(
finalPayment: null == finalPayment ? _self.finalPayment : finalPayment // ignore: cast_nullable_to_non_nullable
as int,lateFinePayment: null == lateFinePayment ? _self.lateFinePayment : lateFinePayment // ignore: cast_nullable_to_non_nullable
as int,damageFinePayment: null == damageFinePayment ? _self.damageFinePayment : damageFinePayment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
