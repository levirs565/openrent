import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/state.dart';

class MyRentalRejectCubit extends Cubit<MyRentalRejectState> {
  final RentalRepository _rentalRepository;

  MyRentalRejectCubit({
    required int id,
    required RentalRepository rentalRepository,
  }) : _rentalRepository = rentalRepository,
       super(
         MyRentalRejectState(
           id: id,
           note: "",
           isLoading: false,
           isFinished: false,
           error: null,
         ),
       );

  void onNoteChanged(String note) {
    emit(state.copyWith(note: note));
  }

  void onFinishedHandled() {
    emit(state.copyWith(isFinished: false));
  }

  void onSubmit() async {
    if (!state.canSubmit) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _rentalRepository.reject(
      id: state.id,
      note: state.note,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isFinished: true));
      case ResultError<void>():
        emit(
          state.copyWith(
            isLoading: false,
            error: GeneralErrorData.general(message: result.message),
          ),
        );
    }
  }
}
