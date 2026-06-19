import 'package:flutter/material.dart';
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

tz.TZDateTime toWib(DateTime date) =>
    tz.TZDateTime.from(date, tz.getLocation('Asia/Jakarta'));


DateTime toWibDate(DateTime date) => DateUtils.dateOnly(toWib(date));