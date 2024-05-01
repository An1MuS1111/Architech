import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
          child: Column(
            children: [
              Container(
                
              ),
              const Text(
                "Full Name"
              ),
              Container(),
              Container(),
              Container(),
              logoutBtn(),
              textLink(context, "Delete account", "", greyColour)
            ],
          ),
        ),
      ),
    );
  }
}