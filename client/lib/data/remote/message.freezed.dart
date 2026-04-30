// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageResponseItem {

 int get id;@JsonKey(name: "current_user") bool get currentUser;@JsonKey(name: "created_at")@Iso8601Converter() DateTime get createdAt;@JsonKey(name: "updated_at")@Iso8601Converter() DateTime get updatedAt; String? get message;@JsonKey(name: "deleted_at")@Iso8601Converter() DateTime? get deletedAt;
/// Create a copy of MessageResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageResponseItemCopyWith<MessageResponseItem> get copyWith => _$MessageResponseItemCopyWithImpl<MessageResponseItem>(this as MessageResponseItem, _$identity);

  /// Serializes this MessageResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.message, message) || other.message == message)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentUser,createdAt,updatedAt,message,deletedAt);

@override
String toString() {
  return 'MessageResponseItem(id: $id, currentUser: $currentUser, createdAt: $createdAt, updatedAt: $updatedAt, message: $message, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MessageResponseItemCopyWith<$Res>  {
  factory $MessageResponseItemCopyWith(MessageResponseItem value, $Res Function(MessageResponseItem) _then) = _$MessageResponseItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: "current_user") bool currentUser,@JsonKey(name: "created_at")@Iso8601Converter() DateTime createdAt,@JsonKey(name: "updated_at")@Iso8601Converter() DateTime updatedAt, String? message,@JsonKey(name: "deleted_at")@Iso8601Converter() DateTime? deletedAt
});




}
/// @nodoc
class _$MessageResponseItemCopyWithImpl<$Res>
    implements $MessageResponseItemCopyWith<$Res> {
  _$MessageResponseItemCopyWithImpl(this._self, this._then);

  final MessageResponseItem _self;
  final $Res Function(MessageResponseItem) _then;

/// Create a copy of MessageResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? currentUser = null,Object? createdAt = null,Object? updatedAt = null,Object? message = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageResponseItem].
extension MessageResponseItemPatterns on MessageResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _MessageResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _MessageResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "current_user")  bool currentUser, @JsonKey(name: "created_at")@Iso8601Converter()  DateTime createdAt, @JsonKey(name: "updated_at")@Iso8601Converter()  DateTime updatedAt,  String? message, @JsonKey(name: "deleted_at")@Iso8601Converter()  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageResponseItem() when $default != null:
return $default(_that.id,_that.currentUser,_that.createdAt,_that.updatedAt,_that.message,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: "current_user")  bool currentUser, @JsonKey(name: "created_at")@Iso8601Converter()  DateTime createdAt, @JsonKey(name: "updated_at")@Iso8601Converter()  DateTime updatedAt,  String? message, @JsonKey(name: "deleted_at")@Iso8601Converter()  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MessageResponseItem():
return $default(_that.id,_that.currentUser,_that.createdAt,_that.updatedAt,_that.message,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: "current_user")  bool currentUser, @JsonKey(name: "created_at")@Iso8601Converter()  DateTime createdAt, @JsonKey(name: "updated_at")@Iso8601Converter()  DateTime updatedAt,  String? message, @JsonKey(name: "deleted_at")@Iso8601Converter()  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageResponseItem() when $default != null:
return $default(_that.id,_that.currentUser,_that.createdAt,_that.updatedAt,_that.message,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageResponseItem implements MessageResponseItem {
  const _MessageResponseItem({required this.id, @JsonKey(name: "current_user") required this.currentUser, @JsonKey(name: "created_at")@Iso8601Converter() required this.createdAt, @JsonKey(name: "updated_at")@Iso8601Converter() required this.updatedAt, required this.message, @JsonKey(name: "deleted_at")@Iso8601Converter() required this.deletedAt});
  factory _MessageResponseItem.fromJson(Map<String, dynamic> json) => _$MessageResponseItemFromJson(json);

@override final  int id;
@override@JsonKey(name: "current_user") final  bool currentUser;
@override@JsonKey(name: "created_at")@Iso8601Converter() final  DateTime createdAt;
@override@JsonKey(name: "updated_at")@Iso8601Converter() final  DateTime updatedAt;
@override final  String? message;
@override@JsonKey(name: "deleted_at")@Iso8601Converter() final  DateTime? deletedAt;

/// Create a copy of MessageResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageResponseItemCopyWith<_MessageResponseItem> get copyWith => __$MessageResponseItemCopyWithImpl<_MessageResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.message, message) || other.message == message)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentUser,createdAt,updatedAt,message,deletedAt);

@override
String toString() {
  return 'MessageResponseItem(id: $id, currentUser: $currentUser, createdAt: $createdAt, updatedAt: $updatedAt, message: $message, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageResponseItemCopyWith<$Res> implements $MessageResponseItemCopyWith<$Res> {
  factory _$MessageResponseItemCopyWith(_MessageResponseItem value, $Res Function(_MessageResponseItem) _then) = __$MessageResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: "current_user") bool currentUser,@JsonKey(name: "created_at")@Iso8601Converter() DateTime createdAt,@JsonKey(name: "updated_at")@Iso8601Converter() DateTime updatedAt, String? message,@JsonKey(name: "deleted_at")@Iso8601Converter() DateTime? deletedAt
});




}
/// @nodoc
class __$MessageResponseItemCopyWithImpl<$Res>
    implements _$MessageResponseItemCopyWith<$Res> {
  __$MessageResponseItemCopyWithImpl(this._self, this._then);

  final _MessageResponseItem _self;
  final $Res Function(_MessageResponseItem) _then;

/// Create a copy of MessageResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? currentUser = null,Object? createdAt = null,Object? updatedAt = null,Object? message = freezed,Object? deletedAt = freezed,}) {
  return _then(_MessageResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MessageAddRequest {

 String get message;
/// Create a copy of MessageAddRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageAddRequestCopyWith<MessageAddRequest> get copyWith => _$MessageAddRequestCopyWithImpl<MessageAddRequest>(this as MessageAddRequest, _$identity);

  /// Serializes this MessageAddRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageAddRequest&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageAddRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageAddRequestCopyWith<$Res>  {
  factory $MessageAddRequestCopyWith(MessageAddRequest value, $Res Function(MessageAddRequest) _then) = _$MessageAddRequestCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MessageAddRequestCopyWithImpl<$Res>
    implements $MessageAddRequestCopyWith<$Res> {
  _$MessageAddRequestCopyWithImpl(this._self, this._then);

  final MessageAddRequest _self;
  final $Res Function(MessageAddRequest) _then;

/// Create a copy of MessageAddRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageAddRequest].
extension MessageAddRequestPatterns on MessageAddRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageAddRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageAddRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageAddRequest value)  $default,){
final _that = this;
switch (_that) {
case _MessageAddRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageAddRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MessageAddRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageAddRequest() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message)  $default,) {final _that = this;
switch (_that) {
case _MessageAddRequest():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message)?  $default,) {final _that = this;
switch (_that) {
case _MessageAddRequest() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageAddRequest implements MessageAddRequest {
  const _MessageAddRequest({required this.message});
  factory _MessageAddRequest.fromJson(Map<String, dynamic> json) => _$MessageAddRequestFromJson(json);

@override final  String message;

/// Create a copy of MessageAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageAddRequestCopyWith<_MessageAddRequest> get copyWith => __$MessageAddRequestCopyWithImpl<_MessageAddRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageAddRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageAddRequest&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageAddRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageAddRequestCopyWith<$Res> implements $MessageAddRequestCopyWith<$Res> {
  factory _$MessageAddRequestCopyWith(_MessageAddRequest value, $Res Function(_MessageAddRequest) _then) = __$MessageAddRequestCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$MessageAddRequestCopyWithImpl<$Res>
    implements _$MessageAddRequestCopyWith<$Res> {
  __$MessageAddRequestCopyWithImpl(this._self, this._then);

  final _MessageAddRequest _self;
  final $Res Function(_MessageAddRequest) _then;

/// Create a copy of MessageAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_MessageAddRequest(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
