// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatResponseItem {

 int get id; String get name;@JsonKey(name: "last_message") MessageResponseItem get lastMessage;
/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatResponseItemCopyWith<ChatResponseItem> get copyWith => _$ChatResponseItemCopyWithImpl<ChatResponseItem>(this as ChatResponseItem, _$identity);

  /// Serializes this ChatResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastMessage);

@override
String toString() {
  return 'ChatResponseItem(id: $id, name: $name, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $ChatResponseItemCopyWith<$Res>  {
  factory $ChatResponseItemCopyWith(ChatResponseItem value, $Res Function(ChatResponseItem) _then) = _$ChatResponseItemCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: "last_message") MessageResponseItem lastMessage
});


$MessageResponseItemCopyWith<$Res> get lastMessage;

}
/// @nodoc
class _$ChatResponseItemCopyWithImpl<$Res>
    implements $ChatResponseItemCopyWith<$Res> {
  _$ChatResponseItemCopyWithImpl(this._self, this._then);

  final ChatResponseItem _self;
  final $Res Function(ChatResponseItem) _then;

/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? lastMessage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageResponseItem,
  ));
}
/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageResponseItemCopyWith<$Res> get lastMessage {
  
  return $MessageResponseItemCopyWith<$Res>(_self.lastMessage, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatResponseItem].
extension ChatResponseItemPatterns on ChatResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _ChatResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChatResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "last_message")  MessageResponseItem lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatResponseItem() when $default != null:
return $default(_that.id,_that.name,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: "last_message")  MessageResponseItem lastMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatResponseItem():
return $default(_that.id,_that.name,_that.lastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: "last_message")  MessageResponseItem lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatResponseItem() when $default != null:
return $default(_that.id,_that.name,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatResponseItem implements ChatResponseItem {
  const _ChatResponseItem({required this.id, required this.name, @JsonKey(name: "last_message") required this.lastMessage});
  factory _ChatResponseItem.fromJson(Map<String, dynamic> json) => _$ChatResponseItemFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: "last_message") final  MessageResponseItem lastMessage;

/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatResponseItemCopyWith<_ChatResponseItem> get copyWith => __$ChatResponseItemCopyWithImpl<_ChatResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastMessage);

@override
String toString() {
  return 'ChatResponseItem(id: $id, name: $name, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatResponseItemCopyWith<$Res> implements $ChatResponseItemCopyWith<$Res> {
  factory _$ChatResponseItemCopyWith(_ChatResponseItem value, $Res Function(_ChatResponseItem) _then) = __$ChatResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: "last_message") MessageResponseItem lastMessage
});


@override $MessageResponseItemCopyWith<$Res> get lastMessage;

}
/// @nodoc
class __$ChatResponseItemCopyWithImpl<$Res>
    implements _$ChatResponseItemCopyWith<$Res> {
  __$ChatResponseItemCopyWithImpl(this._self, this._then);

  final _ChatResponseItem _self;
  final $Res Function(_ChatResponseItem) _then;

/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? lastMessage = null,}) {
  return _then(_ChatResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageResponseItem,
  ));
}

/// Create a copy of ChatResponseItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageResponseItemCopyWith<$Res> get lastMessage {
  
  return $MessageResponseItemCopyWith<$Res>(_self.lastMessage, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
