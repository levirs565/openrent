import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/currency_format.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/components/rental_status_label.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';
import 'package:openrent_client/ui/my_rental_detail/confirm_return/dialog.dart';
import 'package:openrent_client/ui/my_rental_detail/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/dialog.dart';

import 'handover/dialog.dart';
import 'state.dart';

class MyRentalDetailPage extends StatelessWidget {
  final int id;

  const MyRentalDetailPage({super.key, required this.id});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyRentalDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyRentalDetailCubit>(
      create: (context) => MyRentalDetailCubit(
        id: id,
        rentalRepository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: const Text('Detail Rental')),
          body: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy HH:mm').format(date);

  String _formatAddress(product) {
    return '${product.address.detail}, ${product.address.district}, ${product.address.regency}, ${product.address.province}';
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalDetailCubit, MyRentalDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: source == .data || source == .exchangeRate
                  ? SnackBarAction(
                      label: 'Refresh',
                      onPressed: () {
                        final cubit = context.read<MyRentalDetailCubit>();
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
          context.read<MyRentalDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        final product = state.data?.product;
        final user = state.data?.user;
        final rental = state.data;
        return SingleChildScrollView(
          child: Padding(
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
                                  onPressed: rental == null
                                      ? null
                                      : () => Navigator.of(context).push(
                                          MyProductDetailPage.route(
                                            product!.id,
                                          ),
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
                                InfoChip(
                                  label: product != null
                                      ? '${formatCurrencyAmount(product.pricePerDay, 'IDR')}/hari'
                                      : 'Harga tidak tersedia',
                                ),
                                InfoChip(
                                  label: product != null
                                      ? 'Denda ${formatCurrencyAmount(product.lateFeePerDay, 'IDR')}/hr'
                                      : 'Denda tidak tersedia',
                                ),
                                if (product != null)
                                  InfoChip(label: _formatAddress(product)),
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
                        _sectionTitle(context, 'Penyewa'),
                        Text(
                          user?.name ?? '-',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 12),
                        FilledButton.icon(
                          onPressed: user == null
                              ? null
                              : () => Navigator.of(context).push(
                                  MessagesPage.route(otherUserId: user.id),
                                ),
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
                        _sectionTitle(context, 'Ringkasan Rental'),
                        InfoChip(
                          label: rental != null
                              ? rentalStatusLabel(rental.state)
                              : 'Status tidak tersedia',
                        ),
                        const SizedBox(height: 16),
                        _DetailLine(
                          label: 'Tanggal sewa',
                          value: rental != null
                              ? '${_formatDate(rental.startDate)} - ${_formatDate(rental.endDate)}'
                              : '-',
                        ),
                        const SizedBox(height: 12),
                        _DetailLine(
                          label: 'Jumlah',
                          value: rental?.quantity.toString() ?? '-',
                        ),
                        if (rental?.cancellation != null) ...[
                          const SizedBox(height: 12),
                          _DetailLine(
                            label: 'Alasan batal',
                            value:
                                toBeginningOfSentenceCase(
                                  rental!.cancellation!.reason.name.replaceAll(
                                    '_',
                                    ' ',
                                  ),
                                ) ??
                                rental.cancellation!.reason.name,
                          ),
                          const SizedBox(height: 8),
                          _DetailLine(
                            label: 'Catatan batal',
                            value: rental.cancellation!.note,
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
                        if (rental?.payment.initial != null &&
                            rental?.payment.finalAmount == null) ...[
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
                        if (rental?.payment.initial != null) ...[
                          const SizedBox(height: 12),
                          _DetailLine(
                            label: 'Pembayaran awal',
                            value: paymentLabel(
                              amount: rental!.payment.initial!,
                              selectedCurrency: state.selectedCurrency,
                              convertToCurrency: state.convertToCurrency,
                            ),
                          ),
                        ],
                        if (rental?.payment.finalAmount != null) ...[
                          const SizedBox(height: 12),
                          _DetailLine(
                            label: 'Pembayaran akhir',
                            value: paymentLabel(
                              amount: rental!.payment.finalAmount!,
                              selectedCurrency: state.selectedCurrency,
                              convertToCurrency: state.convertToCurrency,
                            ),
                          ),
                        ],
                        if (rental?.payment.lateFine != null) ...[
                          const SizedBox(height: 12),
                          _DetailLine(
                            label: 'Denda terlambat',
                            value: paymentLabel(
                              amount: rental!.payment.lateFine!,
                              selectedCurrency: state.selectedCurrency,
                              convertToCurrency: state.convertToCurrency,
                            ),
                          ),
                        ],
                        if (rental?.payment.damageFine != null) ...[
                          const SizedBox(height: 12),
                          _DetailLine(
                            label: 'Denda kerusakan',
                            value: paymentLabel(
                              amount: rental!.payment.damageFine!,
                              selectedCurrency: state.selectedCurrency,
                              convertToCurrency: state.convertToCurrency,
                            ),
                          ),
                        ],
                        if (rental?.payment.finalAmount != null) ...[
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
                const SizedBox(height: 20),
                if (rental?.review != null ||
                    rental?.state == RentState.completed) ...[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _sectionTitle(context, 'Ulasan'),
                          if (rental?.review != null) ...[
                            Text(
                              'Rating ${rental!.review!.rating}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              rental.review!.content ?? '-',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ] else
                            Text(
                              'Belum ada review',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.start,
                  children: [
                    if (rental?.state == RentState.pendingApproval)
                      FilledButton(
                        onPressed: () =>
                            context.read<MyRentalDetailCubit>().onApprove(),
                        child: const Text('Approve'),
                      ),
                    if (rental?.state == RentState.pendingApproval)
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: MyRentalRejectBottomSheet(id: state.id),
                          ),
                        ),
                        child: const Text('Reject'),
                      ),
                    if (rental?.state == RentState.awaitingHandover)
                      FilledButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: MyRentalHandoverBottomSheet(rental: rental!),
                          ),
                        ),
                        child: const Text('Handover'),
                      ),
                    if (rental?.state == RentState.awaitingReturnConfirmation)
                      FilledButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: MyRentalConfirmReturnBottomSheet(
                              rental: rental!,
                            ),
                          ),
                        ),
                        child: const Text('Confirm Return'),
                      ),
                  ],
                ),
              ],
            ),
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
