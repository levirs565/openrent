import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

import 'state.dart';

class MyRentalsCubit extends Cubit<MyRentalsState> {
  final RentalRepository _rentalRepository;
  StreamSubscription? _fcmSubscription;

  MyRentalsCubit({
    required RentalRepository rentalRepository,
    required SettingsRepository settingsRepository,
  }) : _rentalRepository = rentalRepository,
       super(
         MyRentalsState(
           list: List.empty(),
           isLoading: false,
           error: null,
           timeZone: tz.getLocation(settingsRepository.getTimeZone()),
         ),
       ) {
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
        emit(
          state.copyWith(
            isLoading: false,
            list: result.data
                .map(
                  (element) => element.copyWith(
                    startDate: tz.TZDateTime.from(
                      element.startDate,
                      state.timeZone,
                    ),
                    endDate: tz.TZDateTime.from(
                      element.endDate,
                      state.timeZone,
                    ),
                  ),
                )
                .toList(),
          ),
        );
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
