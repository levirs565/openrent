import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';
import 'package:openrent_client/ui/product/state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit({required int id, required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductState(id: id, isLoading: false, data: null)) {
    _refresh();
  }

  void onRefresh() {
    if (state.isLoading) return;

    _refresh();
  }

  void _refresh() async {
    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getById(id: state.id);

    switch (result) {
      case ResultSuccess<ProductResponseItemDetail>():
        emit(state.copyWith(
          isLoading: false,
          data: result.data
        ));
      case ResultError<ProductResponseItemDetail>():
        emit(state.copyWith(
          isLoading: false,
          error: ErrorWithDateTime.current(message: result.message)
        ));
    }
  }

  void onErrorHandled(ErrorWithDateTime error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
