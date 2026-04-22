import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/product_reviews/cubit.dart';
import 'package:openrent_client/ui/product_reviews/state.dart';

class ProductReviewsPage extends StatelessWidget {
  final int productId;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => ProductReviewsPage(productId: id));
  }

  const ProductReviewsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductReviewsCubit(
        productId: productId,
        reviewRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: Text("Reviews")),
          body: _ProductReviewsPageContent(),
        ),
      ),
    );
  }
}

class _ProductReviewsPageContent extends StatelessWidget {
  const _ProductReviewsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductReviewsCubit, ProductReviewsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () =>
                    context.read<ProductReviewsCubit>().onRefresh(),
              ),
            ),
          );
          context.read<ProductReviewsCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) =>
                  ReviewCard(item: state.list.elementAt(index)),
            ),
          ),
        ],
      ),
    );
  }
}
