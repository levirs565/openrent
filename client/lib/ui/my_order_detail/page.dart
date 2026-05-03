import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/currency_format.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/components/rental_status_label.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/my_order_detail/remove_review/dialog.dart';
import 'package:openrent_client/ui/product_detail/page.dart';
import 'package:openrent_client/ui/review_form/page.dart';

import 'cubit.dart';
import 'state.dart';

class MyOrderDetailPage extends StatelessWidget {
  final int id;

  const MyOrderDetailPage({super.key, required this.id});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyOrderDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderDetailCubit(
        id: id,
        orderRepository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: const Text("Detail Pesanan")),
          body: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);

  String _formatAddress(RentalProductAddressDetails address) {
    return '${address.detail}, ${address.district}, ${address.regency}, ${address.province}';
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrderDetailCubit, MyOrderDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: source == .data || source == .exchangeRate
                  ? SnackBarAction(
                      label: "Refresh",
                      onPressed: () {
                        final cubit = context.read<MyOrderDetailCubit>();
                        if (source == .data) {
                          cubit.onRefresh();
                        } else {
                          cubit.onRefreshExchangeRate();
                        }
                      },
                    )
                  : null,
            ),
          );
          context.read<MyOrderDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        final order = state.data;
        final product = order?.product;
        final owner = order?.user;

        if (state.isLoading && order == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (order == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Order not found.'),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () =>
                      context.read<MyOrderDetailCubit>().onRefresh(),
                  child: const Text('Refresh'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.isLoading) const LinearProgressIndicator(),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      child: Container(
                        height: 220,
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        child: product?.imageUrl != null
                            ? Image.network(
                                product!.imageUrl!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.photo,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                size: 72,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product?.name ?? 'Produk tidak tersedia',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                              ),
                              FilledButton.icon(
                                onPressed: product == null
                                    ? null
                                    : () => Navigator.of(context).push(
                                        ProductDetailPage.route(product.id),
                                      ),
                                icon: const Icon(Icons.info_outline),
                                label: const Text('Detail'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (product != null)
                                InfoChip(
                                  label:
                                      '${formatCurrencyAmount(product.pricePerDay, 'IDR')}/hari',
                                ),
                              if (product != null)
                                InfoChip(
                                  label:
                                      'Denda ${formatCurrencyAmount(product.lateFeePerDay, 'IDR')}/hr',
                                ),
                              if (product != null)
                                InfoChip(
                                  label: _formatAddress(product.address),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _sectionTitle(context, 'Pemilik'),
                      Text(
                        owner?.name ?? '-',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: owner == null
                            ? null
                            : () => Navigator.of(
                                context,
                              ).push(MessagesPage.route(otherUserId: owner.id)),
                        icon: const Icon(Icons.message),
                        label: const Text('Chat'),
                      ),
                    ],
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _sectionTitle(context, 'Rincian Rental'),
                      InfoChip(label: rentalStatusLabel(order.state)),
                      const SizedBox(height: 16),
                      _DetailLine(
                        label: 'Tanggal sewa',
                        value:
                            '${_formatDate(order.startDate)} - ${_formatDate(order.endDate)}',
                      ),
                      const SizedBox(height: 12),
                      _DetailLine(
                        label: 'Jumlah',
                        value: order.quantity.toString(),
                      ),
                      if (order.cancellation != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Alasan batal',
                          value:
                              toBeginningOfSentenceCase(
                                order.cancellation!.reason.name.replaceAll(
                                  '_',
                                  ' ',
                                ),
                              ) ??
                              order.cancellation!.reason.name,
                        ),
                        const SizedBox(height: 8),
                        _DetailLine(
                          label: 'Catatan batal',
                          value: order.cancellation!.note,
                        ),
                      ],
                    ],
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _sectionTitle(context, 'Pembayaran'),
                      _DetailLine(
                        label: 'Estimasi harga',
                        value: paymentLabel(
                          amount: state.estimatedPrice,
                          selectedCurrency: state.selectedCurrency,
                          convertToCurrency: state.convertToCurrency,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _DetailLine(
                        label: 'Estimasi denda',
                        value: paymentLabel(
                          amount: state.estimatedLateFine,
                          selectedCurrency: state.selectedCurrency,
                          convertToCurrency: state.convertToCurrency,
                        ),
                      ),
                      if (order.payment.initial != null &&
                          order.payment.finalAmount == null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Estimasi total',
                          value: paymentLabel(
                            amount: state.estimatedTotalPrice,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                      if (order.payment.initial != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Pembayaran awal',
                          value: paymentLabel(
                            amount: order.payment.initial!,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                      if (order.payment.finalAmount != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Pembayaran akhir',
                          value: paymentLabel(
                            amount: order.payment.finalAmount!,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                      if (order.payment.lateFine != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Denda terlambat',
                          value: paymentLabel(
                            amount: order.payment.lateFine!,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                      if (order.payment.damageFine != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Denda kerusakan',
                          value: paymentLabel(
                            amount: order.payment.damageFine!,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                      if (order.payment.finalAmount != null) ...[
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Total pembayaran',
                          value: paymentLabel(
                            amount: state.totalPayment,
                            selectedCurrency: state.selectedCurrency,
                            convertToCurrency: state.convertToCurrency,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (order.review != null ||
                  order.state == RentState.completed) ...[
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _sectionTitle(context, 'Ulasan Anda'),
                        if (order.review != null) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rating ${order.review!.rating}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              OutlinedButton.icon(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      RemoveReviewDialog(id: order.review!.id),
                                ),
                                icon: const Icon(Icons.delete_outline),
                                label: const Text("Hapus"),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Theme.of(
                                    context,
                                  ).colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            order.review!.content,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ] else
                          Center(
                            child: FilledButton(
                              onPressed: () => Navigator.of(
                                context,
                              ).push(ReviewFormPage.routeAdd(rentId: state.id)),
                              child: const Text("Add Review"),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.start,
                children: [
                  if (order.state == RentState.readyForPickup)
                    FilledButton(
                      onPressed: () =>
                          context.read<MyOrderDetailCubit>().onReceive(),
                      child: const Text("Receive"),
                    ),
                  if (order.state == RentState.onRent)
                    FilledButton(
                      onPressed: () =>
                          context.read<MyOrderDetailCubit>().onRequestReturn(),
                      child: const Text("Return"),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DetailLine extends StatelessWidget {
  final String label;
  final String value;

  const _DetailLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 6),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
