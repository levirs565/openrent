import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/product_reviews/page.dart';
import 'package:openrent_client/ui/rent_form/sheet.dart';

import 'cubit.dart';
import 'state.dart';

class ProductDetailPage extends StatelessWidget {
  final int id;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => ProductDetailPage(id: id));
  }

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
        id: id,
        productRepository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: const ScaffoldMessenger(child: _ProductDetailPageContent()),
    );
  }
}

class _ProductDetailPageContent extends StatelessWidget {
  const _ProductDetailPageContent();

  String _formatAddress(ProductAddress address) {
    return "${address.detail}, ${address.district}, ${address.regency}, ${address.province}";
  }

  String _formatPrice(int price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<ProductDetailCubit, ProductDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () {
                  final cubit = context.read<ProductDetailCubit>();
                  if (source == .data) {
                    cubit.onRefresh();
                  } else {
                    cubit.onRefreshExchangeRate();
                  }
                },
              ),
            ),
          );
          context.read<ProductDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        final product = state.data;

        return Scaffold(
          appBar: AppBar(title: Text(product?.name ?? "Detail Produk")),
          body: state.isLoading && product == null
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: context.read<ProductDetailCubit>().onRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product?.imageUrl != null)
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(16),
                              ),
                              child: Image.network(
                                product!.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                      child: Icon(Icons.broken_image),
                                    ),
                              ),
                            ),
                          ),
                        const Gap(16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product?.user.name ?? 'Pemilik',
                                style: textTheme.titleMedium,
                              ),
                              const Gap(4),
                              Text(
                                product?.name ?? 'Nama Produk',
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(16),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.sell_outlined,
                                        ),
                                        title: const Text('Harga Sewa'),
                                        subtitle: Text(
                                          '${_formatPrice(product?.pricePerDay ?? 0)} / hari',
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.price_check_outlined,
                                        ),
                                        title: const Text(
                                          'Denda Keterlambatan',
                                        ),
                                        subtitle: Text(
                                          '${_formatPrice(product?.lateFeePerDay ?? 0)} / hari',
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.inventory_2_outlined,
                                        ),
                                        title: const Text('Stok Total'),
                                        subtitle: Text(
                                          '${product?.stock ?? 0} unit',
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.location_on_outlined,
                                        ),
                                        title: const Text('Alamat'),
                                        subtitle: Text(
                                          product != null
                                              ? _formatAddress(product.address)
                                              : '-',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Gap(16),
                              Text('Deskripsi', style: textTheme.titleLarge),
                              const Gap(8),
                              Text(
                                product?.description ?? '-',
                                style: textTheme.bodyMedium,
                              ),
                              const Gap(24),
                              if (product?.topReviews.isNotEmpty ?? false) ...[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ulasan', style: textTheme.titleLarge),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                            ProductReviewsPage.route(state.id),
                                          ),
                                      child: const Text('Lihat Semua'),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                SizedBox(
                                  height: 150,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: product!.topReviews.length,
                                    separatorBuilder: (context, index) =>
                                        const Gap(8),
                                    itemBuilder: (context, index) {
                                      return ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 300,
                                        ),
                                        child: ReviewCard(
                                          item: product.topReviews[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Gap(24),
                              ],
                              if (product?.recommendations.isNotEmpty ??
                                  false) ...[
                                Text(
                                  'Rekomendasi Lainnya',
                                  style: textTheme.titleLarge,
                                ),
                                const Gap(8),
                                SizedBox(
                                  height: 240,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: product!.recommendations.length,
                                    separatorBuilder: (context, index) =>
                                        const Gap(8),
                                    itemBuilder: (context, index) {
                                      return ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 200,
                                        ),
                                        child: ProductCard(
                                          item: product.recommendations[index],
                                          currency: state.selectedCurrency,
                                          convertToCurrency:
                                              state.convertToCurrency,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Gap(24),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: product == null
              ? null
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        BlocBuilder<AuthBloc, AuthBlocState>(
                          builder: (context, authState) {
                            final user = authState.state;
                            if (user is AuthStateSuccess &&
                                user.user?.id != product.user.id) {
                              return Expanded(
                                flex: 1,
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.chat_bubble_outline),
                                  onPressed: () => Navigator.of(context).push(
                                    MessagesPage.route(
                                      otherUserId: product.user.id,
                                    ),
                                  ),
                                  label: const Text('Chat'),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        const Gap(8),
                        Expanded(
                          flex: 2,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.shopping_cart_outlined),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => BlocProvider.value(
                                  value: context.read<ProductDetailCubit>(),
                                  child: RentFormSheet(id: state.id),
                                ),
                              );
                            },
                            label: const Text('Sewa Sekarang'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
