import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/review.dart';
import 'package:openrent_client/ui/review_form/state.dart';

class ReviewFormCubit extends Cubit<ReviewFormState> {
  final ReviewRepository _reviewRepository;

  ReviewFormCubit({
    required int? id,
    required int? rentId,
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository,
       super(
         ReviewFormState(
           id: id,
           rentId: rentId,
           rating: null,
           content: "",
           error: null,
           dataStatus: id == null ? .success : .initial,
           submissionStatus: .idle,
         ),
       );

  void onRatingChanged(int? rating) {
    emit(state.copyWith(rating: rating));
  }

  void onContentChanged(String content) {
    emit(state.copyWith(content: content));
  }

  void onSubmit() async {
    if (state.isLoading || state.rentId == null || !state.isValid) return;

    emit(state.copyWith(submissionStatus: .loading));

    final result = await _reviewRepository.add(
      rentId: state.rentId!,
      rating: state.rating!,
      content: state.content,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(submissionStatus: .finished));
      case ResultError<void>():
        emit(
          state.copyWith(
            submissionStatus: .idle,
            error: .new(source: .submit, message: result.message),
          ),
        );
    }
  }

  void onFinishedHandled() {
    emit(state.copyWith(submissionStatus: .idle));
  }

  void onErrorHandled(ReviewFormError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
