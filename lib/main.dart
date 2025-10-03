import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:minimal_shop/pages/card_page.dart';
import 'package:minimal_shop/pages/intro_page.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/card_page': (context) => CardPage(),
      },
    );
  }
}
