import 'package:flutter/material.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/product_detail/page.dart';

class ProductCard extends StatelessWidget {
  final ProductResponseItemShort item;
  final double? Function(int? amount) convertToCurrency;
  final String currency;

  const ProductCard({
    super.key,
    required this.item,
    required this.convertToCurrency,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () =>
            Navigator.of(context).push(ProductDetailPage.route(item.id)),
        child: Column(
          children: [
            if (item.imageUrl != null)
              Image.network(item.imageUrl!, height: 96),
            Text(item.name),
            Text(
              "${item.pricePerDay} IDR Per Day or ${convertToCurrency(item.pricePerDay)} Per Day - ${item.stock} Stock",
            ),
            Text("${item.address.regency} - ${item.user.name}"),
          ],
        ),
      ),
    );
  }
}
