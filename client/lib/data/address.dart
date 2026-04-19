import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class AddressRepository {
  Future<Result<List<AddressResponseItem>>> getMine();
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
}
