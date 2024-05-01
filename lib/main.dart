import 'package:architech/pages/login.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/signup.dart';
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
        '/': (context) => const Profile()
      }
    );
  }
}
