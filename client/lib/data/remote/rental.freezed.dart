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

 int get id; String get name;
/// Create a copy of RentalProductShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalProductShortCopyWith<RentalProductShort> get copyWith => _$RentalProductShortCopyWithImpl<RentalProductShort>(this as RentalProductShort, _$identity);

  /// Serializes this RentalProductShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalProductShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RentalProductShortCopyWith<$Res>  {
  factory $RentalProductShortCopyWith(RentalProductShort value, $Res Function(RentalProductShort) _then) = _$RentalProductShortCopyWithImpl;
@useResult
$Res call({
 int id, String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalProductShort() when $default != null:
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
case _RentalProductShort():
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
case _RentalProductShort() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalProductShort implements RentalProductShort {
  const _RentalProductShort({required this.id, required this.name});
  factory _RentalProductShort.fromJson(Map<String, dynamic> json) => _$RentalProductShortFromJson(json);

@override final  int id;
@override final  String name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalProductShort&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RentalProductShort(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RentalProductShortCopyWith<$Res> implements $RentalProductShortCopyWith<$Res> {
  factory _$RentalProductShortCopyWith(_RentalProductShort value, $Res Function(_RentalProductShort) _then) = __$RentalProductShortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RentalProductShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

// dart format on
