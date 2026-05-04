import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:timezone/timezone.dart' as tz;

import 'state.dart';

// TODO: Use spesific api, add rents list
class MyProductDetailCubit extends Cubit<MyProductDetailState> {
  final ProductRepository _productRepository;

  MyProductDetailCubit({
    required int id,
    required ProductRepository productRepository,
    required SettingsRepository settingsRepository,
  }) : _productRepository = productRepository,
       super(
         MyProductDetailState(
           id: id,
           data: null,
           error: null,
           dataStatus: .initial,
           isImageUpload: false,
           timeZone: tz.getLocation(settingsRepository.getTimeZone()),
         ),
       ) {
    _refresh();
  }

  void onRefresh() {
    if (state.isLoading) return;

    _refresh();
  }

  void _refresh() async {
    emit(state.copyWith(dataStatus: .loading));

    final result = await _productRepository.getMyProductById(id: state.id);

    switch (result) {
      case ResultSuccess<MyProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .success,
            data: result.data.copyWith(
              createdAt: tz.TZDateTime.from(result.data.createdAt, state.timeZone),
              rents: result.data.rents
                  .map(
                    (element) => element.copyWith(
                      startDate: tz.TZDateTime.from(
                        element.startDate,
                        state.timeZone,
                      ),
                      endDate: tz.TZDateTime.from(
                        element.endDate,
                        state.timeZone,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      case ResultError<MyProductResponseItemDetail>():
        emit(
          state.copyWith(
            dataStatus: .fail,
            error: .new(source: .data, message: result.message),
          ),
        );
    }
  }

  void onUploadImage(XFile file) async {
    if (state.isLoading) return;

    emit(state.copyWith(isImageUpload: true));

    final result = await _productRepository.uploadImage(
      id: state.id,
      file: file,
    );

    switch (result) {
      case ResultSuccess<void>():
        emit(state.copyWith(isImageUpload: false));
        _refresh();
      case ResultError<void>():
        emit(
          state.copyWith(
            isImageUpload: false,
            error: .new(source: .actionImageUpload, message: result.message),
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
