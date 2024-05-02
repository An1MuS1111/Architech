import 'package:architech/components/logos.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:flutter/material.dart';
import 'package:architech/models/user.dart';

class Home extends StatelessWidget{
  // const Home({super.key, required this.email});
  const Home({super.key}) : super(key: key);

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
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                user.logout(); // Call the logout method
              },
              child: Text('Logout'),  
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return ElevatedButton(
      onPressed: () {
        user.logout();
      },
      child: Text('Logout'),
    );
  }
}