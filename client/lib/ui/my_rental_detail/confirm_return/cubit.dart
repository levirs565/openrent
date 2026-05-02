import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class MyRentalConfirmReturnCubit extends Cubit<MyRentalConfirmReturnState> {
  final RentalRepository _rentalRepository;

  MyRentalConfirmReturnCubit({
    required RentalResponseItemDetails rental,
    required RentalRepository rentalRepository,
  }) : _rentalRepository = rentalRepository,
       super(
        MyRentalConfirmReturnState(
           rental: rental,
           payment: null,
           lateFinePayment: null,
           damageFinePayment: null,
           isLoading: false,
           isFinished: false,
           error: null,
         ),
       );

  void onPaymentChanged(int? payment) {
    emit(state.copyWith(payment: payment));
  }

  void onLateFinePaymentChanged(int? payment) {
    emit(state.copyWith(lateFinePayment: payment));
  }

  void onDamageFinePaymentChanged(int? payment) {
    emit(state.copyWith(damageFinePayment: payment));
  }

  void onFinishedHandled() {
    emit(state.copyWith(isFinished: false));
  }

  void onSubmit() async {
    if (!state.canSubmit) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _rentalRepository.confirmReturn(
      id: state.rental.id,
      finalPayment: state.payment!,
      lateFinePayment: state.lateFinePayment!,
      damageFinePayment: state.damageFinePayment!,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isFinished: true));
      case ResultError<void>():
        emit(
          state.copyWith(
            isLoading: false,
            error: GeneralErrorData.general(message: result.message),
          ),
        );
    }
  }
}
