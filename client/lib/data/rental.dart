import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class RentalRepository {
  Future<Result<List<RentalResponseItem>>> getAll();

  Future<Result<RentalResponseItemDetails>> getById(int id);

  Future<Result<void>> approve(int id);

  Future<Result<void>> reject({required int id, required String note});

  Future<Result<void>> handover({required int id, required int payment});

  Future<Result<void>> confirmReturn({
    required int id,
    required int finalPayment,
    required int lateFinePayment,
    required int damageFinePayment,
  });

  Stream<int> watchChanged();

  void dispose();
}

class RentalDataSource implements RentalRepository {
  final _updateController = StreamController<int>.broadcast();
  final RentalService _rentalService;
  StreamSubscription? _fcmSubscription;

  RentalDataSource({required RentalService rentalService})
    : _rentalService = rentalService {
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"].toString().startsWith("rent_")) {
        final id = int.tryParse(event.data["rent_id"]);
        if (id != null) {
          _updateController.add(id);
        }
      }
    });
  }

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
      _updateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> reject({required int id, required String note}) async {
    try {
      await _rentalService.reject(id, RentalRejectRequest(note: note));
      _updateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> handover({required int id, required int payment}) async {
    try {
      await _rentalService.handover(
        id,
        RentalHandoverRequest(payment: payment),
      );
      _updateController.add(id);
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> confirmReturn({
    required int id,
    required int finalPayment,
    required int lateFinePayment,
    required int damageFinePayment,
  }) async {
    try {
      await _rentalService.confirmReturn(
        id,
        RentalConfirmRequest(
          finalPayment: finalPayment,
          lateFinePayment: lateFinePayment,
          damageFinePayment: damageFinePayment,
        ),
      );
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
    _fcmSubscription?.cancel();
    _updateController.close();
  }
}
