import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:architech/pages/admin/adminHome.dart';
import 'package:architech/pages/admin/adminOrders.dart';
import 'package:architech/pages/admin/adminProfile.dart';
import 'package:architech/pages/admin/adminUsers.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

AppBar topBar(BuildContext context){
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(tab: 1)));
        },
        child: appLogo("assets/logo_small.png", 130)
      ),
    ),
    leadingWidth: 160,
  );
}

AppBar titleBar(BuildContext context, String text, double margin){
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 24,
        color: Colors.black
      ),
      onPressed: (){
        Navigator.pop(context);
      }
    ),
    title: Container(
      margin: EdgeInsets.only(left: margin),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: mainTitle
        )
      ),
    ),
  );
}

// Topbar for adminHome
AppBar adminHomeTopBar(BuildContext context){
  return AppBar(
    backgroundColor: secondaryColour,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: appLogo("assets/logo_small.png", 130)
      ),
    ),
    leadingWidth: 160,
  );
}