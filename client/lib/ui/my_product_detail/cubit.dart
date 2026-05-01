import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';

import 'state.dart';

// TODO: Use spesific api, add rents list
class MyProductDetailCubit extends Cubit<MyProductDetailState> {
  final ProductRepository _productRepository;

  MyProductDetailCubit({required int id, required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(MyProductDetailState(id: id, isLoading: false, data: null)) {
    _refresh();
  }

  void onRefresh() {
    if (state.isLoading) return;

    _refresh();
  }

  void _refresh() async {
    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getMyProductById(id: state.id);

    switch (result) {
      case ResultSuccess<MyProductResponseItemDetail>():
        emit(state.copyWith(isLoading: false, data: result.data));
      case ResultError<MyProductResponseItemDetail>():
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
