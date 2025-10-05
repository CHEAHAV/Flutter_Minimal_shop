import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/firebase_options.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:minimal_shop/pages/auth_page.dart';
import 'package:minimal_shop/pages/card_page.dart';
import 'package:minimal_shop/pages/intro_page.dart';
import 'package:minimal_shop/pages/login_page.dart';
import 'package:minimal_shop/pages/register_page.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      routes: {
        '/login_page': (context) => LoginPage(
          onTap: () {
            Navigator.pushNamed(context, '/register_page');
          },
        ),
        '/register_page': (context) => Registerpage(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/card_page': (context) => CardPage(),
      },
    );
  }
}
