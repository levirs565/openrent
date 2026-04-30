import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/core/enum.dart';
import 'package:openrent_client/ui/core/error_data.dart';

part 'state.freezed.dart';

enum MyRentalDetailErrorSource {
  data,
  actionApprove,
  actionHandover,
  actionConfirmReturn,
}

typedef MyRentalDetailError = ErrorData<MyRentalDetailErrorSource>;

@freezed
abstract class MyRentalDetailState with _$MyRentalDetailState {
  const MyRentalDetailState._();

  const factory MyRentalDetailState({
    required int id,
    required RentalResponseItemDetails? data,
    required DataStatus dataStatus,
    required bool isActionLoading,
    required MyRentalDetailError? error,
  }) = _MyRentalDetailState;

  bool get isLoading => dataStatus == .loading || isActionLoading;

  bool get canAction => dataStatus == .success;
}
