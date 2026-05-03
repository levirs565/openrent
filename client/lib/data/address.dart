import 'dart:async';

import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class AddressRepository {
  Future<Result<List<AddressResponseItem>>> getMine();

  Future<Result<AddressResponseItem>> add(AddressAddRequest request);

  Future<Result<AddressResponseItem>> getById(int id);

  Future<Result<AddressResponseItem>> update(int id, AddressAddRequest request);

  Future<Result<void>> delete(int id);

  Stream<void> watchChanged();

  void dispose();
}

class AddressDataSource extends AddressRepository {
  final AddressService _addressService;
  final _controller = StreamController<void>.broadcast();

  AddressDataSource({required AddressService addressService})
    : _addressService = addressService;

  @override
  void dispose() {
    _controller.close();
  }

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
      _controller.add(null);
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
      _controller.add(null);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    try {
      await _addressService.deleteById(id);
      _controller.add(null);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Stream<void> watchChanged() {
    return _controller.stream;
  }
}
