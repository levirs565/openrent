import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/biometrics/biometric.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/ui/core/error_data.dart';
import 'package:openrent_client/ui/profile/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SettingsRepository _settingsRepository;
  final AuthRepository _authRepository;

  ProfileCubit({
    required SettingsRepository settingsRepository,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       _settingsRepository = settingsRepository,
       super(
         ProfileState(
           isUploadingAvatar: false,
           error: null,
         ),
       );

  void onUploadAvatar(XFile file) async {
    if (state.isUploadingAvatar) return;
    emit(state.copyWith(isUploadingAvatar: true));

    final result = await _authRepository.uploadAvatar(file);

    switch (result) {
      case ResultSuccess():
        emit(state.copyWith(isUploadingAvatar: false));
        break;
      case ResultError():
        emit(
          state.copyWith(
            isUploadingAvatar: false,
            error: .general(message: result.message),
          ),
        );
        break;
    }
  }

  void onErrorHandled(GeneralErrorData error) {
    if (state.error == error) {
      emit(state.copyWith(error: null));
    }
  }
}
