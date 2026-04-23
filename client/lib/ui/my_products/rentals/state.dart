import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalsState with _$MyRentalsState {
  const factory MyRentalsState({
    required List<RentalResponseItem> list,
    required bool isLoading,
    required GeneralErrorData? error,
  }) = _MyRentalsState;
}
