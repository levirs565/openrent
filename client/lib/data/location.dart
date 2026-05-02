import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/remote/locationiq.dart';
import 'package:openrent_client/data/resource.dart';

class ReverseGeocodingResult {
  final String? countryCode;
  final String? province;
  final String? regency;

  // final String? district;

  ReverseGeocodingResult({
    required this.countryCode,
    required this.province,
    required this.regency,
    // required this.district,
  });
}

abstract interface class LocationRepository {
  Future<Result<ReverseGeocodingResult>> reverseGeocoding({
    required LatLng position,
    CancelToken? cancelToken,
  });

  Future<Result<LatLng>> getCurrentLocation();
  Stream<Result<LatLng>> watchCurrentLocation();
}

class LocationDataSource implements LocationRepository {
  final LocationIQService _locationIQService;

  LocationDataSource({required LocationIQService locationIQService})
    : _locationIQService = locationIQService;

  @override
  Future<Result<ReverseGeocodingResult>> reverseGeocoding({
    required LatLng position,
    CancelToken? cancelToken,
  }) async {
    try {
      const key = String.fromEnvironment("LOCATIONIQ_KEY");
      final result = await _locationIQService.reverseGeocoding(
        key: key,
        lat: position.latitude,
        lon: position.longitude,
        language: "id",
        cancelToken: cancelToken,
      );
      final regency = result.address.city ?? result.address.county;
      // final district = result.address.city != null
      //     ? result.address.cityDistrict
      //     : result.address.village;
      return ResultSuccess(
        ReverseGeocodingResult(
          countryCode: result.address.countryCode,
          province: result.address.state,
          regency: regency,
          // district: district ?? result.address.cityDistrict ?? result.address.village,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          try {
            final error = LocationIQError.fromJson(e.response?.data!);
            return ResultError(error.error);
          } catch (_) {}
        }
        return ResultError(e.error.toString());
      }
      return ResultError(e.toString());
    }
  }

  Future<Result<void>> ensureLocationPermission() async {
    final enabled = await Geolocator.isLocationServiceEnabled();

    if (!enabled) {
      return ResultError("Location is disabled");
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final result = await Geolocator.requestPermission();
      if (result == LocationPermission.denied) {
        return ResultError("Location permission is denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return ResultError("Location permission is denied forever");
    }

    return ResultSuccess(null);
  }

  @override
  Future<Result<LatLng>> getCurrentLocation() async {
    final permissionResult = await ensureLocationPermission();
    if (permissionResult is ResultError) {
      return ResultError(permissionResult.message);
    }

    final position = await Geolocator.getCurrentPosition();
    return ResultSuccess(LatLng(position.latitude, position.longitude));
  }

  @override
  Stream<Result<LatLng>> watchCurrentLocation() async* {
    final permissionResult = await ensureLocationPermission();
    if (permissionResult is ResultError) {
      yield ResultError(permissionResult.message);
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    yield  ResultSuccess(LatLng(position.latitude, position.longitude));
    yield* Geolocator.getPositionStream(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100
    )).map(
      (element) => ResultSuccess(LatLng(element.latitude, element.longitude)),
    );
  }
}
