import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  final List<ProductResponseItemShort> result;
  final bool isLoading;
  final ErrorWithDateTime? error;

  SearchState({required this.result, required this.isLoading, this.error});
}