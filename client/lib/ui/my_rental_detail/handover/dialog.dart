import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';

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
            Text("Estimated Price: ${state.estimatedPrice}"),
            Text("Estimated Half Price: ${state.estimatedHalfPrice}"),
            TextField(
              decoration: InputDecoration(label: Text("Initial Payment")),
              onChanged: (payment) => context
                  .read<MyRentalHandoverCubit>()
                  .onPaymentChanged(int.tryParse(payment)),
            ),
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
                : () => context.read<MyRentalHandoverCubit>().onSubmit(),
            child: state.isLoading
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
