import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

enum AddressFormErrorSource { loading, submit }

class AddressFormError {
  final AddressFormErrorSource source;
  final ErrorWithDateTime error;

  AddressFormError({required this.source, required this.error});
}

enum AddressFormDataStatus { loading, success, fail }

enum AddressFormSubmissionStatus { idle, submitting, finished }

@freezed
class AddressFormState with _$AddressFormState {
  final int? id;
  final LatLng position;
  final String province;
  final String regency;
  final String district;
  final String detail;
  final String name;
  final AddressFormError? error;
  final AddressFormDataStatus dataStatus;
  final AddressFormSubmissionStatus submissionStatus;

  AddressFormState({
    required this.id,
    required this.position,
    required this.province,
    required this.regency,
    required this.district,
    required this.detail,
    required this.name,
    required this.submissionStatus,
    required this.error,
    required this.dataStatus,
  });

  bool get isValid =>
      province.isNotEmpty &&
      regency.isNotEmpty &&
      district.isNotEmpty &&
      detail.isNotEmpty &&
      name.isNotEmpty;

  bool get canEdit => dataStatus == .success;

  bool get isLoading =>
      dataStatus == .loading || submissionStatus == .submitting;

  bool get canSubmit =>
      isValid && submissionStatus == .idle && dataStatus == .success;
}
