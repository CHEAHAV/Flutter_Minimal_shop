import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_connection.dart';
import 'package:minimal_shop/components/my_sign_button.dart';
import 'package:minimal_shop/components/my_text_field.dart';
import 'package:minimal_shop/services/auth_service.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key, required void Function() onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();

  // controller
  final userController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  // hint password
  bool obscreTextpassword = true;
  void password() {
    setState(() {
      obscreTextpassword = !obscreTextpassword;
    });
  }

  var authService = AuthService();
  // register method
  void registerUser(BuildContext context) async {
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
    if (context.mounted) {
      Navigator.pop(context);
    }
    try {
      await authService.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      // success sign up
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  // logo
                  Center(child: Icon(Icons.lock, size: 100)),

                  SizedBox(height: 25),
                  // text
                  Text("You can register now...!"),

                  // user
                  SizedBox(height: 25),
                  MyTextField(
                    controller: userController,
                    hintText: "User",
                    obscreText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Username.';
                      }
                      return null;
                    },
                  ),

                  // email
                  SizedBox(height: 10),
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscreText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email.';
                      }
                      // Simple email format check
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null; // Return null if validation passes
                    },
                  ),

                  // password
                  SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscreText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email. like...@gmail.com';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null; // Return null if validation passes
                    },
                    suffixIcon: IconButton(
                      onPressed: password,
                      icon: obscreTextpassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),

                  // comfirm password
                  SizedBox(height: 10),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscreText: obscreTextpassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      if (value != passwordController.text) {
                        return 'Password and Confirm password must be matching.';
                      }
                      return null; // Return null if validation passes
                    },
                    suffixIcon: IconButton(
                      onPressed: password,
                      icon: obscreTextpassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),

                  // Signup
                  SizedBox(height: 25),
                  MySignButton(
                    onTap: () {
                      registerUser(context);
                    },
                    text: "Sign UP",
                  ),

                  // continue with
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          endIndent: 10,
                        ),
                      ),
                      Text("Or Continue with"),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),

                  // image google and apple
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google
                      MyConnection(
                        imagePath: ('assets/icons/google.png'),
                        onTap: () {},
                      ),
                      SizedBox(width: 10),
                      // apple
                      MyConnection(
                        imagePath: ('assets/icons/apple.png'),
                        onTap: () {},
                      ),
                    ],
                  ),

                  // login text
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Are you already have an account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
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
