import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum ProductFormErrorSource { dataProduct, dataAddress, submit }

typedef ProductFormError = ErrorData<ProductFormErrorSource>;

@freezed
class ProductFormState with _$ProductFormState {
  final int? id;
  final List<AddressResponseItem> addressList;
  final String name;
  final int? addressId;
  final int? pricePerDay;
  final int? lateFeePerDay;
  final int? stock;
  final String description;
  final DataStatus dataStatus;
  final DataStatus addressStatus;
  final ActionStatus submissionStatus;
  final ProductFormError? error;

  ProductFormState({
    required this.id,
    required this.addressList,
    required this.name,
    required this.addressId,
    required this.pricePerDay,
    required this.lateFeePerDay,
    required this.stock,
    required this.description,
    required this.dataStatus,
    required this.addressStatus,
    required this.submissionStatus,
    this.error,
  });

  bool get isLoading =>
      dataStatus == .loading ||
      addressStatus == .loading ||
      submissionStatus == .loading;

  bool get isValid =>
      name.isNotEmpty &&
      addressId != null &&
      pricePerDay != null &&
      lateFeePerDay != null &&
      stock != null &&
      description.isNotEmpty;

  bool get canEdit =>
      dataStatus == .success &&
      addressStatus == .success &&
      submissionStatus == .idle;

  bool get canSubmit =>
      isValid && canEdit;
}
