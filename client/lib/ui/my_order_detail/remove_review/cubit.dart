import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/review.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/my_order_detail/remove_review/state.dart';

class RemoveReviewCubit extends Cubit<RemoveReviewState> {
  final ReviewRepository _reviewRepository;

  RemoveReviewCubit({
    required int id,
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository,
       super(RemoveReviewState(id: id, submitState: .idle, error: null));

  void onSubmit() async {
    if (state.submitState == .loading) return;

    emit(state.copyWith(submitState: .loading, error: null));

    final result = await _reviewRepository.remove(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(submitState: .finished));
      case ResultError<void>():
        emit(
          state.copyWith(
            submitState: .idle,
            error: .general(message: result.message),
          ),
        );
    }
  }

  void onFinishedHandled() {
    emit(state.copyWith(submitState: .idle));
  }

}
