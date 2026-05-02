import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';
import 'package:openrent_client/ui/my_rental_detail/confirm_return/dialog.dart';
import 'package:openrent_client/ui/my_rental_detail/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/dialog.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

import 'handover/dialog.dart';

class MyRentalDetailPage extends StatelessWidget {
  final int id;

  const MyRentalDetailPage({super.key, required this.id});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyRentalDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalDetailCubit(
        id: id,
        rentalRepository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: Text("Rental")),
          body: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalDetailCubit, MyRentalDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: source == .data || source == .exchangeRate
                  ? SnackBarAction(
                      label: "Refresh",
                      onPressed: () {
                        final cubit = context.read<MyRentalDetailCubit>();
                        if (source == .data) {
                          cubit.onRefresh();
                        } else {
                          cubit.onRefreshExchangeRate();
                        }
                      },
                    )
                  : null,
            ),
          );
          context.read<MyRentalDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            if (state.isLoading) LinearProgressIndicator(),
            Text("Product"),
            if (state.data?.product.imageUrl != null)
              Image.network(state.data!.product.imageUrl!, height: 96),
            Text(state.data?.product.name ?? "-"),
            Text(
              "Price Per Day: ${state.data?.product.pricePerDay} IDR or ${state.convertToCurrency(state.data?.product.pricePerDay)}",
            ),
            Text(
              "Later Per Day: ${state.data?.product.lateFeePerDay} IDR or ${state.convertToCurrency(state.data?.product.lateFeePerDay)}",
            ),
            Text("Address: TODO"),
            OutlinedButton(
              onPressed: state.data == null
                  ? null
                  : () => Navigator.of(
                      context,
                    ).push(MyProductDetailPage.route(state.data!.product.id)),
              child: Text("Product Detail"),
            ),
            Text("User"),
            Text(state.data?.user.name ?? "-"),
            OutlinedButton(
              onPressed: state.data?.user == null
                  ? null
                  : () => Navigator.of(context).push(
                      MessagesPage.route(otherUserId: state.data!.user.id),
                    ),
              child: Text("Chat"),
            ),

            // TODO: User Detail Page
            Text("State"),
            Text(state.data?.state.toString() ?? "-"),
            Text("Date"),
            Text(
              "${state.data?.startDate ?? "-"} - ${state.data?.endDate ?? "-"}",
            ),
            Text("Quantity"),
            Text(state.data?.quantity.toString() ?? "-"),
            if (state.data?.cancellation != null) ...[
              Text("Cancel Reason: ${state.data?.cancellation?.reason ?? "-"}"),
              Text("Cancel Note: ${state.data?.cancellation?.note}"),
            ],
            Text(
              "Estimated Price: ${state.estimatedPrice} IDR or ${state.convertToCurrency(state.estimatedPrice)}",
            ),
            Text(
              "Estimated Late Fine: ${state.estimatedLateFine} IDR or ${state.convertToCurrency(state.estimatedLateFine)}",
            ),
            if (state.data?.payment.initial != null &&
                state.data?.payment.finalAmount == null) ...[
              Text(
                "Estimated Total Payment: ${state.estimatedTotalPrice} IDR or ${state.convertToCurrency(state.estimatedTotalPrice)}",
              ),
            ],
            if (state.data?.payment.initial != null)
              Text(
                "Initial Payment: ${state.data?.payment.initial} IDR or ${state.convertToCurrency(state.data?.payment.initial)}",
              ),
            if (state.data?.payment.initial != null &&
                state.data?.payment.finalAmount == null) ...[
              Text(
                "Estimated Pending Payment: ${state.estimatedPendingPrice} IDR or ${state.convertToCurrency(state.estimatedPendingPrice)}",
              ),
            ],
            if (state.data?.payment.finalAmount != null)
              Text(
                "Final Payment: ${state.data?.payment.finalAmount} IDR or ${state.convertToCurrency(state.data?.payment.finalAmount)}",
              ),
            if (state.data?.payment.lateFine != null)
              Text(
                "Late Fine Payment: ${state.data?.payment.lateFine} IDR or ${state.convertToCurrency(state.data?.payment.lateFine)}",
              ),
            if (state.data?.payment.damageFine != null)
              Text(
                "Damage Fine Payment: ${state.data?.payment.damageFine} IDR or ${state.convertToCurrency(state.data?.payment.damageFine)}",
              ),
            if (state.data?.payment.finalAmount != null)
              Text(
                "Total Payment: ${state.totalPayment} IDR or ${state.convertToCurrency(state.totalPayment)}",
              ),
            if (state.data?.review != null) ...[
              Text("Review"),
              Text("${state.data?.review?.rating} start"),
              Text(state.data?.review?.content ?? "-"),
            ] else if (state.data?.state == .completed)
              Text("Belum Ada Review"),
            if (state.data?.state == .pendingApproval)
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () =>
                        context.read<MyRentalDetailCubit>().onApprove(),
                    child: Text("Approve"),
                  ),
                  // TODO: Refresh after finished
                  OutlinedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => MyRentalRejectDialog(id: state.id),
                    ),
                    child: Text("Reject"),
                  ),
                ],
              ),
            if (state.data?.state == .awaitingHandover)
              OutlinedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) =>
                      MyRentalHandoverDialog(rental: state.data!),
                ),
                child: Text("Handover"),
              ),
            if (state.data?.state == .awaitingReturnConfirmation)
              OutlinedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) =>
                      MyRentalConfirmReturnDialog(rental: state.data!),
                ),
                child: Text("Confirm Return"),
              ),
          ],
        ),
      ),
    );
  }
}
