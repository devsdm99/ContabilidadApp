import 'package:flutter/material.dart';
import 'package:moneyapp/Database/db_provider.dart';
import 'package:moneyapp/Pages/profile_page.dart';
import 'package:moneyapp/Pages/transfer_page.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final _pageOptions = [
    TransferPage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO TEMPORAL LEER LA B ASE DE DATOS

    DBProvider.db.database;

    return SafeArea(
      child: Scaffold(
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: _navigationBar(),
      ),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          label: "Transfer",
          icon: Icon(
            Icons.compare_arrows,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: "Me",
          icon: Icon(
            Icons.person,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
