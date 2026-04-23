import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/my_rental_detail/page.dart';

import 'cubit.dart';
import 'state.dart';

class MyRentalsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => MyRentalsCubit(rentalRepository: context.read()),
          child: _MyRentalsPageContent(),
        ),
      ),
    );
  }
}

class _MyRentalsPageContent extends StatelessWidget {
  const _MyRentalsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalsCubit, MyRentalsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyRentalsCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MyRentalsCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) =>
                  _RentalItem(item: state.list.elementAt(index)),
            ),
          ),
        ],
      ),
    );
  }
}

class _RentalItem extends StatelessWidget {
  final RentalResponseItem item;

  const _RentalItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MyRentalDetailPage.route(item.id)),
        child: Column(
          children: [
            Text("${item.user.name} - ${item.product.name}"),
            Text("${item.startDate} - ${item.endDate}"),
            Text("${item.quantity} - ${item.state}"),
          ],
        ),
      ),
    );
  }
}
