import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class OrderRepository {
  Future<Result<List<OrderResponseItem>>> getAll();

  Future<Result<OrderResponseItemDetails>> getById(int id);

  Future<Result<void>> receive(int id);

  Future<Result<void>> requestReturn(int id);

  Stream<int> watchChanged();

  void dispose();
}

class OrderDataSource implements OrderRepository {
  final _updateController = StreamController<int>.broadcast();
  final OrderService _service;
  StreamSubscription<int>? _reviewSubscription;
  StreamSubscription? _fcmSubscription;

  OrderDataSource({
    required OrderService service,
    required Stream<int> reviewStream,
  }) : _service = service {
    _reviewSubscription = reviewStream.listen((event) {
      _updateController.add(event);
    });
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"].toString().startsWith("rent_")) {
        final id =  int.tryParse(event.data["rent_id"]);
        if (id != null) {
          _updateController.add(id);
        }
      }
    });
  }

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
      _updateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> requestReturn(int id) async {
    try {
      await _service.requestReturn(id);
      _updateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Stream<int> watchChanged() {
    return _updateController.stream;
  }

  @override
  void dispose() {
    _reviewSubscription?.cancel();
    _fcmSubscription?.cancel();
    _updateController.close();
  }
}
