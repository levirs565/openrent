import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalHandoverState with _$MyRentalHandoverState {
  const MyRentalHandoverState._();

  const factory MyRentalHandoverState({
    required RentalResponseItemDetails rental,
    required int? payment,
    required bool isLoading,
    required bool isFinished,
    required GeneralErrorData? error,
  }) = _MyRentalHandoverState;

  bool get isValid => payment != null && payment! >= 0;

  bool get canSubmit => isValid && !isLoading;

  int get estimatedPrice =>
      rental.product.pricePerDay *
      (rental.endDate.difference(rental.startDate).inDays + 1);
  int get estimatedHalfPrice => (estimatedPrice / 2).round();
}
