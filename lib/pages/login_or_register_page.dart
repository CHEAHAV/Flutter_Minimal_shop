import 'package:flutter/material.dart';
import 'package:minimal_shop/pages/login_page.dart';
import 'package:minimal_shop/pages/register_page.dart';

class LoginOrRegesterPage extends StatefulWidget {
  const LoginOrRegesterPage({super.key});

  @override
  State<LoginOrRegesterPage> createState() => _LoginOrRegesterPageState();
}

class _LoginOrRegesterPageState extends State<LoginOrRegesterPage> {
  // initailly show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return Registerpage(onTap: togglePages);
    }
  }
}
