// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponseItemDetail {

 int get id; ProductUserData get user;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt; String get name;@JsonKey(name: "price_per_day") int get pricePerDay;@JsonKey(name: "late_fee_per_day") int get lateFeePerDay; int get stock; String get description; ProductAddress get address; List<ProductResponseItemShort> get recommendations;@JsonKey(name: "top_reviews") List<ProductReviewDetail> get topReviews;
/// Create a copy of ProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseItemDetailCopyWith<ProductResponseItemDetail> get copyWith => _$ProductResponseItemDetailCopyWithImpl<ProductResponseItemDetail>(this as ProductResponseItemDetail, _$identity);

  /// Serializes this ProductResponseItemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&const DeepCollectionEquality().equals(other.topReviews, topReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address,const DeepCollectionEquality().hash(recommendations),const DeepCollectionEquality().hash(topReviews));

@override
String toString() {
  return 'ProductResponseItemDetail(id: $id, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address, recommendations: $recommendations, topReviews: $topReviews)';
}


}

/// @nodoc
abstract mixin class $ProductResponseItemDetailCopyWith<$Res>  {
  factory $ProductResponseItemDetailCopyWith(ProductResponseItemDetail value, $Res Function(ProductResponseItemDetail) _then) = _$ProductResponseItemDetailCopyWithImpl;
@useResult
$Res call({
 int id, ProductUserData user,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, ProductAddress address, List<ProductResponseItemShort> recommendations,@JsonKey(name: "top_reviews") List<ProductReviewDetail> topReviews
});




}
/// @nodoc
class _$ProductResponseItemDetailCopyWithImpl<$Res>
    implements $ProductResponseItemDetailCopyWith<$Res> {
  _$ProductResponseItemDetailCopyWithImpl(this._self, this._then);

  final ProductResponseItemDetail _self;
  final $Res Function(ProductResponseItemDetail) _then;

/// Create a copy of ProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,Object? recommendations = null,Object? topReviews = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUserData,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as ProductAddress,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<ProductResponseItemShort>,topReviews: null == topReviews ? _self.topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ProductReviewDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductResponseItemDetail].
extension ProductResponseItemDetailPatterns on ProductResponseItemDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductResponseItemDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductResponseItemDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductResponseItemDetail value)  $default,){
final _that = this;
switch (_that) {
case _ProductResponseItemDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductResponseItemDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ProductResponseItemDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ProductUserData user, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  ProductAddress address,  List<ProductResponseItemShort> recommendations, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseItemDetail() when $default != null:
return $default(_that.id,_that.user,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.recommendations,_that.topReviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ProductUserData user, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  ProductAddress address,  List<ProductResponseItemShort> recommendations, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseItemDetail():
return $default(_that.id,_that.user,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.recommendations,_that.topReviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ProductUserData user, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  ProductAddress address,  List<ProductResponseItemShort> recommendations, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseItemDetail() when $default != null:
return $default(_that.id,_that.user,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.recommendations,_that.topReviews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductResponseItemDetail implements ProductResponseItemDetail {
  const _ProductResponseItemDetail({required this.id, required this.user, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, required this.name, @JsonKey(name: "price_per_day") required this.pricePerDay, @JsonKey(name: "late_fee_per_day") required this.lateFeePerDay, required this.stock, required this.description, required this.address, required final  List<ProductResponseItemShort> recommendations, @JsonKey(name: "top_reviews") required final  List<ProductReviewDetail> topReviews}): _recommendations = recommendations,_topReviews = topReviews;
  factory _ProductResponseItemDetail.fromJson(Map<String, dynamic> json) => _$ProductResponseItemDetailFromJson(json);

@override final  int id;
@override final  ProductUserData user;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override final  String name;
@override@JsonKey(name: "price_per_day") final  int pricePerDay;
@override@JsonKey(name: "late_fee_per_day") final  int lateFeePerDay;
@override final  int stock;
@override final  String description;
@override final  ProductAddress address;
 final  List<ProductResponseItemShort> _recommendations;
@override List<ProductResponseItemShort> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}

 final  List<ProductReviewDetail> _topReviews;
@override@JsonKey(name: "top_reviews") List<ProductReviewDetail> get topReviews {
  if (_topReviews is EqualUnmodifiableListView) return _topReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topReviews);
}


/// Create a copy of ProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductResponseItemDetailCopyWith<_ProductResponseItemDetail> get copyWith => __$ProductResponseItemDetailCopyWithImpl<_ProductResponseItemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductResponseItemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&const DeepCollectionEquality().equals(other._topReviews, _topReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address,const DeepCollectionEquality().hash(_recommendations),const DeepCollectionEquality().hash(_topReviews));

@override
String toString() {
  return 'ProductResponseItemDetail(id: $id, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address, recommendations: $recommendations, topReviews: $topReviews)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseItemDetailCopyWith<$Res> implements $ProductResponseItemDetailCopyWith<$Res> {
  factory _$ProductResponseItemDetailCopyWith(_ProductResponseItemDetail value, $Res Function(_ProductResponseItemDetail) _then) = __$ProductResponseItemDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, ProductUserData user,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, ProductAddress address, List<ProductResponseItemShort> recommendations,@JsonKey(name: "top_reviews") List<ProductReviewDetail> topReviews
});




}
/// @nodoc
class __$ProductResponseItemDetailCopyWithImpl<$Res>
    implements _$ProductResponseItemDetailCopyWith<$Res> {
  __$ProductResponseItemDetailCopyWithImpl(this._self, this._then);

  final _ProductResponseItemDetail _self;
  final $Res Function(_ProductResponseItemDetail) _then;

/// Create a copy of ProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,Object? recommendations = null,Object? topReviews = null,}) {
  return _then(_ProductResponseItemDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUserData,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as ProductAddress,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<ProductResponseItemShort>,topReviews: null == topReviews ? _self._topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ProductReviewDetail>,
  ));
}


}


/// @nodoc
mixin _$MyProductResponseItemShort {

 int get id;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt; String get name;@JsonKey(name: "price_per_day") int get pricePerDay; int get stock; MyProductAddressShort get address;@JsonKey(name: "rent_count") MyProductRentCount get rentCount;
/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductResponseItemShortCopyWith<MyProductResponseItemShort> get copyWith => _$MyProductResponseItemShortCopyWithImpl<MyProductResponseItemShort>(this as MyProductResponseItemShort, _$identity);

  /// Serializes this MyProductResponseItemShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductResponseItemShort&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.address, address) || other.address == address)&&(identical(other.rentCount, rentCount) || other.rentCount == rentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,stock,address,rentCount);

@override
String toString() {
  return 'MyProductResponseItemShort(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, stock: $stock, address: $address, rentCount: $rentCount)';
}


}

/// @nodoc
abstract mixin class $MyProductResponseItemShortCopyWith<$Res>  {
  factory $MyProductResponseItemShortCopyWith(MyProductResponseItemShort value, $Res Function(MyProductResponseItemShort) _then) = _$MyProductResponseItemShortCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay, int stock, MyProductAddressShort address,@JsonKey(name: "rent_count") MyProductRentCount rentCount
});


$MyProductAddressShortCopyWith<$Res> get address;$MyProductRentCountCopyWith<$Res> get rentCount;

}
/// @nodoc
class _$MyProductResponseItemShortCopyWithImpl<$Res>
    implements $MyProductResponseItemShortCopyWith<$Res> {
  _$MyProductResponseItemShortCopyWithImpl(this._self, this._then);

  final MyProductResponseItemShort _self;
  final $Res Function(MyProductResponseItemShort) _then;

/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? stock = null,Object? address = null,Object? rentCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddressShort,rentCount: null == rentCount ? _self.rentCount : rentCount // ignore: cast_nullable_to_non_nullable
as MyProductRentCount,
  ));
}
/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressShortCopyWith<$Res> get address {
  
  return $MyProductAddressShortCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductRentCountCopyWith<$Res> get rentCount {
  
  return $MyProductRentCountCopyWith<$Res>(_self.rentCount, (value) {
    return _then(_self.copyWith(rentCount: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyProductResponseItemShort].
extension MyProductResponseItemShortPatterns on MyProductResponseItemShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductResponseItemShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductResponseItemShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductResponseItemShort value)  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItemShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductResponseItemShort value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItemShort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay,  int stock,  MyProductAddressShort address, @JsonKey(name: "rent_count")  MyProductRentCount rentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductResponseItemShort() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.stock,_that.address,_that.rentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay,  int stock,  MyProductAddressShort address, @JsonKey(name: "rent_count")  MyProductRentCount rentCount)  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItemShort():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.stock,_that.address,_that.rentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay,  int stock,  MyProductAddressShort address, @JsonKey(name: "rent_count")  MyProductRentCount rentCount)?  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItemShort() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.stock,_that.address,_that.rentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductResponseItemShort implements MyProductResponseItemShort {
  const _MyProductResponseItemShort({required this.id, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, required this.name, @JsonKey(name: "price_per_day") required this.pricePerDay, required this.stock, required this.address, @JsonKey(name: "rent_count") required this.rentCount});
  factory _MyProductResponseItemShort.fromJson(Map<String, dynamic> json) => _$MyProductResponseItemShortFromJson(json);

@override final  int id;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override final  String name;
@override@JsonKey(name: "price_per_day") final  int pricePerDay;
@override final  int stock;
@override final  MyProductAddressShort address;
@override@JsonKey(name: "rent_count") final  MyProductRentCount rentCount;

/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductResponseItemShortCopyWith<_MyProductResponseItemShort> get copyWith => __$MyProductResponseItemShortCopyWithImpl<_MyProductResponseItemShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductResponseItemShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductResponseItemShort&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.address, address) || other.address == address)&&(identical(other.rentCount, rentCount) || other.rentCount == rentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,stock,address,rentCount);

@override
String toString() {
  return 'MyProductResponseItemShort(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, stock: $stock, address: $address, rentCount: $rentCount)';
}


}

/// @nodoc
abstract mixin class _$MyProductResponseItemShortCopyWith<$Res> implements $MyProductResponseItemShortCopyWith<$Res> {
  factory _$MyProductResponseItemShortCopyWith(_MyProductResponseItemShort value, $Res Function(_MyProductResponseItemShort) _then) = __$MyProductResponseItemShortCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay, int stock, MyProductAddressShort address,@JsonKey(name: "rent_count") MyProductRentCount rentCount
});


@override $MyProductAddressShortCopyWith<$Res> get address;@override $MyProductRentCountCopyWith<$Res> get rentCount;

}
/// @nodoc
class __$MyProductResponseItemShortCopyWithImpl<$Res>
    implements _$MyProductResponseItemShortCopyWith<$Res> {
  __$MyProductResponseItemShortCopyWithImpl(this._self, this._then);

  final _MyProductResponseItemShort _self;
  final $Res Function(_MyProductResponseItemShort) _then;

/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? stock = null,Object? address = null,Object? rentCount = null,}) {
  return _then(_MyProductResponseItemShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddressShort,rentCount: null == rentCount ? _self.rentCount : rentCount // ignore: cast_nullable_to_non_nullable
as MyProductRentCount,
  ));
}

/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressShortCopyWith<$Res> get address {
  
  return $MyProductAddressShortCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of MyProductResponseItemShort
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductRentCountCopyWith<$Res> get rentCount {
  
  return $MyProductRentCountCopyWith<$Res>(_self.rentCount, (value) {
    return _then(_self.copyWith(rentCount: value));
  });
}
}


/// @nodoc
mixin _$MyProductAddressShort {

 int get id; String get name;
/// Create a copy of MyProductAddressShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductAddressShortCopyWith<MyProductAddressShort> get copyWith => _$MyProductAddressShortCopyWithImpl<MyProductAddressShort>(this as MyProductAddressShort, _$identity);

  /// Serializes this MyProductAddressShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductAddressShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MyProductAddressShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $MyProductAddressShortCopyWith<$Res>  {
  factory $MyProductAddressShortCopyWith(MyProductAddressShort value, $Res Function(MyProductAddressShort) _then) = _$MyProductAddressShortCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$MyProductAddressShortCopyWithImpl<$Res>
    implements $MyProductAddressShortCopyWith<$Res> {
  _$MyProductAddressShortCopyWithImpl(this._self, this._then);

  final MyProductAddressShort _self;
  final $Res Function(MyProductAddressShort) _then;

/// Create a copy of MyProductAddressShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductAddressShort].
extension MyProductAddressShortPatterns on MyProductAddressShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductAddressShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductAddressShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductAddressShort value)  $default,){
final _that = this;
switch (_that) {
case _MyProductAddressShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductAddressShort value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductAddressShort() when $default != null:
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
case _MyProductAddressShort() when $default != null:
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
case _MyProductAddressShort():
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
case _MyProductAddressShort() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductAddressShort implements MyProductAddressShort {
  const _MyProductAddressShort({required this.id, required this.name});
  factory _MyProductAddressShort.fromJson(Map<String, dynamic> json) => _$MyProductAddressShortFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of MyProductAddressShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductAddressShortCopyWith<_MyProductAddressShort> get copyWith => __$MyProductAddressShortCopyWithImpl<_MyProductAddressShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductAddressShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductAddressShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MyProductAddressShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MyProductAddressShortCopyWith<$Res> implements $MyProductAddressShortCopyWith<$Res> {
  factory _$MyProductAddressShortCopyWith(_MyProductAddressShort value, $Res Function(_MyProductAddressShort) _then) = __$MyProductAddressShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$MyProductAddressShortCopyWithImpl<$Res>
    implements _$MyProductAddressShortCopyWith<$Res> {
  __$MyProductAddressShortCopyWithImpl(this._self, this._then);

  final _MyProductAddressShort _self;
  final $Res Function(_MyProductAddressShort) _then;

/// Create a copy of MyProductAddressShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_MyProductAddressShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MyProductRentCount {

 int get pending; int get ready;@JsonKey(name: "on_rent") int get onRent;@JsonKey(name: "pending_return") int get pendingReturn; int get late;
/// Create a copy of MyProductRentCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductRentCountCopyWith<MyProductRentCount> get copyWith => _$MyProductRentCountCopyWithImpl<MyProductRentCount>(this as MyProductRentCount, _$identity);

  /// Serializes this MyProductRentCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductRentCount&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.ready, ready) || other.ready == ready)&&(identical(other.onRent, onRent) || other.onRent == onRent)&&(identical(other.pendingReturn, pendingReturn) || other.pendingReturn == pendingReturn)&&(identical(other.late, late) || other.late == late));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pending,ready,onRent,pendingReturn,late);

@override
String toString() {
  return 'MyProductRentCount(pending: $pending, ready: $ready, onRent: $onRent, pendingReturn: $pendingReturn, late: $late)';
}


}

/// @nodoc
abstract mixin class $MyProductRentCountCopyWith<$Res>  {
  factory $MyProductRentCountCopyWith(MyProductRentCount value, $Res Function(MyProductRentCount) _then) = _$MyProductRentCountCopyWithImpl;
@useResult
$Res call({
 int pending, int ready,@JsonKey(name: "on_rent") int onRent,@JsonKey(name: "pending_return") int pendingReturn, int late
});




}
/// @nodoc
class _$MyProductRentCountCopyWithImpl<$Res>
    implements $MyProductRentCountCopyWith<$Res> {
  _$MyProductRentCountCopyWithImpl(this._self, this._then);

  final MyProductRentCount _self;
  final $Res Function(MyProductRentCount) _then;

/// Create a copy of MyProductRentCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pending = null,Object? ready = null,Object? onRent = null,Object? pendingReturn = null,Object? late = null,}) {
  return _then(_self.copyWith(
pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as int,onRent: null == onRent ? _self.onRent : onRent // ignore: cast_nullable_to_non_nullable
as int,pendingReturn: null == pendingReturn ? _self.pendingReturn : pendingReturn // ignore: cast_nullable_to_non_nullable
as int,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductRentCount].
extension MyProductRentCountPatterns on MyProductRentCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductRentCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductRentCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductRentCount value)  $default,){
final _that = this;
switch (_that) {
case _MyProductRentCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductRentCount value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductRentCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pending,  int ready, @JsonKey(name: "on_rent")  int onRent, @JsonKey(name: "pending_return")  int pendingReturn,  int late)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductRentCount() when $default != null:
return $default(_that.pending,_that.ready,_that.onRent,_that.pendingReturn,_that.late);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pending,  int ready, @JsonKey(name: "on_rent")  int onRent, @JsonKey(name: "pending_return")  int pendingReturn,  int late)  $default,) {final _that = this;
switch (_that) {
case _MyProductRentCount():
return $default(_that.pending,_that.ready,_that.onRent,_that.pendingReturn,_that.late);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pending,  int ready, @JsonKey(name: "on_rent")  int onRent, @JsonKey(name: "pending_return")  int pendingReturn,  int late)?  $default,) {final _that = this;
switch (_that) {
case _MyProductRentCount() when $default != null:
return $default(_that.pending,_that.ready,_that.onRent,_that.pendingReturn,_that.late);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductRentCount implements MyProductRentCount {
  const _MyProductRentCount({required this.pending, required this.ready, @JsonKey(name: "on_rent") required this.onRent, @JsonKey(name: "pending_return") required this.pendingReturn, required this.late});
  factory _MyProductRentCount.fromJson(Map<String, dynamic> json) => _$MyProductRentCountFromJson(json);

@override final  int pending;
@override final  int ready;
@override@JsonKey(name: "on_rent") final  int onRent;
@override@JsonKey(name: "pending_return") final  int pendingReturn;
@override final  int late;

/// Create a copy of MyProductRentCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductRentCountCopyWith<_MyProductRentCount> get copyWith => __$MyProductRentCountCopyWithImpl<_MyProductRentCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductRentCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductRentCount&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.ready, ready) || other.ready == ready)&&(identical(other.onRent, onRent) || other.onRent == onRent)&&(identical(other.pendingReturn, pendingReturn) || other.pendingReturn == pendingReturn)&&(identical(other.late, late) || other.late == late));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pending,ready,onRent,pendingReturn,late);

@override
String toString() {
  return 'MyProductRentCount(pending: $pending, ready: $ready, onRent: $onRent, pendingReturn: $pendingReturn, late: $late)';
}


}

/// @nodoc
abstract mixin class _$MyProductRentCountCopyWith<$Res> implements $MyProductRentCountCopyWith<$Res> {
  factory _$MyProductRentCountCopyWith(_MyProductRentCount value, $Res Function(_MyProductRentCount) _then) = __$MyProductRentCountCopyWithImpl;
@override @useResult
$Res call({
 int pending, int ready,@JsonKey(name: "on_rent") int onRent,@JsonKey(name: "pending_return") int pendingReturn, int late
});




}
/// @nodoc
class __$MyProductRentCountCopyWithImpl<$Res>
    implements _$MyProductRentCountCopyWith<$Res> {
  __$MyProductRentCountCopyWithImpl(this._self, this._then);

  final _MyProductRentCount _self;
  final $Res Function(_MyProductRentCount) _then;

/// Create a copy of MyProductRentCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pending = null,Object? ready = null,Object? onRent = null,Object? pendingReturn = null,Object? late = null,}) {
  return _then(_MyProductRentCount(
pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as int,onRent: null == onRent ? _self.onRent : onRent // ignore: cast_nullable_to_non_nullable
as int,pendingReturn: null == pendingReturn ? _self.pendingReturn : pendingReturn // ignore: cast_nullable_to_non_nullable
as int,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MyProductResponseItem {

 int get id;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt; String get name;@JsonKey(name: "price_per_day") int get pricePerDay;@JsonKey(name: "late_fee_per_day") int get lateFeePerDay; int get stock; String get description; MyProductAddress get address;
/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductResponseItemCopyWith<MyProductResponseItem> get copyWith => _$MyProductResponseItemCopyWithImpl<MyProductResponseItem>(this as MyProductResponseItem, _$identity);

  /// Serializes this MyProductResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address);

@override
String toString() {
  return 'MyProductResponseItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address)';
}


}

/// @nodoc
abstract mixin class $MyProductResponseItemCopyWith<$Res>  {
  factory $MyProductResponseItemCopyWith(MyProductResponseItem value, $Res Function(MyProductResponseItem) _then) = _$MyProductResponseItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, MyProductAddress address
});


$MyProductAddressCopyWith<$Res> get address;

}
/// @nodoc
class _$MyProductResponseItemCopyWithImpl<$Res>
    implements $MyProductResponseItemCopyWith<$Res> {
  _$MyProductResponseItemCopyWithImpl(this._self, this._then);

  final MyProductResponseItem _self;
  final $Res Function(MyProductResponseItem) _then;

/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddress,
  ));
}
/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressCopyWith<$Res> get address {
  
  return $MyProductAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyProductResponseItem].
extension MyProductResponseItemPatterns on MyProductResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductResponseItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address)  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItem():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address)?  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductResponseItem implements MyProductResponseItem {
  const _MyProductResponseItem({required this.id, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, required this.name, @JsonKey(name: "price_per_day") required this.pricePerDay, @JsonKey(name: "late_fee_per_day") required this.lateFeePerDay, required this.stock, required this.description, required this.address});
  factory _MyProductResponseItem.fromJson(Map<String, dynamic> json) => _$MyProductResponseItemFromJson(json);

@override final  int id;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override final  String name;
@override@JsonKey(name: "price_per_day") final  int pricePerDay;
@override@JsonKey(name: "late_fee_per_day") final  int lateFeePerDay;
@override final  int stock;
@override final  String description;
@override final  MyProductAddress address;

/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductResponseItemCopyWith<_MyProductResponseItem> get copyWith => __$MyProductResponseItemCopyWithImpl<_MyProductResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address);

@override
String toString() {
  return 'MyProductResponseItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address)';
}


}

/// @nodoc
abstract mixin class _$MyProductResponseItemCopyWith<$Res> implements $MyProductResponseItemCopyWith<$Res> {
  factory _$MyProductResponseItemCopyWith(_MyProductResponseItem value, $Res Function(_MyProductResponseItem) _then) = __$MyProductResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, MyProductAddress address
});


@override $MyProductAddressCopyWith<$Res> get address;

}
/// @nodoc
class __$MyProductResponseItemCopyWithImpl<$Res>
    implements _$MyProductResponseItemCopyWith<$Res> {
  __$MyProductResponseItemCopyWithImpl(this._self, this._then);

  final _MyProductResponseItem _self;
  final $Res Function(_MyProductResponseItem) _then;

/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,}) {
  return _then(_MyProductResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddress,
  ));
}

/// Create a copy of MyProductResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressCopyWith<$Res> get address {
  
  return $MyProductAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$MyProductAddress {

 int get id; String get province; String get regency; String get district; String get detail; double get lat; double get lng; String get name;
/// Create a copy of MyProductAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductAddressCopyWith<MyProductAddress> get copyWith => _$MyProductAddressCopyWithImpl<MyProductAddress>(this as MyProductAddress, _$identity);

  /// Serializes this MyProductAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.province, province) || other.province == province)&&(identical(other.regency, regency) || other.regency == regency)&&(identical(other.district, district) || other.district == district)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,province,regency,district,detail,lat,lng,name);

@override
String toString() {
  return 'MyProductAddress(id: $id, province: $province, regency: $regency, district: $district, detail: $detail, lat: $lat, lng: $lng, name: $name)';
}


}

/// @nodoc
abstract mixin class $MyProductAddressCopyWith<$Res>  {
  factory $MyProductAddressCopyWith(MyProductAddress value, $Res Function(MyProductAddress) _then) = _$MyProductAddressCopyWithImpl;
@useResult
$Res call({
 int id, String province, String regency, String district, String detail, double lat, double lng, String name
});




}
/// @nodoc
class _$MyProductAddressCopyWithImpl<$Res>
    implements $MyProductAddressCopyWith<$Res> {
  _$MyProductAddressCopyWithImpl(this._self, this._then);

  final MyProductAddress _self;
  final $Res Function(MyProductAddress) _then;

/// Create a copy of MyProductAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? province = null,Object? regency = null,Object? district = null,Object? detail = null,Object? lat = null,Object? lng = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,regency: null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductAddress].
extension MyProductAddressPatterns on MyProductAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductAddress value)  $default,){
final _that = this;
switch (_that) {
case _MyProductAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductAddress value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String province,  String regency,  String district,  String detail,  double lat,  double lng,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductAddress() when $default != null:
return $default(_that.id,_that.province,_that.regency,_that.district,_that.detail,_that.lat,_that.lng,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String province,  String regency,  String district,  String detail,  double lat,  double lng,  String name)  $default,) {final _that = this;
switch (_that) {
case _MyProductAddress():
return $default(_that.id,_that.province,_that.regency,_that.district,_that.detail,_that.lat,_that.lng,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String province,  String regency,  String district,  String detail,  double lat,  double lng,  String name)?  $default,) {final _that = this;
switch (_that) {
case _MyProductAddress() when $default != null:
return $default(_that.id,_that.province,_that.regency,_that.district,_that.detail,_that.lat,_that.lng,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductAddress implements MyProductAddress {
  const _MyProductAddress({required this.id, required this.province, required this.regency, required this.district, required this.detail, required this.lat, required this.lng, required this.name});
  factory _MyProductAddress.fromJson(Map<String, dynamic> json) => _$MyProductAddressFromJson(json);

@override final  int id;
@override final  String province;
@override final  String regency;
@override final  String district;
@override final  String detail;
@override final  double lat;
@override final  double lng;
@override final  String name;

/// Create a copy of MyProductAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductAddressCopyWith<_MyProductAddress> get copyWith => __$MyProductAddressCopyWithImpl<_MyProductAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.province, province) || other.province == province)&&(identical(other.regency, regency) || other.regency == regency)&&(identical(other.district, district) || other.district == district)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,province,regency,district,detail,lat,lng,name);

@override
String toString() {
  return 'MyProductAddress(id: $id, province: $province, regency: $regency, district: $district, detail: $detail, lat: $lat, lng: $lng, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MyProductAddressCopyWith<$Res> implements $MyProductAddressCopyWith<$Res> {
  factory _$MyProductAddressCopyWith(_MyProductAddress value, $Res Function(_MyProductAddress) _then) = __$MyProductAddressCopyWithImpl;
@override @useResult
$Res call({
 int id, String province, String regency, String district, String detail, double lat, double lng, String name
});




}
/// @nodoc
class __$MyProductAddressCopyWithImpl<$Res>
    implements _$MyProductAddressCopyWith<$Res> {
  __$MyProductAddressCopyWithImpl(this._self, this._then);

  final _MyProductAddress _self;
  final $Res Function(_MyProductAddress) _then;

/// Create a copy of MyProductAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? province = null,Object? regency = null,Object? district = null,Object? detail = null,Object? lat = null,Object? lng = null,Object? name = null,}) {
  return _then(_MyProductAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,regency: null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MyProductResponseItemDetail {

 int get id;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt; String get name;@JsonKey(name: "price_per_day") int get pricePerDay;@JsonKey(name: "late_fee_per_day") int get lateFeePerDay; int get stock; String get description; MyProductAddress get address;@JsonKey(name: "top_reviews") List<ProductReviewDetail> get topReviews; List<MyProductRentItem> get rents;
/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductResponseItemDetailCopyWith<MyProductResponseItemDetail> get copyWith => _$MyProductResponseItemDetailCopyWithImpl<MyProductResponseItemDetail>(this as MyProductResponseItemDetail, _$identity);

  /// Serializes this MyProductResponseItemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductResponseItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.topReviews, topReviews)&&const DeepCollectionEquality().equals(other.rents, rents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address,const DeepCollectionEquality().hash(topReviews),const DeepCollectionEquality().hash(rents));

@override
String toString() {
  return 'MyProductResponseItemDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address, topReviews: $topReviews, rents: $rents)';
}


}

/// @nodoc
abstract mixin class $MyProductResponseItemDetailCopyWith<$Res>  {
  factory $MyProductResponseItemDetailCopyWith(MyProductResponseItemDetail value, $Res Function(MyProductResponseItemDetail) _then) = _$MyProductResponseItemDetailCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, MyProductAddress address,@JsonKey(name: "top_reviews") List<ProductReviewDetail> topReviews, List<MyProductRentItem> rents
});


$MyProductAddressCopyWith<$Res> get address;

}
/// @nodoc
class _$MyProductResponseItemDetailCopyWithImpl<$Res>
    implements $MyProductResponseItemDetailCopyWith<$Res> {
  _$MyProductResponseItemDetailCopyWithImpl(this._self, this._then);

  final MyProductResponseItemDetail _self;
  final $Res Function(MyProductResponseItemDetail) _then;

/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,Object? topReviews = null,Object? rents = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddress,topReviews: null == topReviews ? _self.topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ProductReviewDetail>,rents: null == rents ? _self.rents : rents // ignore: cast_nullable_to_non_nullable
as List<MyProductRentItem>,
  ));
}
/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressCopyWith<$Res> get address {
  
  return $MyProductAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyProductResponseItemDetail].
extension MyProductResponseItemDetailPatterns on MyProductResponseItemDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductResponseItemDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductResponseItemDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductResponseItemDetail value)  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItemDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductResponseItemDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductResponseItemDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews,  List<MyProductRentItem> rents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductResponseItemDetail() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.topReviews,_that.rents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews,  List<MyProductRentItem> rents)  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItemDetail():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.topReviews,_that.rents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt,  String name, @JsonKey(name: "price_per_day")  int pricePerDay, @JsonKey(name: "late_fee_per_day")  int lateFeePerDay,  int stock,  String description,  MyProductAddress address, @JsonKey(name: "top_reviews")  List<ProductReviewDetail> topReviews,  List<MyProductRentItem> rents)?  $default,) {final _that = this;
switch (_that) {
case _MyProductResponseItemDetail() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.pricePerDay,_that.lateFeePerDay,_that.stock,_that.description,_that.address,_that.topReviews,_that.rents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductResponseItemDetail implements MyProductResponseItemDetail {
  const _MyProductResponseItemDetail({required this.id, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, required this.name, @JsonKey(name: "price_per_day") required this.pricePerDay, @JsonKey(name: "late_fee_per_day") required this.lateFeePerDay, required this.stock, required this.description, required this.address, @JsonKey(name: "top_reviews") required final  List<ProductReviewDetail> topReviews, required final  List<MyProductRentItem> rents}): _topReviews = topReviews,_rents = rents;
  factory _MyProductResponseItemDetail.fromJson(Map<String, dynamic> json) => _$MyProductResponseItemDetailFromJson(json);

@override final  int id;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override final  String name;
@override@JsonKey(name: "price_per_day") final  int pricePerDay;
@override@JsonKey(name: "late_fee_per_day") final  int lateFeePerDay;
@override final  int stock;
@override final  String description;
@override final  MyProductAddress address;
 final  List<ProductReviewDetail> _topReviews;
@override@JsonKey(name: "top_reviews") List<ProductReviewDetail> get topReviews {
  if (_topReviews is EqualUnmodifiableListView) return _topReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topReviews);
}

 final  List<MyProductRentItem> _rents;
@override List<MyProductRentItem> get rents {
  if (_rents is EqualUnmodifiableListView) return _rents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rents);
}


/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductResponseItemDetailCopyWith<_MyProductResponseItemDetail> get copyWith => __$MyProductResponseItemDetailCopyWithImpl<_MyProductResponseItemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductResponseItemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductResponseItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.lateFeePerDay, lateFeePerDay) || other.lateFeePerDay == lateFeePerDay)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._topReviews, _topReviews)&&const DeepCollectionEquality().equals(other._rents, _rents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,pricePerDay,lateFeePerDay,stock,description,address,const DeepCollectionEquality().hash(_topReviews),const DeepCollectionEquality().hash(_rents));

@override
String toString() {
  return 'MyProductResponseItemDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, pricePerDay: $pricePerDay, lateFeePerDay: $lateFeePerDay, stock: $stock, description: $description, address: $address, topReviews: $topReviews, rents: $rents)';
}


}

/// @nodoc
abstract mixin class _$MyProductResponseItemDetailCopyWith<$Res> implements $MyProductResponseItemDetailCopyWith<$Res> {
  factory _$MyProductResponseItemDetailCopyWith(_MyProductResponseItemDetail value, $Res Function(_MyProductResponseItemDetail) _then) = __$MyProductResponseItemDetailCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt, String name,@JsonKey(name: "price_per_day") int pricePerDay,@JsonKey(name: "late_fee_per_day") int lateFeePerDay, int stock, String description, MyProductAddress address,@JsonKey(name: "top_reviews") List<ProductReviewDetail> topReviews, List<MyProductRentItem> rents
});


@override $MyProductAddressCopyWith<$Res> get address;

}
/// @nodoc
class __$MyProductResponseItemDetailCopyWithImpl<$Res>
    implements _$MyProductResponseItemDetailCopyWith<$Res> {
  __$MyProductResponseItemDetailCopyWithImpl(this._self, this._then);

  final _MyProductResponseItemDetail _self;
  final $Res Function(_MyProductResponseItemDetail) _then;

/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? pricePerDay = null,Object? lateFeePerDay = null,Object? stock = null,Object? description = null,Object? address = null,Object? topReviews = null,Object? rents = null,}) {
  return _then(_MyProductResponseItemDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as int,lateFeePerDay: null == lateFeePerDay ? _self.lateFeePerDay : lateFeePerDay // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as MyProductAddress,topReviews: null == topReviews ? _self._topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ProductReviewDetail>,rents: null == rents ? _self._rents : rents // ignore: cast_nullable_to_non_nullable
as List<MyProductRentItem>,
  ));
}

/// Create a copy of MyProductResponseItemDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductAddressCopyWith<$Res> get address {
  
  return $MyProductAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$MyProductRentItem {

 int get id; ProductUserData get user; RentState get state;@JsonKey(name: "start_date")@Iso8601Converter() DateTime get startDate;@JsonKey(name: "end_date")@Iso8601Converter() DateTime get endDate; int get quantity;
/// Create a copy of MyProductRentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductRentItemCopyWith<MyProductRentItem> get copyWith => _$MyProductRentItemCopyWithImpl<MyProductRentItem>(this as MyProductRentItem, _$identity);

  /// Serializes this MyProductRentItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductRentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,state,startDate,endDate,quantity);

@override
String toString() {
  return 'MyProductRentItem(id: $id, user: $user, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $MyProductRentItemCopyWith<$Res>  {
  factory $MyProductRentItemCopyWith(MyProductRentItem value, $Res Function(MyProductRentItem) _then) = _$MyProductRentItemCopyWithImpl;
@useResult
$Res call({
 int id, ProductUserData user, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});




}
/// @nodoc
class _$MyProductRentItemCopyWithImpl<$Res>
    implements $MyProductRentItemCopyWith<$Res> {
  _$MyProductRentItemCopyWithImpl(this._self, this._then);

  final MyProductRentItem _self;
  final $Res Function(MyProductRentItem) _then;

/// Create a copy of MyProductRentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUserData,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductRentItem].
extension MyProductRentItemPatterns on MyProductRentItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductRentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductRentItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductRentItem value)  $default,){
final _that = this;
switch (_that) {
case _MyProductRentItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductRentItem value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductRentItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ProductUserData user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductRentItem() when $default != null:
return $default(_that.id,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ProductUserData user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _MyProductRentItem():
return $default(_that.id,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ProductUserData user,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _MyProductRentItem() when $default != null:
return $default(_that.id,_that.user,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductRentItem implements MyProductRentItem {
  const _MyProductRentItem({required this.id, required this.user, required this.state, @JsonKey(name: "start_date")@Iso8601Converter() required this.startDate, @JsonKey(name: "end_date")@Iso8601Converter() required this.endDate, required this.quantity});
  factory _MyProductRentItem.fromJson(Map<String, dynamic> json) => _$MyProductRentItemFromJson(json);

@override final  int id;
@override final  ProductUserData user;
@override final  RentState state;
@override@JsonKey(name: "start_date")@Iso8601Converter() final  DateTime startDate;
@override@JsonKey(name: "end_date")@Iso8601Converter() final  DateTime endDate;
@override final  int quantity;

/// Create a copy of MyProductRentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductRentItemCopyWith<_MyProductRentItem> get copyWith => __$MyProductRentItemCopyWithImpl<_MyProductRentItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductRentItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductRentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,state,startDate,endDate,quantity);

@override
String toString() {
  return 'MyProductRentItem(id: $id, user: $user, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$MyProductRentItemCopyWith<$Res> implements $MyProductRentItemCopyWith<$Res> {
  factory _$MyProductRentItemCopyWith(_MyProductRentItem value, $Res Function(_MyProductRentItem) _then) = __$MyProductRentItemCopyWithImpl;
@override @useResult
$Res call({
 int id, ProductUserData user, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});




}
/// @nodoc
class __$MyProductRentItemCopyWithImpl<$Res>
    implements _$MyProductRentItemCopyWith<$Res> {
  __$MyProductRentItemCopyWithImpl(this._self, this._then);

  final _MyProductRentItem _self;
  final $Res Function(_MyProductRentItem) _then;

/// Create a copy of MyProductRentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_MyProductRentItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUserData,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
