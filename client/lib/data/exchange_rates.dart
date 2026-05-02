import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class ExchangeRatesRepository {
  Future<Result<ExchangeRateResponse>> get();
}

class ExchangeRatesDataSource implements ExchangeRatesRepository {
  final ExchangeRateService _exchangeRateService;

  ExchangeRatesDataSource({required ExchangeRateService exchangeRateService})
    : _exchangeRateService = exchangeRateService;

  @override
  Future<Result<ExchangeRateResponse>> get() async {
    try {
      final result = await _exchangeRateService.list();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
