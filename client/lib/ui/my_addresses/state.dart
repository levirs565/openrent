import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyAddressesErrorSource { data, action }

enum MyAddressesDataStatus { loading, success, fail }

enum MyAddressesActionStatus { idle, performing }

typedef MyAddressesError = ErrorData<MyAddressesErrorSource>;

@freezed
class MyAddressesState with _$MyAddressesState {
  final MyAddressesDataStatus dataStatus;
  final MyAddressesActionStatus actionStatus;
  final List<AddressResponseItem> data;
  final MyAddressesError? error;

  MyAddressesState({
    required this.data,
    this.error,
    required this.dataStatus,
    required this.actionStatus,
  });

  bool get isLoading => dataStatus == .loading || actionStatus == .performing;
}
