import 'package:flutter/material.dart';
import 'package:openrent_client/ui/my_products/list/tab.dart';
import 'package:openrent_client/ui/my_products/rentals/tab.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Produk Saya'),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List Barang'),
              Tab(text: 'List Rental'),
            ],
          ),
        ),
        body: const TabBarView(children: [MyProductListTab(), MyRentalsTab()]),
      ),
    );
  }
}
