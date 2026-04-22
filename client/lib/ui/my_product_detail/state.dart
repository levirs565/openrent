import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
class MyProductDetailState with _$MyProductDetailState {
  final int id;
  final bool isLoading;
  final ProductResponseItemDetail? data;
  final GeneralErrorData? error;

  MyProductDetailState({
    required this.data,
    this.error,
    required this.id,
    required this.isLoading,
  });
}
