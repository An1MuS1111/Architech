import 'package:architech/pages/login.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/placeOrder.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // routerConfig: _routers
        routes: {
          // '/': (context) => const Home()
          '/': (context) => Orders()
        });
  }
}
