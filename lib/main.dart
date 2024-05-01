import 'package:architech/components/bottomAppBar.dart';
import 'package:architech/login.dart';
import 'package:architech/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // routerConfig: _routers
      routes: {
        '/': (context) => const Login()
      }
    );
  }
}
