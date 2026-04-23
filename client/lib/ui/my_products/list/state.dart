import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
class MyProductListState with _$MyProductListState {
  final bool isLoading;
  final List<ProductResponseItemShort> data;
  final GeneralErrorData? error;

  MyProductListState({required this.isLoading, required this.data, this.error});
}