import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';

import 'cubit.dart';
import 'state.dart';

class MyOrderDetailPage extends StatelessWidget {
  final int id;

  const MyOrderDetailPage({super.key, required this.id});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyOrderDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyOrderDetailCubit(id: id, orderRepository: context.read()),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: Text("Order")),
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
    return BlocConsumer<MyOrderDetailCubit, MyOrderDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error!.source == .data ? SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyOrderDetailCubit>().onRefresh(),
              ) : null,
            ),
          );
          context.read<MyOrderDetailCubit>().onErrorHandled(state.error!);
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
          // TODO: User Detail Page, Cancel note, Cancel reason
          Text("State"),
          Text(state.data?.state.toString() ?? "-"),
          Text("Date"),
          Text(
            "${state.data?.startDate ?? "-"} - ${state.data?.endDate ?? "-"}",
          ),
          Text("Quantity"),
          Text(state.data?.quantity.toString() ?? "-"),
          if (state.data?.state == .readyForPickup)
            OutlinedButton(
              onPressed: () => context.read<MyOrderDetailCubit>().onReceive(),
              child: Text("Receive"),
            ),
        ],
      ),
    );
  }
}
