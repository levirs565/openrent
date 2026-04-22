import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/address_form/state.dart';

class AddressFormCubit extends Cubit<AddressFormState> {
  final AddressRepository _addressRepository;

  AddressFormCubit({
    required AddressRepository addressRepository,
    required int? id,
  }) : _addressRepository = addressRepository,
       super(
         AddressFormState(
           id: id,
           position: LatLng(0, 0),
           province: "",
           regency: "",
           district: "",
           detail: "",
           name: "",
           submissionStatus: .idle,
           dataStatus: .initial,
           error: null,
         ),
       ) {
    if (id != null) {
      onRefresh();
    }
  }

  void onRefresh() async {
    if (state.id == null || state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _addressRepository.getById(state.id!);

    switch (result) {
      case ResultSuccess<AddressResponseItem>():
        emit(
          state.copyWith(
            province: result.data.province,
            regency: result.data.regency,
            district: result.data.district,
            detail: result.data.detail,
            name: result.data.name,
            position: LatLng(result.data.lat, result.data.lng),
            dataStatus: .success,
          ),
        );
      case ResultError<AddressResponseItem>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: AddressFormError(
              source: .loading,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onChangeLocation(
    LatLng position,
    ReverseGeocodingResult reverseGeocoding,
  ) {
    emit(
      state.copyWith(
        position: position,
        province: reverseGeocoding.province ?? "-",
        regency: reverseGeocoding.regency ?? "-",
      ),
    );
  }

  void onNameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void onProvinceChanged(String province) {
    emit(state.copyWith(province: province));
  }

  void onRegencyChanged(String regency) {
    emit(state.copyWith(regency: regency));
  }

  void onDistrictChanged(String district) {
    emit(state.copyWith(district: district));
  }

  void onDetailChanged(String detail) {
    emit(state.copyWith(detail: detail));
  }

  void onSubmit() async {
    if (state.isLoading) return;
    emit(state.copyWith(submissionStatus: .loading));
    final request = AddressAddRequest(
      name: state.name,
      province: state.province,
      regency: state.regency,
      district: state.district,
      detail: state.detail,
      lat: state.position.latitude,
      lng: state.position.longitude,
    );
    final result = state.id == null
        ? await _addressRepository.add(request)
        : await _addressRepository.update(state.id!, request);

    switch (result) {
      case ResultSuccess<AddressResponseItem>():
        emit(state.copyWith(submissionStatus: .finished));
      case ResultError<AddressResponseItem>():
        emit(
          state.copyWith(
            submissionStatus: .idle,
            error: AddressFormError(
              source: .submit,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onErrorHandled(AddressFormError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
