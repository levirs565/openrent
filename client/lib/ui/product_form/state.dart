import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';

part 'state.freezed.dart';

enum ProductFormDataStatus { loading, success, fail }

enum ProductFormSubmissionStatus { idle, submitting, finished }

enum ProductFormErrorSource { dataAddress, submit }

@freezed
class ProductFormError with _$ProductFormError {
  final ProductFormErrorSource source;
  final ErrorWithDateTime error;

  ProductFormError({required this.source, required this.error});
}

@freezed
class ProductFormState with _$ProductFormState {
  final List<AddressResponseItem> addressList;
  final String name;
  final int? addressId;
  final int? pricePerDay;
  final int? lateFeePerDay;
  final int? stock;
  final String description;
  final ProductFormDataStatus dataStatus;
  final ProductFormSubmissionStatus submissionStatus;
  final ProductFormError? error;

  ProductFormState({
    required this.addressList,
    required this.name,
    required this.addressId,
    required this.pricePerDay,
    required this.lateFeePerDay,
    required this.stock,
    required this.description,
    required this.dataStatus,
    required this.submissionStatus,
    this.error,
  });

  bool get isLoading =>
      dataStatus == .loading || submissionStatus == .submitting;

  bool get isValid =>
      name.isNotEmpty &&
      addressId != null &&
      pricePerDay != null &&
      lateFeePerDay != null &&
      stock != null &&
      description.isNotEmpty;

  bool get canEdit => dataStatus == .success && submissionStatus == .idle;

  bool get canSubmit =>
      isValid && submissionStatus == .idle && dataStatus == .success;

  bool getCanSubmit() =>
      isValid && submissionStatus == .idle && dataStatus == .success;
}
