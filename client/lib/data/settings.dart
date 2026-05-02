import 'package:hive_ce/hive.dart';
import 'package:openrent_client/data/local/settings.dart';

abstract interface class SettingsRepository {
  bool getNeedBiometric();
  Future<void> setNeedBiometric(bool value);
  String getCurrency();
  Future<void> setCurrency(String currency);
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
}