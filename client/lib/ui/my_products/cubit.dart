import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/my_products/state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  final ProductRepository _productRepository;

  MyProductsCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(MyProductsState(isLoading: false, data: List.empty())) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getMyProduct();

    switch (result) {
      case ResultSuccess<List<ProductResponseItemShort>>():
        emit(state.copyWith(
          isLoading: false,
          data: result.data
        ));
      case ResultError<List<ProductResponseItemShort>>():
        emit(state.copyWith(
          isLoading: false,
          error: GeneralErrorData.general(message: result.message)
        ));
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
