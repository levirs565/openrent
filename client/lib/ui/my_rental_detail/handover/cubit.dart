import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class MyRentalHandoverCubit extends Cubit<MyRentalHandoverState> {
  final RentalRepository _rentalRepository;

  MyRentalHandoverCubit({
    required RentalResponseItemDetails rental,
    required RentalRepository rentalRepository,
  }) : _rentalRepository = rentalRepository,
       super(
        MyRentalHandoverState(
           rental: rental,
           payment: null,
           isLoading: false,
           isFinished: false,
           error: null,
         ),
       );

  void onPaymentChanged(int? payment) {
    emit(state.copyWith(payment: payment));
  }

  void onFinishedHandled() {
    emit(state.copyWith(isFinished: false));
  }

  void onSubmit() async {
    if (!state.canSubmit) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _rentalRepository.handover(
      id: state.rental.id,
      payment: state.payment!,
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
