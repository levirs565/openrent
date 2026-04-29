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
mixin _$MessagesState {

 int get otherUserId; List<MessageResponseItem> get list; DataStatus get dataStatus; String get currentMessage; bool get isActionLoading; MessagesError? get error;
/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesStateCopyWith<MessagesState> get copyWith => _$MessagesStateCopyWithImpl<MessagesState>(this as MessagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesState&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.currentMessage, currentMessage) || other.currentMessage == currentMessage)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,otherUserId,const DeepCollectionEquality().hash(list),dataStatus,currentMessage,isActionLoading,error);

@override
String toString() {
  return 'MessagesState(otherUserId: $otherUserId, list: $list, dataStatus: $dataStatus, currentMessage: $currentMessage, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $MessagesStateCopyWith<$Res>  {
  factory $MessagesStateCopyWith(MessagesState value, $Res Function(MessagesState) _then) = _$MessagesStateCopyWithImpl;
@useResult
$Res call({
 int otherUserId, List<MessageResponseItem> list, DataStatus dataStatus, String currentMessage, bool isActionLoading, MessagesError? error
});


$ErrorDataCopyWith<MessagesErrorSource, $Res>? get error;

}
/// @nodoc
class _$MessagesStateCopyWithImpl<$Res>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._self, this._then);

  final MessagesState _self;
  final $Res Function(MessagesState) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otherUserId = null,Object? list = null,Object? dataStatus = null,Object? currentMessage = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as int,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<MessageResponseItem>,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,currentMessage: null == currentMessage ? _self.currentMessage : currentMessage // ignore: cast_nullable_to_non_nullable
as String,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MessagesError?,
  ));
}
/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MessagesErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MessagesErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessagesState].
extension MessagesStatePatterns on MessagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesState value)  $default,){
final _that = this;
switch (_that) {
case _MessagesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesState value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int otherUserId,  List<MessageResponseItem> list,  DataStatus dataStatus,  String currentMessage,  bool isActionLoading,  MessagesError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
return $default(_that.otherUserId,_that.list,_that.dataStatus,_that.currentMessage,_that.isActionLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int otherUserId,  List<MessageResponseItem> list,  DataStatus dataStatus,  String currentMessage,  bool isActionLoading,  MessagesError? error)  $default,) {final _that = this;
switch (_that) {
case _MessagesState():
return $default(_that.otherUserId,_that.list,_that.dataStatus,_that.currentMessage,_that.isActionLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int otherUserId,  List<MessageResponseItem> list,  DataStatus dataStatus,  String currentMessage,  bool isActionLoading,  MessagesError? error)?  $default,) {final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
return $default(_that.otherUserId,_that.list,_that.dataStatus,_that.currentMessage,_that.isActionLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MessagesState extends MessagesState {
  const _MessagesState({required this.otherUserId, required final  List<MessageResponseItem> list, required this.dataStatus, required this.currentMessage, required this.isActionLoading, required this.error}): _list = list,super._();
  

@override final  int otherUserId;
 final  List<MessageResponseItem> _list;
@override List<MessageResponseItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  DataStatus dataStatus;
@override final  String currentMessage;
@override final  bool isActionLoading;
@override final  MessagesError? error;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesStateCopyWith<_MessagesState> get copyWith => __$MessagesStateCopyWithImpl<_MessagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesState&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.currentMessage, currentMessage) || other.currentMessage == currentMessage)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,otherUserId,const DeepCollectionEquality().hash(_list),dataStatus,currentMessage,isActionLoading,error);

@override
String toString() {
  return 'MessagesState(otherUserId: $otherUserId, list: $list, dataStatus: $dataStatus, currentMessage: $currentMessage, isActionLoading: $isActionLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MessagesStateCopyWith<$Res> implements $MessagesStateCopyWith<$Res> {
  factory _$MessagesStateCopyWith(_MessagesState value, $Res Function(_MessagesState) _then) = __$MessagesStateCopyWithImpl;
@override @useResult
$Res call({
 int otherUserId, List<MessageResponseItem> list, DataStatus dataStatus, String currentMessage, bool isActionLoading, MessagesError? error
});


@override $ErrorDataCopyWith<MessagesErrorSource, $Res>? get error;

}
/// @nodoc
class __$MessagesStateCopyWithImpl<$Res>
    implements _$MessagesStateCopyWith<$Res> {
  __$MessagesStateCopyWithImpl(this._self, this._then);

  final _MessagesState _self;
  final $Res Function(_MessagesState) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otherUserId = null,Object? list = null,Object? dataStatus = null,Object? currentMessage = null,Object? isActionLoading = null,Object? error = freezed,}) {
  return _then(_MessagesState(
otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as int,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<MessageResponseItem>,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as DataStatus,currentMessage: null == currentMessage ? _self.currentMessage : currentMessage // ignore: cast_nullable_to_non_nullable
as String,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MessagesError?,
  ));
}

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<MessagesErrorSource, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<MessagesErrorSource, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
