import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';
import 'package:openrent_client/ui/my_products/cubit.dart';
import 'package:openrent_client/ui/my_products/state.dart';
import 'package:openrent_client/ui/product_form/page.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyProductsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductsCubit(productRepository: context.read()),
      child: Scaffold(
        appBar: AppBar(title: Text("My Products")),
        body: _MyProductsPageContent(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(ProductFormPage.routeAdd()),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _MyProductsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProductsCubit, MyProductsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyProductsCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MyProductsCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  _MyProductsItem(item: state.data.elementAt(index)),
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: This simmiliar to ProductCard, but this will use List instead of grid
class _MyProductsItem extends StatelessWidget {
  final ProductResponseItemShort item;

  const _MyProductsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MyProductDetailPage.route(item.id)),
        child: Column(
          children: [
            Text(item.name),
            Text("${item.pricePerDay} Per Day - ${item.stock} Stock"),
            Text("${item.address.regency} - ${item.user.name}"),
          ],
        ),
      ),
    );
  }
}
