import 'package:architech/components/processStatus.dart';
import 'package:architech/pages/login.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/order/orderConfirm.dart';
import 'package:architech/pages/order/orderCriteria.dart';
import 'package:architech/pages/order/orderSchedule.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/signup.dart';
import 'package:flutter/material.dart';

import 'package:architech/my_order_screen.dart';

// import 'package:architech/config/router.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architech',
      // home: LoadingPage(title: "Processing order...", note: "Please do not close the window or exit the application"),
      // home: OrderCriteria()
      home: MainPage(),
      // home: MyOrdersScreen(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something went Wrong'));
              } else if (snapshot.hasData) {
                return Home();
              } else {
                return Login();
              }
            }),
      );
}
