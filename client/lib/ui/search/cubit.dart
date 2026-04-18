import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/error_with_datetime.dart';
import 'package:openrent_client/ui/search/state.dart';
import 'package:stream_transform/stream_transform.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductRepository repository;
  final _searchController = StreamController<String>();
  StreamSubscription? _searchSubscription;
  CancelToken? _cancelToken;

  SearchCubit({required this.repository})
    : super(
        SearchState(
          result: List.empty(),
          isLoading: false,
        ),
      ) {
    _searchSubscription = _searchController.stream
        .debounce(Duration(milliseconds: 500))
        .distinct()
        .listen((_doSearch));
  }

  void onKeywordChanged(String keyword) {
    _searchController.add(keyword);
  }

  @override
  Future<void> close() {
    _searchSubscription?.cancel();
    return super.close();
  }

  void _doSearch(String keyword) async {
    _cancelToken?.cancel();
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;

    emit(state.copyWith(isLoading: true));

    final result = await repository.searchProduct(
      keyword: keyword,
      disableAiSearch: true,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) return;

    switch (result) {
      case ResultSuccess<List<ProductResponseItemShort>>():
        emit(state.copyWith(result: result.data, isLoading: false));
      case ResultError<List<ProductResponseItemShort>>():
        emit(
          state.copyWith(
            error: ErrorWithDateTime.current(message: result.message),
            isLoading: false,
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
