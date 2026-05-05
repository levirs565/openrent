import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/home/state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository productRepository;

  HomeCubit(this.productRepository) : super(const HomeState.initial());

  Future<void> fetchProducts() async {
    emit(const HomeState.loading());
    final result = await productRepository.searchProduct(keyword: '');
    switch (result) {
      case ResultSuccess(data: final products):
        emit(HomeState.success(products));
        break;
      case ResultError(message: final message):
        emit(HomeState.error(message));
        break;
    }
  }
}
