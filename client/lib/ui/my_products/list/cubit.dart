import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/my_products/list/state.dart';

class MyProductListCubit extends Cubit<MyProductListState> {
  final ProductRepository _productRepository;

  MyProductListCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(MyProductListState(isLoading: false, data: List.empty())) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getMyProduct();

    switch (result) {
      case ResultSuccess<List<MyProductResponseItemShort>>():
        emit(state.copyWith(
          isLoading: false,
          data: result.data
        ));
      case ResultError<List<MyProductResponseItemShort>>():
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
