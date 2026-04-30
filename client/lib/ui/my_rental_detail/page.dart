import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';
import 'package:openrent_client/ui/my_rental_detail/cubit.dart';
import 'package:openrent_client/ui/my_rental_detail/reject/dialog.dart';
import 'package:openrent_client/ui/my_rental_detail/state.dart';

class MyRentalDetailPage extends StatelessWidget {
  final int id;

  const MyRentalDetailPage({super.key, required this.id});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyRentalDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyRentalDetailCubit(id: id, rentalRepository: context.read()),
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error!.source == .data
                  ? SnackBarAction(
                      label: "Refresh",
                      onPressed: () =>
                          context.read<MyRentalDetailCubit>().onRefresh(),
                    )
                  : null,
            ),
          );
          context.read<MyRentalDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Text("Product"),
          Text(state.data?.product.name ?? "-"),
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
                : () => Navigator.of(
              context,
            ).push(MessagesPage.route(otherUserId: state.data!.user.id)),
            child: Text("Chat"),
          ),
          // TODO: User Detail Page, Cancel note, Cancel reason
          Text("State"),
          Text(state.data?.state.toString() ?? "-"),
          Text("Date"),
          Text(
            "${state.data?.startDate ?? "-"} - ${state.data?.endDate ?? "-"}",
          ),
          Text("Quantity"),
          Text(state.data?.quantity.toString() ?? "-"),
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
              onPressed: () => context.read<MyRentalDetailCubit>().onHandover(),
              child: Text("Handover"),
            ),
          if (state.data?.state == .awaitingReturnConfirmation)
            OutlinedButton(
              onPressed: () => context.read<MyRentalDetailCubit>().onConfirmReturn(),
              child: Text("Confirm Return"),
            ),
        ],
      ),
    );
  }
}
