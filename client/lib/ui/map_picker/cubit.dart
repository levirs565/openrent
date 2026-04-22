import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class MapPickerCubit extends Cubit<MapPickerState> {
  final LocationRepository _locationRepository;
  CancelToken? _cancelToken;

  MapPickerCubit({
    required LocationRepository locationRepository,
    required LatLng? position,
  }) : _locationRepository = locationRepository,
       super(
         MapPickerState(
           selectedPosition: null,
           reverseGeocodingResult: null,
           isLoading: false,
         ),
       ) {
    if (position != null) {
      onSelectPosition(position);
    }
  }

  void onSelectPosition(LatLng position) async {
    emit(
      state.copyWith(
        selectedPosition: position,
        reverseGeocodingResult: null,
        isLoading: true,
      ),
    );

    _cancelToken?.cancel();
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;

    final result = await _locationRepository.reverseGeocoding(
      position: position,
      cancelToken: cancelToken,
    );
    if (cancelToken.isCancelled) return;
    switch (result) {
      case ResultSuccess<ReverseGeocodingResult>():
        emit(
          state.copyWith(reverseGeocodingResult: result.data, isLoading: false),
        );
      case ResultError<ReverseGeocodingResult>():
        emit(
          state.copyWith(
            isLoading: false,
            reverseGeocodingResult: null,
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

  void onRefresh() {
    if (state.isLoading) return;
    final position = state.selectedPosition;
    if (position != null) onSelectPosition(position);
  }
}
