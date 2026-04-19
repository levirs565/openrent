import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/address.dart';

import '../error_with_datetime.dart';

part 'state.freezed.dart';

@freezed
class MyAddressesState with _$MyAddressesState {
  final bool isLoading;
  final List<AddressResponseItem> data;
  final ErrorWithDateTime? error;

  MyAddressesState({required this.isLoading, required this.data, this.error});
}
