import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/product_detail/summary/state.dart';

class ProductSummaryCubit extends Cubit<ProductSummaryState> {
  final ProductRepository _productRepository;

  ProductSummaryCubit({
    required int id,
    required ProductRepository productRepository,
  }) : _productRepository = productRepository,
       super(
         ProductSummaryState(
           id: id,
           isLoading: false,
           error: null,
           summary: null,
         ),
       ) {
    onRefresh();
  }

  Future<void> onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));
    final result = await _productRepository.getSummary(id: state.id);
    switch (result) {
      case ResultSuccess<ProductSummaryResponse>():
        emit(state.copyWith(isLoading: false, summary: result.data.summary));
      case ResultError<ProductSummaryResponse>():
        emit(
          state.copyWith(
            isLoading: false,
            error: .general(message: result.message),
          ),
        );
    }
  }
}
