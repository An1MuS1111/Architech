import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/home.dart';
import 'package:architech/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isInputFilled = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, height * 0.1, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                bigLogo("assets/logo_full.png"),
                const SizedBox(height: 30),
                Text(
                  "Log into your account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 30),
                textField("UTM Email", "Enter your registered email", false, emailController),
                const SizedBox(height: 20),
                textField("Password", "Enter your password", true, passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: textLink(context, "Forgot password?", ""),
                    onTap: () => {},
                  )
                ),
                const SizedBox(height: 100),
                mainBtn(context, "Login", true, (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Home())
                  );
                }),
                InkWell(
                  child: textLink(context, "No account? ", "Sign up here"),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup())),
                ),
              ],
            ), 
          ),
        ), 
      ),
    );
  }
}