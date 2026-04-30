import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalDetailCubit extends Cubit<MyRentalDetailState> {
  final RentalRepository _rentalRepository;
  StreamSubscription? _fcmSubscription;

  MyRentalDetailCubit({
    required int id,
    required RentalRepository rentalRepository,
  }) : _rentalRepository = rentalRepository,
       super(
         MyRentalDetailState(
           id: id,
           data: null,
           dataStatus: .initial,
           isActionLoading: false,
           error: null,
         ),
       ) {
    onRefresh();
    _fcmSubscription = FirebaseMessaging.onMessage.listen((event) {
      if (event.data["type"].toString().startsWith("rent_") &&
          int.tryParse(event.data["rent_id"]) == id) {
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

    emit(state.copyWith(dataStatus: .loading));

    final result = await _rentalRepository.getById(state.id);

    switch (result) {
      case ResultSuccess<RentalResponseItemDetails>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<RentalResponseItemDetails>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyRentalDetailError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyRentalDetailError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onApprove() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.approve(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionApprove,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onHandover() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.handover(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionHandover,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onConfirmReturn() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.confirmReturn(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionConfirmReturn,
              message: result.message,
            ),
          ),
        );
    }
  }
}
