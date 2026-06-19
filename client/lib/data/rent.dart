import 'package:openrent_client/data/remote/rent.dart';
import 'package:openrent_client/data/resource.dart';

// TODO: Merge with OrderRepository
abstract interface class RentRepository {
  Future<Result<ProductRentResponse>> startRent({
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
  Future<Result<ProductRentResponse>> startRent({
    required int productId,
    required DateTime startDate,
    required DateTime endDate,
    required int quantity,
  }) async {
    try {
      final result = await _rentService.rent(productId, ProductRentRequest(startDate: startDate, endDate: endDate, quantity: quantity));
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
