import 'package:flutter/material.dart';
import 'package:moneyapp/Pages/profile_page.dart';
import 'package:moneyapp/Pages/splash_page.dart';
import 'package:moneyapp/Pages/transfer_page.dart';

import 'Pages/navigation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'nav': (context) => NavPage(),
        'transfer': (context) => TransferPage(),
        'profile': (context) => ProfilePage(),
      },
    );
  }
}
