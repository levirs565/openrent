import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/my_addresses/state.dart';

class MyAddressesCubit extends Cubit<MyAddressesState> {
  final AddressRepository _addressRepository;

  MyAddressesCubit({required AddressRepository addressRepository})
    : _addressRepository = addressRepository,
      super(
        MyAddressesState(
          data: List.empty(),
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

    final result = await _addressRepository.getMine();

    switch (result) {
      case ResultSuccess<List<AddressResponseItem>>():
        emit(state.copyWith(dataStatus: .success, data: result.data));
      case ResultError<List<AddressResponseItem>>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: MyAddressesError(source: .data, message: result.message),
          ),
        );
    }
  }

  void onDelete(int id) async {
    if (state.isLoading) return;

    emit(state.copyWith(isActionLoading: true));

    final result = await _addressRepository.delete(id);

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isActionLoading: false));
        onRefresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isActionLoading: false,
            error: MyAddressesError(source: .action, message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(MyAddressesError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
