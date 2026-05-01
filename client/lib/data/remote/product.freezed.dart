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

// dart format on
