import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/my_rental_detail/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/state.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalRejectDialog extends StatelessWidget {
  final int id;

  const MyRentalRejectDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyRentalRejectCubit(id: id, rentalRepository: context.read()),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalRejectCubit, MyRentalRejectState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pop();
          context.read<MyRentalRejectCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => AlertDialog(
        title: const Text("Reject Rental"),
        content: Column(
          mainAxisSize: .min,
          children: [
            TextField(
              decoration: InputDecoration(label: Text("Note")),
              onChanged: (note) =>
                  context.read<MyRentalRejectCubit>().onNoteChanged(note),
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
                : () => context.read<MyRentalRejectCubit>().onSubmit(),
            child: state.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text("Reject"),
          ),
        ],
      ),
    );
  }
}
