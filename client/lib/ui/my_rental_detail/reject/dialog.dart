import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/my_rental_detail/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/state.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalRejectBottomSheet extends StatelessWidget {
  final int id;

  const MyRentalRejectBottomSheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyRentalRejectCubit(id: id, rentalRepository: context.read()),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<MyRentalRejectCubit, MyRentalRejectState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pop();
          context.read<MyRentalRejectCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Tolak Rental', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Catatan',
                border: OutlineInputBorder(),
              ),
              onChanged: (note) =>
                  context.read<MyRentalRejectCubit>().onNoteChanged(note),
              maxLines: 3,
            ),
            if (state.error != null) ...[
              const SizedBox(height: 16),
              Text(
                'Error: ${state.error?.message}',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: LoadingButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: state.isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LoadingButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: !state.canSubmit
                        ? null
                        : () => context.read<MyRentalRejectCubit>().onSubmit(),
                    isLoading: state.isLoading,
                    child: const Text('Tolak'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
