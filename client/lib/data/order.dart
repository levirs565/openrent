import 'dart:developer';

import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class OrderRepository {
  Future<Result<List<OrderResponseItem>>> getAll();
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
}