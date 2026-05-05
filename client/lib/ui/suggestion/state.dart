import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class SuggestionState with _$SuggestionState {
  const factory SuggestionState({
    @Default('') String suggestionText,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _SuggestionState;
}
