import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/order.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/my_orders/state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final OrderRepository _orderRepository;

  MyOrdersCubit({required OrderRepository orderRepository})
    : _orderRepository = orderRepository,
      super(MyOrdersState(isLoading: false, list: List.empty(), error: null)) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _orderRepository.getAll();

    switch (result) {
      case ResultSuccess<List<OrderResponseItem>>():
        emit(state.copyWith(isLoading: false, list: result.data));
      case ResultError<List<OrderResponseItem>>():
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
