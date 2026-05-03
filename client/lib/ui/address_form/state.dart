import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum AddressFormErrorSource { loading, submit }

typedef AddressFormError = ErrorData<AddressFormErrorSource>;

@freezed
abstract class AddressFormState with _$AddressFormState {
  const AddressFormState._();

  const factory AddressFormState({
    required int? id,
    required LatLng position,
    required String province,
    required String regency,
    required String district,
    required String detail,
    required String name,
    required AddressFormError? error,
    required DataStatus dataStatus,
    required ActionStatus submissionStatus,
  }) = _AddressFormState;

  bool get isValid =>
      province.isNotEmpty &&
      regency.isNotEmpty &&
      district.isNotEmpty &&
      detail.isNotEmpty &&
      name.isNotEmpty;

  bool get canEdit => dataStatus == .success && submissionStatus == .idle;

  bool get isLoading =>
      dataStatus == .loading || submissionStatus == .loading;

  bool get canSubmit =>
      isValid && submissionStatus == .idle && dataStatus == .success;
}
