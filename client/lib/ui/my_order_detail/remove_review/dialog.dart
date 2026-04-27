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
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveReviewCubit, RemoveReviewState>(
      listener: (context, state) {
        if (state.submitState == .finished) {
          Navigator.of(context).pop();
          context.read<RemoveReviewCubit>().onFinishedHandled();
        }
      },
      builder: (context, state) => AlertDialog(
        title: const Text("Delete Review"),
        content: Column(
          mainAxisSize: .min,
          children: [
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
                : () => context.read<RemoveReviewCubit>().onSubmit(),
            child: state.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text("Delete"),
          ),
        ],
      ),
    );
  }
}
