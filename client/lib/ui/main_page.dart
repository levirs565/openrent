import 'package:flutter/material.dart';
import 'package:openrent_client/ui/chats/page.dart';
import 'package:openrent_client/ui/home/page.dart';
import 'package:openrent_client/ui/my_orders/page.dart';
import 'package:openrent_client/ui/my_products/page.dart';
import 'package:openrent_client/ui/profile/page.dart';
import 'package:openrent_client/ui/search/page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MainPage());
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatsPage(),
    MyOrdersPage(),
    MyProductsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
