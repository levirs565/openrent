import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/components/rental_status_label.dart';
import 'package:openrent_client/ui/my_rental_detail/page.dart';
import 'package:openrent_client/ui/product_form/page.dart';
import 'package:openrent_client/ui/product_reviews/page.dart';

import 'cubit.dart';
import 'state.dart';

class MyProductDetailPage extends StatelessWidget {
  final int id;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyProductDetailPage(id: id));
  }

  const MyProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductDetailCubit(
        id: id,
        productRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(child: _MyProductDetailPageContent()),
    );
  }
}

class _MyProductDetailPageContent extends StatelessWidget {
  const _MyProductDetailPageContent({super.key});

  String _formatAddress(MyProductAddress address) {
    return '${address.name} ${address.detail}, ${address.district}, ${address.regency}, ${address.province}';
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<MyProductDetailCubit, MyProductDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error?.source != .data
                  ? null
                  : SnackBarAction(
                      label: 'Refresh',
                      onPressed: () =>
                          context.read<MyProductDetailCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<MyProductDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        final product = state.data;
        return Scaffold(
          appBar: AppBar(title: Text(product?.name ?? 'Detail Produk')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 220,
                        color: theme.colorScheme.surfaceVariant,
                        child: product?.imageUrl != null
                            ? Image.network(
                                product!.imageUrl!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.photo,
                                color: theme.colorScheme.onSurfaceVariant,
                                size: 72,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: OutlinedButton.icon(
                          onPressed: state.isCanUpload
                              ? () async {
                                  final cubit = context
                                      .read<MyProductDetailCubit>();
                                  final picker = ImagePicker();
                                  final file = await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (file != null) {
                                    cubit.onUploadImage(file);
                                  }
                                }
                              : null,
                          icon: const Icon(Icons.upload_file),
                          label: Text(
                            state.isImageUpload
                                ? 'Mengunggah...'
                                : 'Upload Gambar',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    product?.name ?? 'Produk belum tersedia',
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ),
                                FilledButton.icon(
                                  onPressed: () => Navigator.of(
                                    context,
                                  ).push(ProductFormPage.routeEdit(state.id)),
                                  icon: const Icon(Icons.edit),
                                  label: const Text('Ubah'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              product != null
                                  ? 'Rp ${product.pricePerDay}/hari'
                                  : 'Harga tidak tersedia',
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                InfoChip(label: 'Stok ${product?.stock ?? 0}'),
                                InfoChip(
                                  label:
                                      'Denda Rp ${product?.lateFeePerDay ?? 0}/hr',
                                ),
                                InfoChip(
                                  label:
                                      product?.address.name ??
                                      'Alamat belum tersedia',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Produk',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        _DetailRow(
                          label: 'Alamat',
                          value: product != null
                              ? _formatAddress(product.address)
                              : '-',
                        ),
                        const SizedBox(height: 12),
                        _DetailRow(
                          label: 'Deskripsi',
                          value: product?.description ?? '-',
                        ),
                        const SizedBox(height: 12),
                        _DetailRow(
                          label: 'Tanggal dibuat',
                          value: product != null
                              ? DateFormat(
                                  'dd MMM yyyy',
                                ).format(product.createdAt)
                              : '-',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ulasan Teratas',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: product != null
                          ? () => Navigator.of(
                              context,
                            ).push(ProductReviewsPage.route(state.id))
                          : null,
                      child: const Text('Lihat Semua'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (product?.topReviews.isEmpty ?? true)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Belum ada ulasan untuk produk ini.',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  )
                else
                  Column(
                    children: product!.topReviews
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ReviewCard(item: item),
                          ),
                        )
                        .toList(),
                  ),
                const SizedBox(height: 24),
                Text('Riwayat Sewa', style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                if (product?.rents.isEmpty ?? true)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Belum ada riwayat sewa untuk produk ini.',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  )
                else
                  Column(
                    children: product!.rents
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _RentCard(
                              item: item,
                              formatDate: _formatDate,
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodySmall),
        const SizedBox(height: 6),
        Text(value, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}

class _RentCard extends StatelessWidget {
  final MyProductRentItem item;
  final String Function(DateTime) formatDate;

  const _RentCard({super.key, required this.item, required this.formatDate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () =>
            Navigator.of(context).push(MyRentalDetailPage.route(item.id)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.user.name, style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                '${formatDate(item.startDate)} • ${formatDate(item.endDate)}',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  InfoChip(label: rentalStatusLabel(item.state)),
                  InfoChip(label: 'Jumlah: ${item.quantity}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
