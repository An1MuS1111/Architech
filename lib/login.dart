import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isInputFilled = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: [
                bigLogo("assets/logo_full.png"),
                const SizedBox(height: 50),
                Text(
                  "Log into your account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 50),
                textField("UTM Email", "Enter your registered email", false, emailController),
                const SizedBox(height: 20),
                textField("Password", "Enter your password", true, passwordController),
                const SizedBox(height: 30),
                mainBtn(context, "Login", true, (){}),
                const SizedBox(height: 20),
                textLink(context, "No account? ", "Sign up here", (){})
              ],
            ), 
          ),
        ),
      ),
    );
  }
}