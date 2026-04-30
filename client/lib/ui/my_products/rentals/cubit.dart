import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class MyRentalsCubit extends Cubit<MyRentalsState> {
  final RentalRepository _rentalRepository;
  StreamSubscription? _fcmSubscription;

  MyRentalsCubit({required RentalRepository rentalRepository})
    : _rentalRepository = rentalRepository,
      super(MyRentalsState(list: List.empty(), isLoading: false, error: null)) {
    onRefresh();
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"].toString().startsWith("rent_")) {
        onRefresh();
      }
    });
  }

  @override
  Future<void> close() {
    _fcmSubscription?.cancel();
    return super.close();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _rentalRepository.getAll();

    switch (result) {
      case ResultSuccess<List<RentalResponseItem>>():
        emit(state.copyWith(isLoading: false, list: result.data));
      case ResultError<List<RentalResponseItem>>():
        emit(
          state.copyWith(
            isLoading: false,
            error: GeneralErrorData.general(message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
