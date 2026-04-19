import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

@freezed
class MyProductsState with _$MyProductsState {
  final bool isLoading;
  final List<ProductResponseItemShort> data;
  final ErrorWithDateTime? error;

  MyProductsState({required this.isLoading, required this.data, this.error});
}