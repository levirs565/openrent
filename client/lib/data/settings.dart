import 'package:hive_ce/hive.dart';
import 'package:openrent_client/data/local/settings.dart';

abstract interface class SettingsRepository {
  bool getNeedBiometric();
  Future<void> setNeedBiometric(bool value);
  String getCurrency();
  Future<void> setCurrency(String currency);
  String getTimeZone();
  Future<void> setTimeZone(String timeZone);
}

class SettingsDataSource extends SettingsRepository {
  final Box _box;

  SettingsDataSource() : _box = getSettingsBox();

  @override
  bool getNeedBiometric() {
    return _box.get(needBiometricKey, defaultValue: false);
  }

  @override
  Future<void> setNeedBiometric(bool value) {
    return _box.put(needBiometricKey, value);
  }

  @override
  String getCurrency() {
    return _box.get(currencyKey, defaultValue: "IDR");
  }

  @override
  Future<void> setCurrency(String currency) {
    return _box.put(currencyKey, currency);
  }
  
  @override
  String getTimeZone() {
    return _box.get(timeZoneKey, defaultValue: "Asia/Jakarta");
  }

  @override
  Future<void> setTimeZone(String timeZone) {
    return _box.put(timeZoneKey, timeZone);
  }
}