import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool canUseBiometric,
    required bool isBiometricOn,
    required String currency,
    required DataStatus currencyStatus,
    required List<String> currencyList,
    required GeneralErrorData? error,
  }) = _SettingsState;
}