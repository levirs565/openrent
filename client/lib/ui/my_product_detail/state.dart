import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyProductDetailErrorSource { data, actionImageUpload }

typedef MyProductDetailError = ErrorData<MyProductDetailErrorSource>;

@freezed
abstract class MyProductDetailState with _$MyProductDetailState {
  const MyProductDetailState._();

  const factory MyProductDetailState({
    required MyProductResponseItemDetail? data,
    required MyProductDetailError? error,
    required int id,
    required DataStatus dataStatus,
    required bool isImageUpload,
  }) = _MyProductDetailState;

  bool get isLoading => dataStatus == .loading || isImageUpload;
  bool get isCanUpload => dataStatus == .success && !isImageUpload;
}
