import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Your UI widgets here
            mainBtn(context, "Login", true, () {
              user.login(emailController.text, passwordController.text);
            }),
          ],
        ),
      ),
    );
  }
}