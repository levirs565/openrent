import 'package:flutter/material.dart';
import 'package:openrent_client/data/remote/product.dart';

class ReviewCard extends StatelessWidget {
  final ProductReviewDetail item;

  const ReviewCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(item.user.name),
          Text("${item.rating} Star"),
          Text(item.content),
        ],
      ),
    );
  }
}
