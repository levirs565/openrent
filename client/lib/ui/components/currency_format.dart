import 'package:intl/intl.dart';

String formatCurrencyAmount(num amount, String currency) {
  if (currency == 'IDR') {
    return NumberFormat.currency(
      locale: 'id_ID',
      name: 'IDR',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(amount);
  }

  return NumberFormat.currency(
    name: currency,
    symbol: '$currency ',
    decimalDigits: 2,
  ).format(amount);
}

String paymentLabel({
  required int amount,
  required String selectedCurrency,
  required double? Function(int) convertToCurrency,
}) {
  final localAmount = formatCurrencyAmount(amount, 'IDR');
  final currency = selectedCurrency.toUpperCase().trim();

  if (currency == 'IDR' || currency.isEmpty) {
    return localAmount;
  }

  final converted = convertToCurrency(amount);
  if (converted == null) {
    return localAmount;
  }

  final convertedLabel = formatCurrencyAmount(converted, currency);
  return '$localAmount • $convertedLabel';
}
