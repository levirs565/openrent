import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/components/currency_format.dart';
import 'package:openrent_client/ui/components/loading_button.dart';

import 'cubit.dart';
import 'state.dart';

class MyRentalHandoverBottomSheet extends StatelessWidget {
  final RentalResponseItemDetails rental;

  const MyRentalHandoverBottomSheet({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalHandoverCubit(
        rental: rental,
        rentalRepository: context.read(),
        exchangeRatesRepository: context.read(),
      ),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<MyRentalHandoverCubit, MyRentalHandoverState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pop();
          context.read<MyRentalHandoverCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Serah Terima Rental', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 16),
              if (state.exchangeRateStatus == .loading)
                const LinearProgressIndicator(),
              if (state.exchangeRateStatus == .fail)
                OutlinedButton(
                  onPressed: () => context
                      .read<MyRentalHandoverCubit>()
                      .onRefreshExchangeRate(),
                  child: const Text('Refresh Kurs'),
                ),
              if (state.exchangeRate != null) ...[
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: state.selectedFromCurrency,
                  decoration: const InputDecoration(
                    labelText: 'Konversi ke',
                    border: OutlineInputBorder(),
                  ),
                  items: state.exchangeRate!.conversionRates.keys
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<MyRentalHandoverCubit>()
                          .onFromCurrencyChanged(value);
                    }
                  },
                ),
              ],
              const SizedBox(height: 16),
              _DetailRow(
                label: 'Estimasi Harga',
                value: paymentLabel(
                  amount: state.estimatedPriceIdr,
                  selectedCurrency: state.selectedFromCurrency,
                  convertToCurrency: (amount) => state.estimatedPrice,
                ),
              ),
              const SizedBox(height: 12),
              _DetailRow(
                label: 'Estimasi Setengah Harga',
                value: paymentLabel(
                  amount: state.estimatedHalfPriceIdr,
                  selectedCurrency: state.selectedFromCurrency,
                  convertToCurrency: (amount) => state.estimatedHalfPrice,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Pembayaran Awal',
                  border: OutlineInputBorder(),
                ),
                onChanged: (payment) => context
                    .read<MyRentalHandoverCubit>()
                    .onPaymentChanged(double.tryParse(payment)),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                ],
              ),
              const SizedBox(height: 12),
              _DetailRow(
                label: 'Total Diterima',
                value: paymentLabel(
                  amount: state.paymentIdr ?? 0,
                  selectedCurrency: state.selectedFromCurrency,
                  convertToCurrency: (amount) => state.payment,
                ),
              ),
              if (state.error != null) ...[
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.error?.message}',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: LoadingButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: state.isSubmitLoading
                          ? null
                          : () => Navigator.of(context).pop(),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LoadingButton(
                      onPressed: !state.canSubmit
                          ? null
                          : () => context
                                .read<MyRentalHandoverCubit>()
                                .onSubmit(),
                      isLoading: state.isSubmitLoading,
                      child: const Text('Serahkan'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
