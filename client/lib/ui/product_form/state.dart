import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum ProductFormErrorSource { dataProduct, dataAddress, nearbyAddress, submit }

typedef ProductFormError = ErrorData<ProductFormErrorSource>;

@freezed
abstract class ProductFormState with _$ProductFormState {
  const ProductFormState._();

  const factory ProductFormState({
    required int? id,
    required List<AddressResponseItem> addressList,
    required String name,
    required int? addressId,
    required int? pricePerDay,
    required int? lateFeePerDay,
    required int? stock,
    required String description,
    required DataStatus dataStatus,
    required DataStatus addressStatus,
    required bool isNearbyAddressLoading,
    required ActionStatus submissionStatus,
    ProductFormError? error,
  }) = _ProductFormState;

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

  bool get canSubmit => isValid && canEdit && !isNearbyAddressLoading;
}
