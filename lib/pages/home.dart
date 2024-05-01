import 'package:architech/components/logos.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  // const Home({super.key, required this.email});
  const Home({super.key});

  // final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, User",
              style: TextStyle(
                fontSize: mainTitle
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Column(
                children: [
                  Text(
                    "You have no updates yet"
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}