import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum SearchErrorSource { data, exchangeRate }

typedef SearchError = ErrorData<SearchErrorSource>;

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  factory SearchState({
    required ExchangeRateResponse? exchangeRate,
    required String selectedCurrency,
    required DataStatus exchangeRateStatus,
    required List<ProductResponseItemShort> result,
    required bool isSearchLoading,
    required SearchError? error,
    required LatLng? currentPosition,
    required bool isMapView,
  }) = _SearchState;

  bool get isLoading => exchangeRateStatus == .loading || isSearchLoading;
  bool get canEdit => exchangeRateStatus == .success;

  double? convertToCurrency(int? amount) {
    if (amount == null || exchangeRate == null ||
        !exchangeRate!.conversionRates.containsKey(selectedCurrency)) {
      return null;
    }
    return (amount.toDouble() *
        exchangeRate!.conversionRates[selectedCurrency]!);
  }
}
