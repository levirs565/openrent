import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/biometrics/biometric_mobile.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;
  final ExchangeRatesRepository _exchangeRatesRepository;

  SettingsCubit({
    required SettingsRepository settingsRepository,
    required ExchangeRatesRepository exchangeRatesRepository,
  }) : _exchangeRatesRepository = exchangeRatesRepository,
       _settingsRepository = settingsRepository,
       super(
         SettingsState(
           canUseBiometric: false,
           isBiometricOn: settingsRepository.getNeedBiometric(),
           currency: settingsRepository.getCurrency(),
           currencyStatus: .initial,
           currencyList: List.empty(),
           timeZone: settingsRepository.getTimeZone(),
           timeZoneList: {
             "Etc/UTC": "GMT",
             "Asia/Jakarta": "WIB",
             "Asia/Makassar": "WITA",
             "Asia/Jayapura": "WIT",
             "Australia/Brisbane": "AEST"
           },
           error: null,
         ),
       ) {
    isBiometricSupported().then(
      (value) => {emit(state.copyWith(canUseBiometric: value))},
    );
    onRefreshExchangeRate();
  }

  void onCurrencyChanged(String currency) async {
    await _settingsRepository.setCurrency(currency);
    emit(state.copyWith(currency: currency));
  }

  void onTimeZoneChanged(String timeZone) async {
    await _settingsRepository.setTimeZone(timeZone);
    emit(state.copyWith(timeZone: timeZone));
  }

  void onRefreshExchangeRate() async {
    if (state.currencyStatus == .loading) return;

    final result = await _exchangeRatesRepository.get();

    switch (result) {
      case ResultSuccess<ExchangeRateResponse>():
        emit(
          state.copyWith(
            currencyStatus: .success,
            currencyList: result.data.conversionRates.keys.toList(),
          ),
        );
      case ResultError<ExchangeRateResponse>():
        emit(
          state.copyWith(
            currencyStatus: .fail,
            error: .general(message: result.message),
          ),
        );
    }
  }

  void onToggleBiometrics() async {
    if (!state.canUseBiometric) return;
    final nextValue = !state.isBiometricOn;
    if (!nextValue) {
      try {
        final biometricResult = await biometricAuthenticate(
          reason: "Authenticate to disable biometric",
        );
        if (!biometricResult) {
          emit(
            state.copyWith(error: .general(message: "Authentication failed")),
          );
          return;
        }
      } catch (e) {
        emit(
          state.copyWith(error: .general(message: "Authentication failed: $e")),
        );
        return;
      }
    }
    _settingsRepository.setNeedBiometric(nextValue);
    emit(state.copyWith(isBiometricOn: nextValue));
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
