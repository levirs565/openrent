import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyProductDetailErrorSource { data, actionImageUpload }

typedef MyProductDetailError = ErrorData<MyProductDetailErrorSource>;

@freezed
class MyProductDetailState with _$MyProductDetailState {
  final int id;
  final DataStatus dataStatus;
  final bool isImageUpload;
  final MyProductResponseItemDetail? data;
  final MyProductDetailError? error;

  MyProductDetailState({
    required this.data,
    required this.error,
    required this.id,
    required this.dataStatus, required this.isImageUpload,
  });

  bool get isLoading => dataStatus == .loading || isImageUpload;
  bool get isCanUpload => dataStatus == .success && !isImageUpload;
}
