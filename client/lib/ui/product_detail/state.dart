import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  final int id;
  final bool isLoading;
  final ProductResponseItemDetail? data;
  final GeneralErrorData? error;

  ProductDetailState({
    required this.data,
    this.error,
    required this.id,
    required this.isLoading,
  });
}
