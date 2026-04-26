import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/order.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/resource.dart';

import 'state.dart';

class MyOrderDetailCubit extends Cubit<MyOrderDetailState> {
  final OrderRepository _orderRepository;

  MyOrderDetailCubit({
    required int id,
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository,
       super(
         MyOrderDetailState(
           id: id,
           data: null,
           dataStatus: .initial,
           isActionLoading: false,
           error: null,
         ),
       ) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _orderRepository.getById(state.id);

    switch (result) {
      case ResultSuccess<OrderResponseItemDetails>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<OrderResponseItemDetails>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyOrderDetailError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyOrderDetailError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onReceive() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _orderRepository.receive(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyOrderDetailError(
              source: .actionReceive,
              message: result.message,
            ),
          ),
        );
    }
  }
}
