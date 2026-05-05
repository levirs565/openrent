import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  SuggestionCubit() : super(const SuggestionState());

  void onSuggestionChanged(String value) {
    emit(state.copyWith(suggestionText: value, errorMessage: null));
  }

  Future<void> submitSuggestion() async {
    if (state.suggestionText.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'Saran dan kesan tidak boleh kosong.'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      // TODO: Ganti dengan pemanggilan fungsi API Repository yang sebenarnya jika ada
      // Simulasi proses pengiriman ke server selama 1.5 detik
      await Future.delayed(const Duration(milliseconds: 1500));
      
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Gagal mengirim saran. Silakan coba lagi.'));
    }
  }
}