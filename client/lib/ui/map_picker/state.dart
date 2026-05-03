import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class MapPickerState with _$MapPickerState {
  const MapPickerState._();

  const factory MapPickerState({
    required LatLng? initialPosition,
    required LatLng? selectedPosition,
    required bool isUseCurrentPositionLoading,
    required ReverseGeocodingResult? reverseGeocodingResult,
    required bool isLoading,
    GeneralErrorData? error,
  }) = _MapPickerState;

  bool get isValid => reverseGeocodingResult?.countryCode == "id";
}
