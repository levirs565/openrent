import 'package:hive_ce/hive.dart';

const boxName = "settings";

Future<Box> openSettingsBox() async {
  return await Hive.openBox(boxName);
}

Box getSettingsBox() {
  return Hive.box(boxName);
}


const needBiometricKey = "needBiometric";
const currencyKey = "currency";
const timeZoneKey = "timezone";