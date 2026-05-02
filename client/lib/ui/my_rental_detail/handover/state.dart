import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MyRentalHandoverState with _$MyRentalHandoverState {
  const MyRentalHandoverState._();

  const factory MyRentalHandoverState({
    required RentalResponseItemDetails rental,
    required DataStatus exchangeRateStatus,
    required ExchangeRateResponse? exchangeRate,
    required String selectedFromCurrency,
    required double? payment,
    required bool isSubmitLoading,
    required bool isFinished,
    required GeneralErrorData? error,
  }) = _MyRentalHandoverState;

  int? convertFromCurrency(double? amount) {
    if (amount == null || exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedFromCurrency)) {
      return null;
    }
    return (amount /
        exchangeRate!.conversionRates[selectedFromCurrency]!).round();
  }

  double? convertToCurrency(int? amount) {
    if (amount == null || exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedFromCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedFromCurrency]!);
  }

  bool get isLoading => exchangeRateStatus == .loading || isSubmitLoading;
  bool get canEdit => exchangeRateStatus == .success && !isSubmitLoading;

  int? get paymentIdr => convertFromCurrency(payment);

  bool get isValid => paymentIdr != null && paymentIdr! >= 0;

  bool get canSubmit => isValid && !isLoading;

  int get estimatedPriceIdr =>
      rental.product.pricePerDay *
          (rental.endDate
              .difference(rental.startDate)
              .inDays + 1);
  int get estimatedHalfPriceIdr => (estimatedPriceIdr / 2).round();

  double? get estimatedPrice => convertToCurrency(estimatedPriceIdr);
  double? get estimatedHalfPrice => convertToCurrency(estimatedHalfPriceIdr);
}
