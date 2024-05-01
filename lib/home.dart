import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  // const Home({super.key, required this.email});
  const Home({super.key});

  // final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo_full.png"
          ),
        ),
        leadingWidth: 100,
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        child: BottomAppBar(
          color: Colors.black,
        ),
      ),
      body: const Column(
        children: [
          Text(
            "Welcome, username",
          ),
          Text(
            "You have no orders yet."
          ),
        ]
      )
    );
  }
}