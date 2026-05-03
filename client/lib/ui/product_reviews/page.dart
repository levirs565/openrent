import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/product_reviews/cubit.dart';
import 'package:openrent_client/ui/product_reviews/state.dart';

class ProductReviewsPage extends StatelessWidget {
  final int productId;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(
      builder: (_) => ProductReviewsPage(productId: id),
    );
  }

  const ProductReviewsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductReviewsCubit(
        productId: productId,
        reviewRepository: context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Ulasan Produk")),
        body: const _ProductReviewsPageContent(),
      ),
    );
  }
}

class _ProductReviewsPageContent extends StatelessWidget {
  const _ProductReviewsPageContent();

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
      builder: (context, state) {
        if (state.isLoading && state.list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final totalReviews = state.list.length;
        final averageRating = totalReviews > 0
            ? state.list.map((r) => r.rating).reduce((a, b) => a + b) /
                  totalReviews
            : 0.0;

        final ratingCounts = <int, int>{5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
        for (var review in state.list) {
          ratingCounts.update(review.rating, (value) => value + 1);
        }

        return RefreshIndicator(
          onRefresh: context.read<ProductReviewsCubit>().onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildRatingSummary(
                    context,
                    averageRating,
                    totalReviews,
                    ratingCounts,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: ReviewCard(item: state.list[index]),
                  );
                }, childCount: state.list.length),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRatingSummary(
    BuildContext context,
    double averageRating,
    int totalReviews,
    Map<int, int> ratingCounts,
  ) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < averageRating.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  const Gap(4),
                  Text('$totalReviews ulasan', style: textTheme.bodyMedium),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              flex: 1,
              child: Column(
                children: List.generate(5, (index) {
                  final star = 5 - index;
                  final count = ratingCounts[star] ?? 0;
                  final percentage = totalReviews > 0
                      ? count / totalReviews
                      : 0.0;
                  return Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Gap(4),
                      Text('$star'),
                      const Gap(8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: percentage,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.amber,
                          ),
                        ),
                      ),
                      const Gap(8),
                      SizedBox(
                        width: 30,
                        child: Text(
                          count.toString(),
                          textAlign: TextAlign.end,
                          style: textTheme.bodySmall,
                        ),
                      ),
                    ],
                  );
                }).reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
