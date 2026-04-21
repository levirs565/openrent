import 'package:flutter/material.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/product/page.dart';

class ProductCard extends StatelessWidget {
  final ProductResponseItemShort item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () => Navigator.of(context).push(ProductPage.route(item.id)),
        child: Column(
          children: [
            Text(item.name),
            Text("${item.pricePerDay} Per Day - ${item.stock} Stock"),
            Text("${item.address.regency} - ${item.user.name}"),
          ],
        ),
      ),
    );
  }
}
