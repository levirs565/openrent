import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class RentalRepository {
  Future<Result<List<RentalResponseItem>>> getAll();

  Future<Result<RentalResponseItemDetails>> getById(int id);

  Future<Result<void>> approve(int id);

  Future<Result<void>> reject({required int id, required String note});

  Future<Result<void>> handover(int id);
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

  @override
  Future<Result<RentalResponseItemDetails>> getById(int id) async {
    try {
      final result = await _rentalService.getById(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> approve(int id) async {
    try {
      await _rentalService.approve(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> reject({required int id, required String note}) async {
    try {
      await _rentalService.reject(id, RentalRejectRequest(note: note));
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> handover(int id) async {
    try {
      await _rentalService.handover(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
