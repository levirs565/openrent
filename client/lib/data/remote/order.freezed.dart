// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderProductShort {

 int get id; String get name;
/// Create a copy of OrderProductShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderProductShortCopyWith<OrderProductShort> get copyWith => _$OrderProductShortCopyWithImpl<OrderProductShort>(this as OrderProductShort, _$identity);

  /// Serializes this OrderProductShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderProductShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $OrderProductShortCopyWith<$Res>  {
  factory $OrderProductShortCopyWith(OrderProductShort value, $Res Function(OrderProductShort) _then) = _$OrderProductShortCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$OrderProductShortCopyWithImpl<$Res>
    implements $OrderProductShortCopyWith<$Res> {
  _$OrderProductShortCopyWithImpl(this._self, this._then);

  final OrderProductShort _self;
  final $Res Function(OrderProductShort) _then;

/// Create a copy of OrderProductShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderProductShort].
extension OrderProductShortPatterns on OrderProductShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderProductShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderProductShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderProductShort value)  $default,){
final _that = this;
switch (_that) {
case _OrderProductShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderProductShort value)?  $default,){
final _that = this;
switch (_that) {
case _OrderProductShort() when $default != null:
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
case _OrderProductShort() when $default != null:
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
case _OrderProductShort():
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
case _OrderProductShort() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderProductShort implements OrderProductShort {
   _OrderProductShort({required this.id, required this.name});
  factory _OrderProductShort.fromJson(Map<String, dynamic> json) => _$OrderProductShortFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of OrderProductShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderProductShortCopyWith<_OrderProductShort> get copyWith => __$OrderProductShortCopyWithImpl<_OrderProductShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderProductShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderProductShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderProductShortCopyWith<$Res> implements $OrderProductShortCopyWith<$Res> {
  factory _$OrderProductShortCopyWith(_OrderProductShort value, $Res Function(_OrderProductShort) _then) = __$OrderProductShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$OrderProductShortCopyWithImpl<$Res>
    implements _$OrderProductShortCopyWith<$Res> {
  __$OrderProductShortCopyWithImpl(this._self, this._then);

  final _OrderProductShort _self;
  final $Res Function(_OrderProductShort) _then;

/// Create a copy of OrderProductShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_OrderProductShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderUserShort {

 int get id; String get name;
/// Create a copy of OrderUserShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderUserShortCopyWith<OrderUserShort> get copyWith => _$OrderUserShortCopyWithImpl<OrderUserShort>(this as OrderUserShort, _$identity);

  /// Serializes this OrderUserShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderUserShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $OrderUserShortCopyWith<$Res>  {
  factory $OrderUserShortCopyWith(OrderUserShort value, $Res Function(OrderUserShort) _then) = _$OrderUserShortCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$OrderUserShortCopyWithImpl<$Res>
    implements $OrderUserShortCopyWith<$Res> {
  _$OrderUserShortCopyWithImpl(this._self, this._then);

  final OrderUserShort _self;
  final $Res Function(OrderUserShort) _then;

/// Create a copy of OrderUserShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderUserShort].
extension OrderUserShortPatterns on OrderUserShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderUserShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderUserShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderUserShort value)  $default,){
final _that = this;
switch (_that) {
case _OrderUserShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderUserShort value)?  $default,){
final _that = this;
switch (_that) {
case _OrderUserShort() when $default != null:
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
case _OrderUserShort() when $default != null:
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
case _OrderUserShort():
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
case _OrderUserShort() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderUserShort implements OrderUserShort {
   _OrderUserShort({required this.id, required this.name});
  factory _OrderUserShort.fromJson(Map<String, dynamic> json) => _$OrderUserShortFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of OrderUserShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderUserShortCopyWith<_OrderUserShort> get copyWith => __$OrderUserShortCopyWithImpl<_OrderUserShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderUserShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderUserShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderUserShortCopyWith<$Res> implements $OrderUserShortCopyWith<$Res> {
  factory _$OrderUserShortCopyWith(_OrderUserShort value, $Res Function(_OrderUserShort) _then) = __$OrderUserShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$OrderUserShortCopyWithImpl<$Res>
    implements _$OrderUserShortCopyWith<$Res> {
  __$OrderUserShortCopyWithImpl(this._self, this._then);

  final _OrderUserShort _self;
  final $Res Function(_OrderUserShort) _then;

/// Create a copy of OrderUserShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_OrderUserShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderReviewShort {

 int get id;
/// Create a copy of OrderReviewShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReviewShortCopyWith<OrderReviewShort> get copyWith => _$OrderReviewShortCopyWithImpl<OrderReviewShort>(this as OrderReviewShort, _$identity);

  /// Serializes this OrderReviewShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReviewShort&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'OrderReviewShort(id: $id)';
}


}

/// @nodoc
abstract mixin class $OrderReviewShortCopyWith<$Res>  {
  factory $OrderReviewShortCopyWith(OrderReviewShort value, $Res Function(OrderReviewShort) _then) = _$OrderReviewShortCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$OrderReviewShortCopyWithImpl<$Res>
    implements $OrderReviewShortCopyWith<$Res> {
  _$OrderReviewShortCopyWithImpl(this._self, this._then);

  final OrderReviewShort _self;
  final $Res Function(OrderReviewShort) _then;

/// Create a copy of OrderReviewShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderReviewShort].
extension OrderReviewShortPatterns on OrderReviewShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderReviewShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderReviewShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderReviewShort value)  $default,){
final _that = this;
switch (_that) {
case _OrderReviewShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderReviewShort value)?  $default,){
final _that = this;
switch (_that) {
case _OrderReviewShort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderReviewShort() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _OrderReviewShort():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _OrderReviewShort() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderReviewShort implements OrderReviewShort {
   _OrderReviewShort({required this.id});
  factory _OrderReviewShort.fromJson(Map<String, dynamic> json) => _$OrderReviewShortFromJson(json);

@override final  int id;

/// Create a copy of OrderReviewShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderReviewShortCopyWith<_OrderReviewShort> get copyWith => __$OrderReviewShortCopyWithImpl<_OrderReviewShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderReviewShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderReviewShort&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'OrderReviewShort(id: $id)';
}


}

/// @nodoc
abstract mixin class _$OrderReviewShortCopyWith<$Res> implements $OrderReviewShortCopyWith<$Res> {
  factory _$OrderReviewShortCopyWith(_OrderReviewShort value, $Res Function(_OrderReviewShort) _then) = __$OrderReviewShortCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$OrderReviewShortCopyWithImpl<$Res>
    implements _$OrderReviewShortCopyWith<$Res> {
  __$OrderReviewShortCopyWithImpl(this._self, this._then);

  final _OrderReviewShort _self;
  final $Res Function(_OrderReviewShort) _then;

/// Create a copy of OrderReviewShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_OrderReviewShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrderResponseItem {

 int get id; OrderProductShort get product; OrderUserShort get user; OrderReviewShort? get review; RentState get state;@JsonKey(name: "start_date")@Iso8601Converter() DateTime get startDate;@JsonKey(name: "end_date")@Iso8601Converter() DateTime get endDate; int get quantity;
/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResponseItemCopyWith<OrderResponseItem> get copyWith => _$OrderResponseItemCopyWithImpl<OrderResponseItem>(this as OrderResponseItem, _$identity);

  /// Serializes this OrderResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity);

@override
String toString() {
  return 'OrderResponseItem(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OrderResponseItemCopyWith<$Res>  {
  factory $OrderResponseItemCopyWith(OrderResponseItem value, $Res Function(OrderResponseItem) _then) = _$OrderResponseItemCopyWithImpl;
@useResult
$Res call({
 int id, OrderProductShort product, OrderUserShort user, OrderReviewShort? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


$OrderProductShortCopyWith<$Res> get product;$OrderUserShortCopyWith<$Res> get user;$OrderReviewShortCopyWith<$Res>? get review;

}
/// @nodoc
class _$OrderResponseItemCopyWithImpl<$Res>
    implements $OrderResponseItemCopyWith<$Res> {
  _$OrderResponseItemCopyWithImpl(this._self, this._then);

  final OrderResponseItem _self;
  final $Res Function(OrderResponseItem) _then;

/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserShort,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as OrderReviewShort?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductShortCopyWith<$Res> get product {
  
  return $OrderProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserShortCopyWith<$Res> get user {
  
  return $OrderUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderReviewShortCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $OrderReviewShortCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderResponseItem].
extension OrderResponseItemPatterns on OrderResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  OrderProductShort product,  OrderUserShort user,  OrderReviewShort? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResponseItem() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  OrderProductShort product,  OrderUserShort user,  OrderReviewShort? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderResponseItem():
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  OrderProductShort product,  OrderUserShort user,  OrderReviewShort? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderResponseItem() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResponseItem implements OrderResponseItem {
   _OrderResponseItem({required this.id, required this.product, required this.user, required this.review, required this.state, @JsonKey(name: "start_date")@Iso8601Converter() required this.startDate, @JsonKey(name: "end_date")@Iso8601Converter() required this.endDate, required this.quantity});
  factory _OrderResponseItem.fromJson(Map<String, dynamic> json) => _$OrderResponseItemFromJson(json);

@override final  int id;
@override final  OrderProductShort product;
@override final  OrderUserShort user;
@override final  OrderReviewShort? review;
@override final  RentState state;
@override@JsonKey(name: "start_date")@Iso8601Converter() final  DateTime startDate;
@override@JsonKey(name: "end_date")@Iso8601Converter() final  DateTime endDate;
@override final  int quantity;

/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResponseItemCopyWith<_OrderResponseItem> get copyWith => __$OrderResponseItemCopyWithImpl<_OrderResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity);

@override
String toString() {
  return 'OrderResponseItem(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderResponseItemCopyWith<$Res> implements $OrderResponseItemCopyWith<$Res> {
  factory _$OrderResponseItemCopyWith(_OrderResponseItem value, $Res Function(_OrderResponseItem) _then) = __$OrderResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id, OrderProductShort product, OrderUserShort user, OrderReviewShort? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


@override $OrderProductShortCopyWith<$Res> get product;@override $OrderUserShortCopyWith<$Res> get user;@override $OrderReviewShortCopyWith<$Res>? get review;

}
/// @nodoc
class __$OrderResponseItemCopyWithImpl<$Res>
    implements _$OrderResponseItemCopyWith<$Res> {
  __$OrderResponseItemCopyWithImpl(this._self, this._then);

  final _OrderResponseItem _self;
  final $Res Function(_OrderResponseItem) _then;

/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_OrderResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserShort,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as OrderReviewShort?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductShortCopyWith<$Res> get product {
  
  return $OrderProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserShortCopyWith<$Res> get user {
  
  return $OrderUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderReviewShortCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $OrderReviewShortCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}


/// @nodoc
mixin _$OrderUserDetails {

 int get id; String get name;
/// Create a copy of OrderUserDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderUserDetailsCopyWith<OrderUserDetails> get copyWith => _$OrderUserDetailsCopyWithImpl<OrderUserDetails>(this as OrderUserDetails, _$identity);

  /// Serializes this OrderUserDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderUserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderUserDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $OrderUserDetailsCopyWith<$Res>  {
  factory $OrderUserDetailsCopyWith(OrderUserDetails value, $Res Function(OrderUserDetails) _then) = _$OrderUserDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$OrderUserDetailsCopyWithImpl<$Res>
    implements $OrderUserDetailsCopyWith<$Res> {
  _$OrderUserDetailsCopyWithImpl(this._self, this._then);

  final OrderUserDetails _self;
  final $Res Function(OrderUserDetails) _then;

/// Create a copy of OrderUserDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderUserDetails].
extension OrderUserDetailsPatterns on OrderUserDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderUserDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderUserDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderUserDetails value)  $default,){
final _that = this;
switch (_that) {
case _OrderUserDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderUserDetails value)?  $default,){
final _that = this;
switch (_that) {
case _OrderUserDetails() when $default != null:
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
case _OrderUserDetails() when $default != null:
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
case _OrderUserDetails():
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
case _OrderUserDetails() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderUserDetails implements OrderUserDetails {
   _OrderUserDetails({required this.id, required this.name});
  factory _OrderUserDetails.fromJson(Map<String, dynamic> json) => _$OrderUserDetailsFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of OrderUserDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderUserDetailsCopyWith<_OrderUserDetails> get copyWith => __$OrderUserDetailsCopyWithImpl<_OrderUserDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderUserDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderUserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'OrderUserDetails(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderUserDetailsCopyWith<$Res> implements $OrderUserDetailsCopyWith<$Res> {
  factory _$OrderUserDetailsCopyWith(_OrderUserDetails value, $Res Function(_OrderUserDetails) _then) = __$OrderUserDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$OrderUserDetailsCopyWithImpl<$Res>
    implements _$OrderUserDetailsCopyWith<$Res> {
  __$OrderUserDetailsCopyWithImpl(this._self, this._then);

  final _OrderUserDetails _self;
  final $Res Function(_OrderUserDetails) _then;

/// Create a copy of OrderUserDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_OrderUserDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderReviewDetails {

 int get id; int get rating; String get content;
/// Create a copy of OrderReviewDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReviewDetailsCopyWith<OrderReviewDetails> get copyWith => _$OrderReviewDetailsCopyWithImpl<OrderReviewDetails>(this as OrderReviewDetails, _$identity);

  /// Serializes this OrderReviewDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReviewDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,content);

@override
String toString() {
  return 'OrderReviewDetails(id: $id, rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class $OrderReviewDetailsCopyWith<$Res>  {
  factory $OrderReviewDetailsCopyWith(OrderReviewDetails value, $Res Function(OrderReviewDetails) _then) = _$OrderReviewDetailsCopyWithImpl;
@useResult
$Res call({
 int id, int rating, String content
});




}
/// @nodoc
class _$OrderReviewDetailsCopyWithImpl<$Res>
    implements $OrderReviewDetailsCopyWith<$Res> {
  _$OrderReviewDetailsCopyWithImpl(this._self, this._then);

  final OrderReviewDetails _self;
  final $Res Function(OrderReviewDetails) _then;

/// Create a copy of OrderReviewDetails
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


/// Adds pattern-matching-related methods to [OrderReviewDetails].
extension OrderReviewDetailsPatterns on OrderReviewDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderReviewDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderReviewDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderReviewDetails value)  $default,){
final _that = this;
switch (_that) {
case _OrderReviewDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderReviewDetails value)?  $default,){
final _that = this;
switch (_that) {
case _OrderReviewDetails() when $default != null:
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
case _OrderReviewDetails() when $default != null:
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
case _OrderReviewDetails():
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
case _OrderReviewDetails() when $default != null:
return $default(_that.id,_that.rating,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderReviewDetails implements OrderReviewDetails {
   _OrderReviewDetails({required this.id, required this.rating, required this.content});
  factory _OrderReviewDetails.fromJson(Map<String, dynamic> json) => _$OrderReviewDetailsFromJson(json);

@override final  int id;
@override final  int rating;
@override final  String content;

/// Create a copy of OrderReviewDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderReviewDetailsCopyWith<_OrderReviewDetails> get copyWith => __$OrderReviewDetailsCopyWithImpl<_OrderReviewDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderReviewDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderReviewDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,content);

@override
String toString() {
  return 'OrderReviewDetails(id: $id, rating: $rating, content: $content)';
}


}

/// @nodoc
abstract mixin class _$OrderReviewDetailsCopyWith<$Res> implements $OrderReviewDetailsCopyWith<$Res> {
  factory _$OrderReviewDetailsCopyWith(_OrderReviewDetails value, $Res Function(_OrderReviewDetails) _then) = __$OrderReviewDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, int rating, String content
});




}
/// @nodoc
class __$OrderReviewDetailsCopyWithImpl<$Res>
    implements _$OrderReviewDetailsCopyWith<$Res> {
  __$OrderReviewDetailsCopyWithImpl(this._self, this._then);

  final _OrderReviewDetails _self;
  final $Res Function(_OrderReviewDetails) _then;

/// Create a copy of OrderReviewDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rating = null,Object? content = null,}) {
  return _then(_OrderReviewDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderResponseItemDetails {

 int get id; OrderProductShort get product; OrderUserDetails get user; OrderReviewDetails? get review; RentState get state;@JsonKey(name: "start_date")@Iso8601Converter() DateTime get startDate;@JsonKey(name: "end_date")@Iso8601Converter() DateTime get endDate; int get quantity;
/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResponseItemDetailsCopyWith<OrderResponseItemDetails> get copyWith => _$OrderResponseItemDetailsCopyWithImpl<OrderResponseItemDetails>(this as OrderResponseItemDetails, _$identity);

  /// Serializes this OrderResponseItemDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResponseItemDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity);

@override
String toString() {
  return 'OrderResponseItemDetails(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OrderResponseItemDetailsCopyWith<$Res>  {
  factory $OrderResponseItemDetailsCopyWith(OrderResponseItemDetails value, $Res Function(OrderResponseItemDetails) _then) = _$OrderResponseItemDetailsCopyWithImpl;
@useResult
$Res call({
 int id, OrderProductShort product, OrderUserDetails user, OrderReviewDetails? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


$OrderProductShortCopyWith<$Res> get product;$OrderUserDetailsCopyWith<$Res> get user;$OrderReviewDetailsCopyWith<$Res>? get review;

}
/// @nodoc
class _$OrderResponseItemDetailsCopyWithImpl<$Res>
    implements $OrderResponseItemDetailsCopyWith<$Res> {
  _$OrderResponseItemDetailsCopyWithImpl(this._self, this._then);

  final OrderResponseItemDetails _self;
  final $Res Function(OrderResponseItemDetails) _then;

/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserDetails,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as OrderReviewDetails?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductShortCopyWith<$Res> get product {
  
  return $OrderProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDetailsCopyWith<$Res> get user {
  
  return $OrderUserDetailsCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderReviewDetailsCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $OrderReviewDetailsCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderResponseItemDetails].
extension OrderResponseItemDetailsPatterns on OrderResponseItemDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResponseItemDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResponseItemDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResponseItemDetails value)  $default,){
final _that = this;
switch (_that) {
case _OrderResponseItemDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResponseItemDetails value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResponseItemDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  OrderProductShort product,  OrderUserDetails user,  OrderReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResponseItemDetails() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  OrderProductShort product,  OrderUserDetails user,  OrderReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderResponseItemDetails():
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  OrderProductShort product,  OrderUserDetails user,  OrderReviewDetails? review,  RentState state, @JsonKey(name: "start_date")@Iso8601Converter()  DateTime startDate, @JsonKey(name: "end_date")@Iso8601Converter()  DateTime endDate,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderResponseItemDetails() when $default != null:
return $default(_that.id,_that.product,_that.user,_that.review,_that.state,_that.startDate,_that.endDate,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResponseItemDetails implements OrderResponseItemDetails {
   _OrderResponseItemDetails({required this.id, required this.product, required this.user, required this.review, required this.state, @JsonKey(name: "start_date")@Iso8601Converter() required this.startDate, @JsonKey(name: "end_date")@Iso8601Converter() required this.endDate, required this.quantity});
  factory _OrderResponseItemDetails.fromJson(Map<String, dynamic> json) => _$OrderResponseItemDetailsFromJson(json);

@override final  int id;
@override final  OrderProductShort product;
@override final  OrderUserDetails user;
@override final  OrderReviewDetails? review;
@override final  RentState state;
@override@JsonKey(name: "start_date")@Iso8601Converter() final  DateTime startDate;
@override@JsonKey(name: "end_date")@Iso8601Converter() final  DateTime endDate;
@override final  int quantity;

/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResponseItemDetailsCopyWith<_OrderResponseItemDetails> get copyWith => __$OrderResponseItemDetailsCopyWithImpl<_OrderResponseItemDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResponseItemDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResponseItemDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.user, user) || other.user == user)&&(identical(other.review, review) || other.review == review)&&(identical(other.state, state) || other.state == state)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,user,review,state,startDate,endDate,quantity);

@override
String toString() {
  return 'OrderResponseItemDetails(id: $id, product: $product, user: $user, review: $review, state: $state, startDate: $startDate, endDate: $endDate, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderResponseItemDetailsCopyWith<$Res> implements $OrderResponseItemDetailsCopyWith<$Res> {
  factory _$OrderResponseItemDetailsCopyWith(_OrderResponseItemDetails value, $Res Function(_OrderResponseItemDetails) _then) = __$OrderResponseItemDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, OrderProductShort product, OrderUserDetails user, OrderReviewDetails? review, RentState state,@JsonKey(name: "start_date")@Iso8601Converter() DateTime startDate,@JsonKey(name: "end_date")@Iso8601Converter() DateTime endDate, int quantity
});


@override $OrderProductShortCopyWith<$Res> get product;@override $OrderUserDetailsCopyWith<$Res> get user;@override $OrderReviewDetailsCopyWith<$Res>? get review;

}
/// @nodoc
class __$OrderResponseItemDetailsCopyWithImpl<$Res>
    implements _$OrderResponseItemDetailsCopyWith<$Res> {
  __$OrderResponseItemDetailsCopyWithImpl(this._self, this._then);

  final _OrderResponseItemDetails _self;
  final $Res Function(_OrderResponseItemDetails) _then;

/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? user = null,Object? review = freezed,Object? state = null,Object? startDate = null,Object? endDate = null,Object? quantity = null,}) {
  return _then(_OrderResponseItemDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductShort,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserDetails,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as OrderReviewDetails?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RentState,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductShortCopyWith<$Res> get product {
  
  return $OrderProductShortCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDetailsCopyWith<$Res> get user {
  
  return $OrderUserDetailsCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderResponseItemDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderReviewDetailsCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $OrderReviewDetailsCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}

// dart format on
