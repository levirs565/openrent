import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';

import 'cubit.dart';
import 'state.dart';

class MyRentalConfirmReturnDialog extends StatelessWidget {
  final RentalResponseItemDetails rental;

  const MyRentalConfirmReturnDialog({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalConfirmReturnCubit(
        rental: rental,
        rentalRepository: context.read(),
        exchangeRatesRepository: context.read()
      ),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalConfirmReturnCubit, MyRentalConfirmReturnState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pop();
          context.read<MyRentalConfirmReturnCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => AlertDialog(
        title: const Text("Confirm Return Rental"),
        content: Column(
          mainAxisSize: .min,
          children: [
            if (state.exchangeRateStatus == .loading) LinearProgressIndicator(),
            if (state.exchangeRateStatus == .fail)
              OutlinedButton(
                onPressed: () => context
                    .read<MyRentalConfirmReturnCubit>()
                    .onRefreshExchangeRate(),
                child: Text("Refresh"),
              ),
            ControlledTextField<MyRentalConfirmReturnCubit, MyRentalConfirmReturnState>(
              selector: (state) => state.selectedFromCurrency,
              builder: (controller) => DropdownMenu<String>(
                controller: controller,
                selectOnly: true,
                enabled: state.canEdit,
                label: const Text('From Currency'),
                dropdownMenuEntries:
                state.exchangeRate?.conversionRates.keys
                    .map(
                      (item) => DropdownMenuEntry(value: item, label: item),
                )
                    .toList() ??
                    List.empty(),
                onSelected: (value) => context
                    .read<MyRentalConfirmReturnCubit>()
                    .onFromCurrencyChanged(value ?? "IDR"),
              ),
            ),
            Text("Estimated Price: ${state.estimatedPriceIdr} IDR or ${state.estimatedPrice}"),
            Text("Initial Payment: ${state.rental.payment.initial ?? 0} IDR"),
            Text("Estimated Final Payment: ${state.estimatedFinalPaymentIdr} IDR or ${state.estimatedFinalPayment}"),
            Text("Estimated Late Fine: ${state.estimatedLateFineIdr} IDR or ${state.estimatedLateFine}"),
            TextField(
              decoration: InputDecoration(label: Text("Final Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onPaymentChanged(double.tryParse(payment)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
              ],
            ),
            TextField(
              decoration: InputDecoration(label: Text("Late Fine Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onLateFinePaymentChanged(double.tryParse(payment)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
              ],
            ),
            TextField(
              decoration: InputDecoration(label: Text("Damage Fine Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onDamageFinePaymentChanged(double.tryParse(payment)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
              ],
            ),
            Text("Total: ${state.totalPayment} or ${state.totalPaymentIdr} IDR"),
            Text("Total Price: ${state.totalPriceIdr} IDR"),
            if (state.error != null) Text("Error: ${state.error?.message}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: state.isLoading
                ? null
                : () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: !state.canSubmit
                ? null
                : () => context.read<MyRentalConfirmReturnCubit>().onSubmit(),
            child: state.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text("Confirm Return"),
          ),
        ],
      ),
    );
  }
}
