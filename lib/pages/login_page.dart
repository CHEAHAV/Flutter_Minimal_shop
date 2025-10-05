import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_connection.dart';
import 'package:minimal_shop/components/my_sign_button.dart';
import 'package:minimal_shop/components/my_text_field.dart';
import 'package:minimal_shop/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required void Function() onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();
  // instance of auth service
  var authService = AuthService();
  // email and password controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // hint passowrd
  bool passwordobscreText = true;
  void password() {
    setState(() {
      passwordobscreText = !passwordobscreText;
    });
  }

  // sign user in method
  void signUserIn(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      // If validation fails, the validator message will appear,
      // and we stop the function here.
      return;
    }
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    if(context.mounted) {
      Navigator.pop(context);
    }
    try {
      await authService.signinWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      if (context.mounted) {
        Navigator.pushNamed(context, '/intro_page');
      }
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    // logo// logo
                    child: Center(child: Icon(Icons.lock, size: 100)),
                  ),
                  // welcome back
                  SizedBox(height: 25),
                  Text(
                    "Welcome back to login minimal shop!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),

                  // email textfield
                  SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscreText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email. like...@gmail.com';
                      }
                      // Simple email format check
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      if (value.length != emailController.text.length) {
                        return 'Email is incorrect.';
                      }
                      return null; // Return null if validation passes
                    },
                  ),

                  // password textfield
                  SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscreText: passwordobscreText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      if (value.length != passwordController.text.length) {
                        return 'Password is incorrect.';
                      }
                      return null; // Return null if validation passes
                    },
                    suffixIcon: IconButton(
                      onPressed: password,
                      icon: Icon(
                        passwordobscreText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),

                  // forget password
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forget Password?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),

                  // signin button
                  SizedBox(height: 25),
                  MySignButton(
                    onTap: () {
                      signUserIn(context);
                    },
                    text: "Sign In",
                  ),

                  // or continure with
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                      Text(
                        "Or Continue with",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ],
                  ),

                  // google and apple
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyConnection(
                        onTap: () {},
                        imagePath: 'assets/icons/google.png',
                      ),
                      SizedBox(width: 10),
                      MyConnection(
                        onTap: () {},
                        imagePath: 'assets/icons/apple.png',
                      ),
                    ],
                  ),

                  // not a member resgister now
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/register_page'),
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
