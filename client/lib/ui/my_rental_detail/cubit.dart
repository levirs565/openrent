import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalDetailCubit extends Cubit<MyRentalDetailState> {
  final RentalRepository _rentalRepository;

  MyRentalDetailCubit({
    required int id,
    required RentalRepository rentalRepository,
  }) : _rentalRepository = rentalRepository,
       super(
         MyRentalDetailState(
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

    final result = await _rentalRepository.getById(state.id);

    switch (result) {
      case ResultSuccess<RentalResponseItemDetails>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<RentalResponseItemDetails>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyRentalDetailError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyRentalDetailError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onApprove() async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.approve(state.id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionApprove,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onReject(String note) async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _rentalRepository.reject(id: state.id, note: note);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyRentalDetailError(
              source: .actionReject,
              message: result.message,
            ),
          ),
        );
    }
  }
}
