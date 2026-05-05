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
mixin _$SuggestionState {

 String get suggestionText; bool get isLoading; bool get isSuccess; String? get errorMessage;
/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionStateCopyWith<SuggestionState> get copyWith => _$SuggestionStateCopyWithImpl<SuggestionState>(this as SuggestionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionState&&(identical(other.suggestionText, suggestionText) || other.suggestionText == suggestionText)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,suggestionText,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'SuggestionState(suggestionText: $suggestionText, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SuggestionStateCopyWith<$Res>  {
  factory $SuggestionStateCopyWith(SuggestionState value, $Res Function(SuggestionState) _then) = _$SuggestionStateCopyWithImpl;
@useResult
$Res call({
 String suggestionText, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._self, this._then);

  final SuggestionState _self;
  final $Res Function(SuggestionState) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestionText = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
suggestionText: null == suggestionText ? _self.suggestionText : suggestionText // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SuggestionState].
extension SuggestionStatePatterns on SuggestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestionState value)  $default,){
final _that = this;
switch (_that) {
case _SuggestionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestionState value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String suggestionText,  bool isLoading,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
return $default(_that.suggestionText,_that.isLoading,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String suggestionText,  bool isLoading,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SuggestionState():
return $default(_that.suggestionText,_that.isLoading,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String suggestionText,  bool isLoading,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
return $default(_that.suggestionText,_that.isLoading,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SuggestionState implements SuggestionState {
  const _SuggestionState({this.suggestionText = '', this.isLoading = false, this.isSuccess = false, this.errorMessage});
  

@override@JsonKey() final  String suggestionText;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionStateCopyWith<_SuggestionState> get copyWith => __$SuggestionStateCopyWithImpl<_SuggestionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionState&&(identical(other.suggestionText, suggestionText) || other.suggestionText == suggestionText)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,suggestionText,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'SuggestionState(suggestionText: $suggestionText, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SuggestionStateCopyWith<$Res> implements $SuggestionStateCopyWith<$Res> {
  factory _$SuggestionStateCopyWith(_SuggestionState value, $Res Function(_SuggestionState) _then) = __$SuggestionStateCopyWithImpl;
@override @useResult
$Res call({
 String suggestionText, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$SuggestionStateCopyWithImpl<$Res>
    implements _$SuggestionStateCopyWith<$Res> {
  __$SuggestionStateCopyWithImpl(this._self, this._then);

  final _SuggestionState _self;
  final $Res Function(_SuggestionState) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestionText = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_SuggestionState(
suggestionText: null == suggestionText ? _self.suggestionText : suggestionText // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
