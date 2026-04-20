import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';

import '../error_with_datetime.dart';

part 'state.freezed.dart';

enum MyAddressesErrorSource { data, action }

enum MyAddressesDataStatus { loading, success, fail }

enum MyAddressesActionStatus { idle, performing }

@freezed
class MyAddressesError with _$MyAddressesError {
  final MyAddressesErrorSource source;
  final ErrorWithDateTime error;

  MyAddressesError({required this.source, required this.error});
}

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
