import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class RentalRepository {
  Future<Result<List<RentalResponseItem>>> getAll();
}

class RentalDataSource implements RentalRepository {
  final RentalService _rentalService;

  RentalDataSource({required RentalService rentalService})
    : _rentalService = rentalService;

  @override
  Future<Result<List<RentalResponseItem>>> getAll() async {
    try {
      final result = await _rentalService.list();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
