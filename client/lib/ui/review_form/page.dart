import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(title: Text("Add Review")),
          body: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () => {},
                      // context.read<ReviewFormCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<ReviewFormCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          TextField(
            decoration: InputDecoration(label: Text("Rating")),
            readOnly: !state.canEdit,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (rating) => context
                .read<ReviewFormCubit>()
                .onRatingChanged(int.tryParse(rating)),
          ),
          TextField(
            decoration: InputDecoration(label: Text("Content")),
            readOnly: !state.canEdit,
            onChanged: (content) =>
                context.read<ReviewFormCubit>().onContentChanged(content),
          ),
          OutlinedButton(
            onPressed: !state.canSubmit
                ? null
                : () => context.read<ReviewFormCubit>().onSubmit(),
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
