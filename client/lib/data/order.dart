import 'dart:developer';

import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class OrderRepository {
  Future<Result<List<OrderResponseItem>>> getAll();
  Future<Result<OrderResponseItemDetails>> getById(int id);
  Future<Result<void>> receive(int id);
}

class OrderDataSource implements OrderRepository {
  final OrderService _service;

  OrderDataSource({required OrderService service}) : _service = service;

  @override
  Future<Result<List<OrderResponseItem>>> getAll() async {
    try {
      final result = await _service.list();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<OrderResponseItemDetails>> getById(int id) async {
    try {
      final result = await _service.getById(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> receive(int id) async {
    try {
      await _service.receive(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}