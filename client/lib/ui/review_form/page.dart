import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/review_form/cubit.dart';
import 'package:openrent_client/ui/review_form/state.dart';

class ReviewFormPage extends StatelessWidget {
  final int? rentId;

  const ReviewFormPage({super.key, this.rentId});

  static Route<void> routeAdd({required int rentId}) {
    return MaterialPageRoute<void>(
      builder: (_) => ReviewFormPage(rentId: rentId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewFormCubit(
        id: null,
        rentId: rentId,
        reviewRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: const Text("Beri Ulasan")),
          body: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<ReviewFormCubit, ReviewFormState>(
      listener: (context, state) {
        if (state.submissionStatus == .finished) {
          Navigator.of(context).pop();
          context.read<ReviewFormCubit>().onFinishedHandled();
          return;
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error!.source == .submit
                  ? null
                  : SnackBarAction(label: "Refresh", onPressed: () {}),
            ),
          );
          context.read<ReviewFormCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.isLoading) const LinearProgressIndicator(),
            Text('Penilaian', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _StarRatingInput(
              rating: state.rating ?? 0,
              onRatingChanged: (rating) =>
                  context.read<ReviewFormCubit>().onRatingChanged(rating),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ulasan Anda',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              readOnly: !state.canEdit,
              onChanged: (content) =>
                  context.read<ReviewFormCubit>().onContentChanged(content),
              maxLines: 5,
            ),
            if (state.error != null && state.error?.source == .submit) ...[
              const SizedBox(height: 16),
              Text(
                'Error: ${state.error?.message}',
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ],
            const SizedBox(height: 24),
            LoadingButton(
              onPressed: !state.canSubmit
                  ? null
                  : () => context.read<ReviewFormCubit>().onSubmit(),
              isLoading: state.submissionStatus == .loading,
              child: const Text("Submit Review"),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarRatingInput extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const _StarRatingInput({required this.rating, required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onRatingChanged(index + 1),
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 40,
          ),
        );
      }),
    );
  }
}
