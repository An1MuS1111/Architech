import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:architech/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isInputFilled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                appLogo("assets/logo_full.png", 300),
                const SizedBox(height: 30),
                Text(
                  "Log into your account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 30),
                textFormField("UTM Email", "Enter your registered email", false,
                    emailController, validateEmail),
                const SizedBox(height: 20),
                textFormField("Password", "Enter your password", true,
                    passwordController, validatePassword),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textLink(
                          context, "Forgot password?", "", Colors.black),
                      onTap: () => {},
                    )),
                const SizedBox(height: 100),
                // mainBtn(context, "Login", true, () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const Home()));
                // }),
                mainBtn(context, "Login", true, () async {
                  try {
                    final userCredential =
                        await _auth.signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );

                    if (userCredential != null) {
                      // Navigate to home screen or show success message
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    } else {
                      // Handle login failure (should never happen in this case)
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      // Display error: "User not found"
                    } else if (e.code == 'wrong-password') {
                      // Display error: "Invalid password"
                    } else {
                      // Display generic error message
                    }
                  }
                }),

                InkWell(
                  child: textLink(
                      context, "No account? ", "Sign up here", Colors.black),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email!.isEmpty) {
      return 'Please enter your email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password.';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }
}
