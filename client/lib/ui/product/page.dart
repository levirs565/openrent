import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/product/cubit.dart';
import 'package:openrent_client/ui/product/state.dart';
import 'package:openrent_client/ui/product_reviews/page.dart';

/* TODO Rent dynamic stock chat */

class ProductPage extends StatelessWidget {
  final int id;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => ProductPage(id: id));
  }

  const ProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(id: id, productRepository: context.read()),
      child: ScaffoldMessenger(child: _ProductPageContent()),
    );
  }
}

class _ProductPageContent extends StatelessWidget {
  static String formatAddress(ProductAddress address) {
    return "${address.detail}, ${address.district}, ${address.regency}, ${address.province}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<ProductCubit>().onRefresh(),
              ),
            ),
          );
          context.read<ProductCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text(state.data?.name ?? "")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (state.isLoading) LinearProgressIndicator(),
              Text("Price: ${state.data?.pricePerDay ?? "-"} per day"),
              Text("Late: ${state.data?.lateFeePerDay ?? "-"} per day"),
              Text(
                "Address: ${state.data != null ? formatAddress(state.data!.address) : "-"}",
              ),
              Text("Stock ${state.data?.stock ?? "-"}"),
              Text("User ${state.data?.user.name}"),
              Text("Descrption:"),
              Text(state.data?.description ?? "-"),
              Text("Reccomendation"),
              ...(state.data?.recommendations
                      .map((item) => _ProductRecommendationItem(item: item))
                      .toList() ??
                  List.empty()),
              Text("Reviews"),
              ...(state.data?.topReviews
                      .map((item) => _ProductReviewItem(item: item))
                      .toList() ??
                  List.empty()),
              OutlinedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(ProductReviewsPage.route(state.id)),
                child: Text("See More Reviews"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: Copy from Search, refactor
class _ProductRecommendationItem extends StatelessWidget {
  final ProductResponseItemShort item;

  const _ProductRecommendationItem({super.key, required this.item});

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

class _ProductReviewItem extends StatelessWidget {
  final ProductReviewDetail item;

  const _ProductReviewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.user.name),
        Text("${item.rating} Start"),
        Text(item.content),
      ],
    );
  }
}
