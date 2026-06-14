import 'dart:math';
import 'package:flutter/material.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:timezone/timezone.dart' as tz;

class RentalPriceFactors {
  final int pricePerDay;
  final int lateFeePerDay;

  const RentalPriceFactors({
    required this.pricePerDay,
    required this.lateFeePerDay,
  });
}

class RentalCalculator {
  final RentalPriceFactors factors;
  final tz.TZDateTime startDate;
  final tz.TZDateTime endDate;
  final int quantity;
  final DateTime? returnedAt;

  const RentalCalculator({
    required this.factors,
    required this.startDate,
    required this.endDate,
    required this.quantity,
    this.returnedAt,
  });

  int get days => endDate.difference(startDate).inDays + 1;

  int get estimatedPrice => factors.pricePerDay * days * quantity;

  int get estimatedLateFine {
    final targetReturnDate = returnedAt ?? DateTime.now();
    final selisihHari = DateTimeUtils.toWibDate(
      targetReturnDate,
    ).difference(DateTimeUtils.toWibDate(endDate)).inDays;

    return ((factors.pricePerDay + factors.lateFeePerDay) *
            max(selisihHari, 0) *
            quantity)
        .toInt();
  }

  int get estimatedTotalPrice => estimatedPrice + estimatedLateFine;
}

extension ProductToCalculator on ProductResponseItemDetail {
  RentalPriceFactors get toPriceFactors => RentalPriceFactors(
    pricePerDay: pricePerDay,
    lateFeePerDay: lateFeePerDay,
  );

  RentalCalculator toCalculator({
    required tz.TZDateTime startDate,
    required tz.TZDateTime endDate,
    required int quantity,
  }) {
    return RentalCalculator(
      factors: toPriceFactors,
      startDate: startDate,
      endDate: endDate,
      quantity: quantity,
    );
  }
}

extension RentalToCalculator on RentalResponseItemDetails {
  RentalCalculator toCalculator() {
    return RentalCalculator(
      factors: RentalPriceFactors(
        pricePerDay: product.pricePerDay,
        lateFeePerDay: product.lateFeePerDay,
      ),
      startDate: DateTimeUtils.toWib(startDate),
      endDate: DateTimeUtils.toWib(endDate),
      quantity: quantity,
      returnedAt: returnedAt,
    );
  }
}

extension OrderToCalculator on OrderResponseItemDetails {
  RentalCalculator toCalculator() {
    return RentalCalculator(
      factors: RentalPriceFactors(
        pricePerDay: product.pricePerDay,
        lateFeePerDay: product.lateFeePerDay,
      ),
      startDate: DateTimeUtils.toWib(startDate),
      endDate: DateTimeUtils.toWib(endDate),
      quantity: quantity,
      returnedAt: returnedAt,
    );
  }
}

abstract class DateTimeUtils {
  static tz.Location get _wibLocation => tz.getLocation('Asia/Jakarta');

  static tz.TZDateTime normalizeStartDate(
    tz.Location timeZone,
    DateTime startDate,
  ) {
    int offsetHours = timeZone.currentTimeZone.offset.inHours;
    return tz.TZDateTime(
      timeZone,
      startDate.year,
      startDate.month,
      startDate.day,
      (offsetHours - 7) % 24,
    );
  }

  static tz.TZDateTime normalizeEndDate(
    tz.Location targetLocation,
    DateTime inputDate,
  ) {
    return normalizeStartDate(
      targetLocation,
      inputDate,
    ).add(const Duration(days: 1)).subtract(const Duration(microseconds: 1));
  }

  static tz.TZDateTime toWib(DateTime date) =>
      tz.TZDateTime.from(date, _wibLocation);

  static DateTime toWibDate(DateTime date) => DateUtils.dateOnly(toWib(date));
}
