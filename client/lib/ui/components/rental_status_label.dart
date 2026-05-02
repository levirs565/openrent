import 'package:openrent_client/data/remote/rental.dart';

String rentalStatusLabel(RentState status) {
  switch (status) {
    case RentState.pendingApproval:
      return 'Menunggu Persetujuan';
    case RentState.awaitingInitialPayment:
      return 'Menunggu Pembayaran Awal';
    case RentState.readyForPickup:
      return 'Siap Diambil';
    case RentState.awaitingHandover:
      return 'Menunggu Penyerahan';
    case RentState.onRent:
      return 'Sedang Disewa';
    case RentState.awaitingReturnConfirmation:
      return 'Menunggu Konfirmasi Pengembalian';
    case RentState.awaitingFinalPayment:
      return 'Menunggu Pembayaran Akhir';
    case RentState.completed:
      return 'Selesai';
    case RentState.cancelled:
      return 'Dibatalkan';
  }
}
