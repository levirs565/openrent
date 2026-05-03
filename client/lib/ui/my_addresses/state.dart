import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyAddressesErrorSource { data, action }

typedef MyAddressesError = ErrorData<MyAddressesErrorSource>;

@freezed
abstract class MyAddressesState with _$MyAddressesState {
  const factory MyAddressesState({
    required DataStatus dataStatus,
    required bool isActionLoading,
    required List<AddressResponseItem> data,
    required MyAddressesError? error,
  }) = _MyAddressesState;

  const MyAddressesState._();

  bool get isLoading => dataStatus == .loading || isActionLoading;
}
