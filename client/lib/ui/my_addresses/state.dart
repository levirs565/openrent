import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyAddressesErrorSource { data, action }

typedef MyAddressesError = ErrorData<MyAddressesErrorSource>;

@freezed
class MyAddressesState with _$MyAddressesState {
  final DataStatus dataStatus;
  final bool isActionLoading;
  final List<AddressResponseItem> data;
  final MyAddressesError? error;

  MyAddressesState({
    required this.data,
    required this.error,
    required this.dataStatus,
    required this.isActionLoading,
  });

  bool get isLoading => dataStatus == .loading || isActionLoading;
}
