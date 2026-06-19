import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;
import 'package:openrent_client/rental_calculator.dart';

void main() {
  tzData.initializeTimeZones();

  group('Perhitungan Rental', () {
    late tz.Location locWib;
    late tz.Location locWita;
    late tz.Location locWit;
    late tz.Location locLondon;

    late RentalPriceFactors premiumAset;

    setUp(() {
      locWib = tz.getLocation('Asia/Jakarta'); // UTC+7
      locWita = tz.getLocation('Asia/Makassar'); // UTC+8
      locWit = tz.getLocation('Asia/Jayapura'); // UTC+9
      locLondon = tz.getLocation('Europe/London'); // UTC+0 atau UTC+1 (BST)

      premiumAset = const RentalPriceFactors(
        pricePerDay: 100000, // Rp 100.000,-
        lateFeePerDay:
        50000, // Rp 50.000,- (Total biaya keterlambatan/hari = 150.000)
      );
    });

    group("Normalisasi Tanggal Mulai", () {
      test(
        'TC-01: Normalisasi tanggal mulai di zona WIB harus tepat pukul 00:00 WIB pada hari yang sama pada zona waktu lokal',
            () {
          final input = tz.TZDateTime(locWib, 2026, 5, 23, 14, 30); // 14:30 WIB
          final hasil = DateTimeUtils.normalizeStartDate(locWib, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(23));
          expect(hasil.hour, equals(0));
          expect(hasil.minute, equals(0));
        },
      );

      test(
        'TC-02: Normalisasi tanggal mulai di zona WITA harus tepat pukul 01:00 WITA pada hari yang sama pada zona waktu lokal (00:00 WIB)',
            () {
          final input = tz.TZDateTime(
            locWita,
            2026,
            5,
            23,
            18,
            0,
          ); // 18:00 WITA
          final hasil = DateTimeUtils.normalizeStartDate(locWita, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(23));
          expect(hasil.hour, equals(1)); // 00:00 WIB = 01:00 WITA
          expect(hasil.minute, equals(0));
        },
      );

      test(
        'TC-03: Normalisasi tanggal mulai di zona WIT harus tepat pukul 02:00 WIT pada hari yang sama pada zona waktu lokal (00:00 WIB)',
            () {
          final input = tz.TZDateTime(locWit, 2026, 5, 23, 05, 12); // 05:12 WIT
          final hasil = DateTimeUtils.normalizeStartDate(locWit, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(23));
          expect(hasil.hour, equals(2)); // 00:00 WIB = 02:00 WIT
          expect(hasil.minute, equals(0));
        },
      );

      test(
        'TC-04: Normalisasi tanggal mulai di zona London harus menyesuaikan selisih waktu ke WIB (00:00 WIB)',
            () {
          final input = tz.TZDateTime(
            locLondon,
            2026,
            5,
            23,
            12,
            0,
          ); // Siang hari waktu London
          final hasil = DateTimeUtils.normalizeStartDate(locLondon, input);

          // Menguji koordinat waktu instan absolut yang dikembalikan haruslah jam 00:00 WIB
          final hasilDiWib = DateTimeUtils.toWib(hasil);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(23));
          expect(hasilDiWib.hour, equals(0));
          expect(hasilDiWib.minute, equals(0));
        },
      );
    });

    group("Normalisasi Tanggal Akhir", () {
      test(
        'TC-05: Normalisasi tanggal akhir di zona WIB harus tepat pukul 23:59 WIB pada hari yang sama pada zona waktu lokal',
            () {
          final input = tz.TZDateTime(locWib, 2026, 5, 23, 10, 0);
          final hasil = DateTimeUtils.normalizeEndDate(locWib, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(23));
          expect(hasil.hour, equals(23));
          expect(hasil.minute, equals(59));
        },
      );

      test(
        'TC-06: Normalisasi tanggal akhir di zona WITA harus tepat pukul 00:59 WITA pada hari berikutnya pada zona waktu lokal (23:59 WIB)',
            () {
          final input = tz.TZDateTime(locWita, 2026, 5, 23, 10, 0);
          final hasil = DateTimeUtils.normalizeEndDate(locWita, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(24));
          expect(hasil.hour, equals(0)); // 23:59 WIB = 00:59 WITA besok
          expect(hasil.minute, equals(59));
        },
      );

      test(
        'TC-07: Normalisasi tanggal akhir di zona WIT harus tepat pukul 01:59 WIT pada hari berikutnya pada zona waktu lokal (23:59 WIB)',
            () {
          final input = tz.TZDateTime(locWit, 2026, 5, 23, 11, 0);
          final hasil = DateTimeUtils.normalizeEndDate(locWit, input);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(24));
          expect(hasil.hour, equals(1)); // 23:59 WIB = 01:59 WIT besok
          expect(hasil.minute, equals(59));
        },
      );

      test(
        'TC-08: Normalisasi tanggal akhir di zona London harus tepat pukul 23:59 WIB',
            () {
          final input = tz.TZDateTime(locLondon, 2026, 5, 23, 20, 0);
          final hasil = DateTimeUtils.normalizeEndDate(locLondon, input);
          final hasilInWib = DateTimeUtils.toWib(hasil);
          expect(hasil.year, equals(2026));
          expect(hasil.month, equals(5));
          expect(hasil.day, equals(24));
          expect(hasilInWib.hour, equals(23));
          expect(hasilInWib.minute, equals(59));
        },
      );
    });

    group("Estimasi Harga Sewa Dasar", () {
      test(
        'TC-09: Estimasi harga sewa durasi 1 hari di zona WIB harus Rp 100.000',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            quantity: 1,
          );
          expect(order.estimatedPrice, equals(100000));
        },
      );

      test(
        'TC-10: Estimasi harga sewa durasi 5 hari di zona WITA harus Rp 500.000',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 24),
          );

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            quantity: 1,
          );
          expect(order.estimatedPrice, equals(500000)); // 100k * 5 hari
        },
      );

      test(
        'TC-11: Estimasi harga sewa durasi 14 hari di zona WIT harus Rp 1.400.000',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWit,
            tz.TZDateTime(locWit, 2026, 5, 1),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWit,
            tz.TZDateTime(locWit, 2026, 5, 14),
          );

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            quantity: 1,
          );
          expect(order.estimatedPrice, equals(1400000));
        },
      );

      test(
        'TC-12: Estimasi harga sewa durasi 3 hari di zona London harus Rp 300.000',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locLondon,
            tz.TZDateTime(locLondon, 2026, 5, 10),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locLondon,
            tz.TZDateTime(locLondon, 2026, 5, 12),
          );

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            quantity: 1,
          );
          expect(order.estimatedPrice, equals(300000));
        },
      );
    });

    group("Estimasi Denda Keterlambatan", () {
      test(
        'TC-13: Pengembalian tepat waktu di zona WIB denda harus Rp 0',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 22),
          );
          final returned = tz.TZDateTime(
            locWib,
            2026,
            5,
            22,
            15,
            0,
          ); // Dikembalikan jam 3 sore pada hari terakhir

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(order.estimatedLateFine, equals(0));
        },
      );

      test(
        'TC-14: Pengembalian tepat di menit-menit akhir deadline WIB denda harus Rp 0',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 22),
          );
          final returned = tz.TZDateTime(
            locWib,
            2026,
            5,
            22,
            23,
            55,
          ); // 5 menit sebelum batas WIB berakhir

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(order.estimatedLateFine, equals(0));
        },
      );

      test(
        'TC-15: Pengembalian terlambat 1 menit di zona WIB denda harus 1 hari (Rp 150.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 22),
          );
          final returned = tz.TZDateTime(
            locWib,
            2026,
            5,
            23,
            0,
            1,
          ); // Lewat 1 menit dari batas kalender WIB

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(
            order.estimatedLateFine,
            equals(150000),
          ); // 1 hari * (100k sewa + 50k penalti)
        },
      );

      test(
        'TC-16: Pengembalian terlambat 1 hari di zona WITA denda harus 1 hari (Rp 150.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 10),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 12),
          );
          // Batas akhir sewa adalah 12 Mei 23:59 WIB (00:59 WITA, 13 Mei)
          // Dikembalikan pada 13 Mei pukul 14:00 siang WITA (= 13:00 WIB) -> Terlambat 1 hari kalender WIB
          final returned = tz.TZDateTime(locWita, 2026, 5, 13, 14, 0);

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(order.estimatedLateFine, equals(150000));
        },
      );

      test(
        'TC-17: Pengembalian terlambat 3 hari di zona WIT denda harus 3 hari (Rp 450.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWit,
            tz.TZDateTime(locWit, 2026, 5, 10),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWit,
            tz.TZDateTime(locWit, 2026, 5, 12),
          );
          // Dikembalikan 15 Mei waktu WIT
          final returned = tz.TZDateTime(locWit, 2026, 5, 15, 10, 0);

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(order.estimatedLateFine, equals(450000)); // 3 hari * 150.000
        },
      );

      test(
        'TC-18: Pengembalian terlambat 2 hari di zona London denda harus 2 hari (Rp 300.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locLondon,
            tz.TZDateTime(locLondon, 2026, 5, 5),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locLondon,
            tz.TZDateTime(locLondon, 2026, 5, 7),
          );
          final returned = tz.TZDateTime(
            locLondon,
            2026,
            5,
            9,
            22,
            0,
          ); // Pengembalian tanggal 9 malam waktu London

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(order.estimatedLateFine, equals(300000)); // 2 hari * 150.000
        },
      );
    });

    group("Pengujian Total Harga", () {
      test(
        'TC-19: Total biaya transaksi sewa 4 hari di zona WITA tanpa denda (Rp 400.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 1),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWita,
            tz.TZDateTime(locWita, 2026, 5, 4),
          );
          final returned = tz.TZDateTime(
            locWita,
            2026,
            5,
            4,
            20,
            0,
          ); // Dikembalikan tepat waktu

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          expect(
            order.estimatedTotalPrice,
            equals(400000),
          ); // Hanya biaya sewa (100k * 4)
        },
      );

      test(
        'TC-20: Total biaya transaksi sewa 2 hari + denda 2 hari di zona WIB (Rp 500.000)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 1),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 2),
          );
          final returned = tz.TZDateTime(
            locWib,
            2026,
            5,
            4,
            11,
            0,
          ); // Terlambat 2 hari (tanggal 3 dan 4 Mei)

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          // Sewa: 2 hari * 100k = 200k. Denda: 2 hari * 150k = 300k. Total = 500k.
          expect(order.estimatedTotalPrice, equals(500000));
        },
      );

      test(
        'TC-21: Total biaya transaksi jika unit dikembalikan mendahului waktu pemesanan (Denda harus Rp 0)',
            () {
          final start = DateTimeUtils.normalizeStartDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 20),
          );
          final end = DateTimeUtils.normalizeEndDate(
            locWib,
            tz.TZDateTime(locWib, 2026, 5, 25),
          );
          final returned = tz.TZDateTime(
            locWib,
            2026,
            5,
            18,
          ); // Dikembalikan sebelum masa sewa dimulai (Kondisi anomali)

          final order = RentalCalculator(
            factors: premiumAset,
            startDate: start,
            endDate: end,
            returnedAt: returned,
            quantity: 1,
          );
          // Aturan matematika menggunakan fungsi batas bawah max(selisihHari, 0) harus mengembalikan denda Rp 0
          expect(order.estimatedLateFine, equals(0));
        },
      );
    });
  });
}
