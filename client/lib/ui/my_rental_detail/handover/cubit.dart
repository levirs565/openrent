import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';

import 'state.dart';

class MyRentalHandoverCubit extends Cubit<MyRentalHandoverState> {
  final RentalRepository _rentalRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;

  MyRentalHandoverCubit({
    required RentalResponseItemDetails rental,
    required RentalRepository rentalRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _rentalRepository = rentalRepository,
       super(
         MyRentalHandoverState(
           rental: rental,
           exchangeRate: null,
           exchangeRateStatus: .initial,
           selectedFromCurrency: "IDR",
           payment: null,
           isSubmitLoading: false,
           isFinished: false,
           error: null,
         ),
       ) {
    onRefreshExchangeRate();
  }

  void onRefreshExchangeRate() async {
    if (state.exchangeRateStatus == .loading) return;

    final result = await _exchangeRatesRepository.get();

    switch (result) {
      case ResultSuccess<ExchangeRateResponse>():
        emit(state.copyWith(exchangeRateStatus: .success, exchangeRate: result.data));
      case ResultError<ExchangeRateResponse>():
        emit(state.copyWith(
          exchangeRateStatus: .fail,
          error: .general(message: result.message)
        ));
    }
  }

  void onFromCurrencyChanged(String currency) {
    emit(state.copyWith(selectedFromCurrency: currency));
  }

  void onPaymentChanged(double? payment) {
    emit(state.copyWith(payment: payment));
  }

  void onFinishedHandled() {
    emit(state.copyWith(isFinished: false));
  }

  void onSubmit() async {
    if (!state.canSubmit) return;

    emit(state.copyWith(isSubmitLoading: true, error: null));

    final result = await _rentalRepository.handover(
      id: state.rental.id,
      payment: state.paymentIdr!,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isFinished: true));
      case ResultError<void>():
        emit(
          state.copyWith(
            isSubmitLoading: false,
            error: .general(message: result.message),
          ),
        );
    }
  }
}
