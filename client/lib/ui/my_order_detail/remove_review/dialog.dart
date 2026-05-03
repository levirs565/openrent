import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';
import 'cubit.dart';

class RemoveReviewDialog extends StatelessWidget {
  final int id;

  const RemoveReviewDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RemoveReviewCubit(id: id, reviewRepository: context.read()),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveReviewCubit, RemoveReviewState>(
      listener: (context, state) {
        if (state.submitState == .finished) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) => AlertDialog(
        title: const Text("Hapus Ulasan"),
        content: const Text(
          "Apakah Anda yakin ingin menghapus ulasan ini? Tindakan ini tidak dapat dibatalkan.",
        ),
        actions: [
          FilledButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: state.isLoading
                ? null
                : () => Navigator.of(context).pop(),
            child: const Text("Batal"),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: !state.canSubmit
                ? null
                : () => context.read<RemoveReviewCubit>().onSubmit(),
            child: state.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
