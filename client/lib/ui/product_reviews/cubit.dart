import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/review.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/product_reviews/state.dart';

class ProductReviewsCubit extends Cubit<ProductReviewsState> {
  final ReviewRepository _reviewRepository;

  ProductReviewsCubit({
    required int productId,
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository,
       super(
         ProductReviewsState(
           productId: productId,
           list: List.empty(),
           isLoading: false,
           error: null,
         ),
       ) {
    onRefresh();
  }

  Future<void> onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _reviewRepository.getByProduct(state.productId);

    switch (result) {
      case ResultSuccess<List<ProductReviewDetail>>():
        emit(state.copyWith(isLoading: false, list: result.data));
      case ResultError<List<ProductReviewDetail>>():
        emit(
          state.copyWith(
            isLoading: false,
            error: GeneralErrorData.general(message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
