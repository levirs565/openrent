import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class AddressRepository {
  Future<Result<List<AddressResponseItem>>> getMine();

  Future<Result<AddressResponseItem>> add(AddressAddRequest request);

  Future<Result<AddressResponseItem>> getById(int id);

  Future<Result<AddressResponseItem>> update(int id, AddressAddRequest request);
}

class AddressDataSource extends AddressRepository {
  final AddressService _addressService;

  AddressDataSource({required AddressService addressService})
    : _addressService = addressService;

  @override
  Future<Result<List<AddressResponseItem>>> getMine() async {
    try {
      final result = await _addressService.listAddress();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<AddressResponseItem>> add(AddressAddRequest request) async {
    try {
      final result = await _addressService.add(request);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<AddressResponseItem>> getById(int id) async {
    try {
      final result = await _addressService.getById(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<AddressResponseItem>> update(
    int id,
    AddressAddRequest request,
  ) async {
    try {
      final result = await _addressService.updateById(id, request);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
