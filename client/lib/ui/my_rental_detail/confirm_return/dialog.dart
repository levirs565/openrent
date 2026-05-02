import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';

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
            Text("Estimated Price: ${state.estimatedPrice}"),
            Text("Initial Payment: ${state.rental.payment.initial ?? 0}"),
            Text("Estimated Final Payment: ${state.estimatedFinalPayment}"),
            Text("Estimated Late Fine: ${state.estimatedLateFine}"),
            TextField(
              decoration: InputDecoration(label: Text("Final Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onPaymentChanged(int.tryParse(payment)),
            ),
            TextField(
              decoration: InputDecoration(label: Text("Late Fine Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onLateFinePaymentChanged(int.tryParse(payment)),
            ),
            TextField(
              decoration: InputDecoration(label: Text("Damage Fine Payment")),
              onChanged: (payment) => context
                  .read<MyRentalConfirmReturnCubit>()
                  .onDamageFinePaymentChanged(int.tryParse(payment)),
            ),
            Text("Total: ${state.totalPayment}"),
            Text("Total Price: ${state.totalPrice}"),
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
