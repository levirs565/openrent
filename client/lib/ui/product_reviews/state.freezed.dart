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
mixin _$ProductReviewsState {

 int get productId; List<ProductReviewDetail> get list; bool get isLoading; ErrorWithDateTime? get error;
/// Create a copy of ProductReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReviewsStateCopyWith<ProductReviewsState> get copyWith => _$ProductReviewsStateCopyWithImpl<ProductReviewsState>(this as ProductReviewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReviewsState&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,productId,const DeepCollectionEquality().hash(list),isLoading,error);

@override
String toString() {
  return 'ProductReviewsState(productId: $productId, list: $list, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductReviewsStateCopyWith<$Res>  {
  factory $ProductReviewsStateCopyWith(ProductReviewsState value, $Res Function(ProductReviewsState) _then) = _$ProductReviewsStateCopyWithImpl;
@useResult
$Res call({
 int productId, List<ProductReviewDetail> list, bool isLoading, ErrorWithDateTime? error
});




}
/// @nodoc
class _$ProductReviewsStateCopyWithImpl<$Res>
    implements $ProductReviewsStateCopyWith<$Res> {
  _$ProductReviewsStateCopyWithImpl(this._self, this._then);

  final ProductReviewsState _self;
  final $Res Function(ProductReviewsState) _then;

/// Create a copy of ProductReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? list = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(ProductReviewsState(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ProductReviewDetail>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorWithDateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductReviewsState].
extension ProductReviewsStatePatterns on ProductReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
