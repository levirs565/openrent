import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum ProductDetailErrorSource { data, exchangeRate }

typedef ProductDetailError = ErrorData<ProductDetailErrorSource>;

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();

  const factory ProductDetailState({
    required int id,
    required ExchangeRateResponse? exchangeRate,
    required String selectedCurrency,
    required DataStatus exchangeRateStatus,
    required ProductResponseItemDetail? data,
    required DataStatus dataStatus,
    required ProductDetailError? error,
  }) = _ProductDetailState;

  bool get isLoading =>
      dataStatus == .loading ||
          exchangeRateStatus == .loading;

  double? convertToCurrency(int? amount) {
    if (amount == null || exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedCurrency]!);
  }
}
