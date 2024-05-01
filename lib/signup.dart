import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, height * 0.1, 20, 0),
            child: Column(
              children: [
                bigLogo("assets/logo_full.png"),
                const SizedBox(height: 30),
                Text(
                  "Sign up an account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 30),
                textField("UTM Email", "Enter your registered email", false, emailController),
                const SizedBox(height: 20),
                textField("Password", "Enter your password", true, passwordController),
                const SizedBox(height: 20),
                textField("Confirm Password", "Enter your password again", true, passwordController),
                const SizedBox(height: 30),
                mainBtn(context, "Sign up", true, (){}),
                textLink(context, "Have an account? ", "Log in here", (){})
              ],
            ), 
          ),
        ),
      ),
    );
  }
}