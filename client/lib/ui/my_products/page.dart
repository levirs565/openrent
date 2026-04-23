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
          title: Text("My Products"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Product List"),
              Tab(text: "Rentals"),
            ],
          ),
        ),
        body: TabBarView(children: [MyProductListTab(), MyRentalsTab()]),
      ),
    );
  }
}
