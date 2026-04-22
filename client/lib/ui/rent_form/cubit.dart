import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/rent.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/rent_form/state.dart';

class RentFormCubit extends Cubit<RentFormState> {
  final ProductRepository _productRepository;
  final RentRepository _rentRepository;

  RentFormCubit({
    required int id,
    required ProductRepository productRepository,
    required RentRepository rentRepository,
  }) : _productRepository = productRepository,
       _rentRepository = rentRepository,
       super(
         RentFormState(
           id: id,
           data: null,
           startDate: DateTime.now(),
           endDate: DateTime.now(),
           quantity: 1,
           dataStatus: .initial,
           actionStatus: .idle,
           error: null,
         ),
       ) {
    onRefresh();
  }

  void setStartDate(DateTime date) {
    emit(state.copyWith(startDate: date));
  }

  void setEndDate(DateTime date) {
    emit(state.copyWith(endDate: date));
  }

  void setQuantity(int? quantity) {
    emit(state.copyWith(quantity: quantity));
  }

  void onRefresh() async {
    // TODO: Maybe check only if data is loaindg?
    if (state.isLoading) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _productRepository.getById(id: state.id);

    switch (result) {
      case ResultSuccess<ProductResponseItemDetail>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<ProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: RentFormError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onSubmit() async {
    if (!state.canSubmit || state.isLoading) return;

    emit(state.copyWith(actionStatus: .loading));

    final result = await _rentRepository.startRent(
      productId: state.data!.id,
      startDate: state.startDate,
      endDate: state.endDate,
      quantity: state.quantity!,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(actionStatus: .finished));
      case ResultError<void>():
        emit(
          state.copyWith(
            actionStatus: .idle,
            error: RentFormError(source: .submit, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(RentFormError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onActionSuccessHandled() {
    if (state.actionStatus == .finished) {
      emit(state.copyWith(actionStatus: .idle));
    }
  }
}
