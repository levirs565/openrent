import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/product_form/state.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  final AddressRepository _addressRepository;
  final ProductRepository _productRepository;

  ProductFormCubit({
    required int? id,
    required AddressRepository addressRepository,
    required ProductRepository productRepository,
  }) : _productRepository = productRepository,
       _addressRepository = addressRepository,
       super(
         ProductFormState(
           id: id,
           addressList: List.empty(),
           name: "",
           addressId: null,
           pricePerDay: null,
           lateFeePerDay: null,
           stock: null,
           description: "",
           dataStatus: id == null ? .success : .initial,
           addressStatus: .initial,
           submissionStatus: .idle,
         ),
       ) {
    onRefreshAddress();
  }

  void onRefreshProduct() async {
    if (state.isLoading || state.id == null) return;

    emit(state.copyWith(dataStatus: .loading));

    final result = await _productRepository.getById(id: state.id!);

    switch (result) {
      case ResultSuccess<ProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .success,
            name: result.data.name,
            addressId: result.data.address.id,
            pricePerDay: result.data.pricePerDay,
            lateFeePerDay: result.data.lateFeePerDay,
            description: result.data.description,
            stock: result.data.stock,
          ),
        );
      case ResultError<ProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: ProductFormError(
              source: .dataProduct,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onRefreshAddress() async {
    if (state.isLoading) return;

    emit(state.copyWith(addressStatus: .loading));
    final result = await _addressRepository.getMine();

    switch (result) {
      case ResultSuccess<List<AddressResponseItem>>():
        emit(state.copyWith(addressStatus: .success, addressList: result.data));
        onRefreshProduct();
      case ResultError<List<AddressResponseItem>>():
        emit(
          state.copyWith(
            addressStatus: .fail,
            error: ProductFormError(
              source: .dataAddress,
              message: result.message,
            ),
          ),
        );
    }
  }

  void onNameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void onAddressChanged(int? id) {
    emit(state.copyWith(addressId: id));
  }

  void onPricePerDayChanged(int? pricePerDay) {
    emit(state.copyWith(pricePerDay: pricePerDay));
  }

  void onLateFeePerDayChanged(int? lateFeePerDay) {
    emit(state.copyWith(lateFeePerDay: lateFeePerDay));
  }

  void onStockChanged(int? stock) {
    emit(state.copyWith(stock: stock));
  }

  void onDescriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void onErrorHandled(ProductFormError error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }

  void onSubmit() async {
    if (state.isLoading || !state.isValid) return;
    emit(state.copyWith(submissionStatus: .submitting));

    final request = ProductAddRequest(
      name: state.name,
      pricePerDay: state.pricePerDay!,
      lateFeePerDay: state.lateFeePerDay!,
      stock: state.stock!,
      description: state.description,
      addressId: state.addressId!,
    );
    final result = state.id == null
        ? await _productRepository.add(request)
        : await _productRepository.update(state.id!, request);

    switch (result) {
      case ResultSuccess<ProductResponseItem>():
        emit(state.copyWith(submissionStatus: .finished));
      case ResultError<ProductResponseItem>():
        emit(
          state.copyWith(
            submissionStatus: .idle,
            error: ProductFormError(
              source: .submit,
              message: result.message,
            ),
          ),
        );
    }
  }
}
