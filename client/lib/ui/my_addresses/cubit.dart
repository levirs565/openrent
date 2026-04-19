import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';
import 'package:openrent_client/ui/my_addresses/state.dart';

class MyAddressesCubit extends Cubit<MyAddressesState> {
  final AddressRepository _addressRepository;

  MyAddressesCubit({required AddressRepository addressRepository})
    : _addressRepository = addressRepository,
      super(MyAddressesState(isLoading: false, data: List.empty())) {
    onRefresh();
  }

  void onRefresh() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _addressRepository.getMine();

    switch (result) {
      case ResultSuccess<List<AddressResponseItem>>():
        emit(state.copyWith(isLoading: false, data: result.data));
      case ResultError<List<AddressResponseItem>>():
        emit(
          state.copyWith(
            isLoading: true,
            error: ErrorWithDateTime.current(message: result.message),
          ),
        );
    }
  }

  void onErrorHandled(ErrorWithDateTime error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
