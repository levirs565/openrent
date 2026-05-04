import 'package:timezone/timezone.dart' as tz;

tz.TZDateTime normalizeStartDate(tz.Location timeZone, DateTime startDate) {
  return tz.TZDateTime(
    timeZone,
    startDate.year,
    startDate.month,
    startDate.day,
    (timeZone.currentTimeZone.offset.inHours - 7) % 24,
  );
}

tz.TZDateTime normalizeEndDate(tz.Location timeZone, DateTime endDate) {
  return normalizeStartDate(
    timeZone,
    endDate,
  ).add(Duration(days: 1)).subtract(Duration(microseconds: 1));
}
