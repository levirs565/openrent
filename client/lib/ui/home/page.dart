import 'package:flutter/material.dart';
import 'package:openrent_client/ui/search/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(SearchPage.route()),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
            child: Text("Cari barang"),
          ),
        ),
      ),
    );
  }
}
