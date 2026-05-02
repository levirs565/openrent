import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';

import 'cubit.dart';
import 'state.dart';

class MyRentalHandoverDialog extends StatelessWidget {
  final RentalResponseItemDetails rental;

  const MyRentalHandoverDialog({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalHandoverCubit(
        rental: rental,
        rentalRepository: context.read(),
        exchangeRatesRepository: context.read(),
      ),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalHandoverCubit, MyRentalHandoverState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pop();
          context.read<MyRentalHandoverCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => AlertDialog(
        title: const Text("Handover Rental"),
        content: Column(
          mainAxisSize: .min,
          children: [
            if (state.exchangeRateStatus == .loading) LinearProgressIndicator(),
            if (state.exchangeRateStatus == .fail)
              OutlinedButton(
                onPressed: () => context
                    .read<MyRentalHandoverCubit>()
                    .onRefreshExchangeRate(),
                child: Text("Refresh"),
              ),
            ControlledTextField<MyRentalHandoverCubit, MyRentalHandoverState>(
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
                    .read<MyRentalHandoverCubit>()
                    .onFromCurrencyChanged(value ?? "IDR"),
              ),
            ),
            Text("Estimated Price: ${state.estimatedPriceIdr} IDR or ${state.estimatedPrice}"),
            Text("Estimated Half Price: ${state.estimatedHalfPriceIdr} IDR or ${state.estimatedHalfPrice}"),
            TextField(
              decoration: InputDecoration(label: Text("Initial Payment")),
              onChanged: (payment) => context
                  .read<MyRentalHandoverCubit>()
                  .onPaymentChanged(double.tryParse(payment)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
              ],
            ),
            Text("You Get: ${state.paymentIdr} IDR"),
            if (state.error != null) Text("Error: ${state.error?.message}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: state.isSubmitLoading
                ? null
                : () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: !state.canSubmit
                ? null
                : () => context.read<MyRentalHandoverCubit>().onSubmit(),
            child: state.isSubmitLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text("Handover"),
          ),
        ],
      ),
    );
  }
}
