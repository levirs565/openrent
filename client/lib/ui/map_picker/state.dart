import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
class MapPickerState with _$MapPickerState {
  final LatLng? selectedPosition;
  final ReverseGeocodingResult? reverseGeocodingResult;
  final bool isLoading;
  final GeneralErrorData? error;

  MapPickerState({
    required this.selectedPosition,
    required this.reverseGeocodingResult,
    this.error,
    required this.isLoading,
  });

  bool get isValid => reverseGeocodingResult?.countryCode == "id";
}
