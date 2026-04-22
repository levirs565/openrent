import 'package:openrent_client/data/remote/rent.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class RentRepository {
  Future<Result<void>> startRent({
    required int productId,
    required DateTime startDate,
    required DateTime endDate,
    required int quantity,
  });
}

class RentDataSource extends RentRepository {
  final RentService _rentService;

  RentDataSource({required RentService rentService})
    : _rentService = rentService;

  @override
  Future<Result<void>> startRent({
    required int productId,
    required DateTime startDate,
    required DateTime endDate,
    required int quantity,
  }) async {
    try {
      await _rentService.rent(productId, ProductRentRequest(startDate: startDate, endDate: endDate, quantity: quantity));
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
