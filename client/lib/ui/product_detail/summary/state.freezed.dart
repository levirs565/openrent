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
mixin _$ProductSummaryState {

 int get id; String? get summary; bool get isLoading; GeneralErrorData? get error;
/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSummaryStateCopyWith<ProductSummaryState> get copyWith => _$ProductSummaryStateCopyWithImpl<ProductSummaryState>(this as ProductSummaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSummaryState&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,summary,isLoading,error);

@override
String toString() {
  return 'ProductSummaryState(id: $id, summary: $summary, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductSummaryStateCopyWith<$Res>  {
  factory $ProductSummaryStateCopyWith(ProductSummaryState value, $Res Function(ProductSummaryState) _then) = _$ProductSummaryStateCopyWithImpl;
@useResult
$Res call({
 int id, String? summary, bool isLoading, GeneralErrorData? error
});


$ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class _$ProductSummaryStateCopyWithImpl<$Res>
    implements $ProductSummaryStateCopyWith<$Res> {
  _$ProductSummaryStateCopyWithImpl(this._self, this._then);

  final ProductSummaryState _self;
  final $Res Function(ProductSummaryState) _then;

/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? summary = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}
/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<void, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<void, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductSummaryState].
extension ProductSummaryStatePatterns on ProductSummaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSummaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSummaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSummaryState value)  $default,){
final _that = this;
switch (_that) {
case _ProductSummaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSummaryState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSummaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? summary,  bool isLoading,  GeneralErrorData? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSummaryState() when $default != null:
return $default(_that.id,_that.summary,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? summary,  bool isLoading,  GeneralErrorData? error)  $default,) {final _that = this;
switch (_that) {
case _ProductSummaryState():
return $default(_that.id,_that.summary,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? summary,  bool isLoading,  GeneralErrorData? error)?  $default,) {final _that = this;
switch (_that) {
case _ProductSummaryState() when $default != null:
return $default(_that.id,_that.summary,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProductSummaryState implements ProductSummaryState {
  const _ProductSummaryState({required this.id, required this.summary, required this.isLoading, required this.error});
  

@override final  int id;
@override final  String? summary;
@override final  bool isLoading;
@override final  GeneralErrorData? error;

/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSummaryStateCopyWith<_ProductSummaryState> get copyWith => __$ProductSummaryStateCopyWithImpl<_ProductSummaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSummaryState&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,summary,isLoading,error);

@override
String toString() {
  return 'ProductSummaryState(id: $id, summary: $summary, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProductSummaryStateCopyWith<$Res> implements $ProductSummaryStateCopyWith<$Res> {
  factory _$ProductSummaryStateCopyWith(_ProductSummaryState value, $Res Function(_ProductSummaryState) _then) = __$ProductSummaryStateCopyWithImpl;
@override @useResult
$Res call({
 int id, String? summary, bool isLoading, GeneralErrorData? error
});


@override $ErrorDataCopyWith<void, $Res>? get error;

}
/// @nodoc
class __$ProductSummaryStateCopyWithImpl<$Res>
    implements _$ProductSummaryStateCopyWith<$Res> {
  __$ProductSummaryStateCopyWithImpl(this._self, this._then);

  final _ProductSummaryState _self;
  final $Res Function(_ProductSummaryState) _then;

/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? summary = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ProductSummaryState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GeneralErrorData?,
  ));
}

/// Create a copy of ProductSummaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorDataCopyWith<void, $Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorDataCopyWith<void, $Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
