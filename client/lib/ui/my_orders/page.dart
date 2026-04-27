import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/ui/my_order_detail/page.dart';
import 'package:openrent_client/ui/my_orders/cubit.dart';
import 'package:openrent_client/ui/my_orders/state.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(orderRepository: context.read()),
      child: ScaffoldMessenger(child: Scaffold(
        body: _Content(), appBar: AppBar(title: Text("My Orders"),),)),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyOrdersCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MyOrdersCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) =>
                  _Item(item: state.list.elementAt(index)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final OrderResponseItem item;

  const _Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MyOrderDetailPage.route(item.id)),
        child: Column(children: [
          Text("${item.user.name} - ${item.product.name}"),
          Text("${item.startDate} - ${item.endDate}"),
          Text("${item.quantity} - ${item.state}"),
          if (item.review == null && item.state == .completed)
            OutlinedButton(onPressed: () {}, child: Text("Add Review")),
        ],),
      ),
    );
  }
}
