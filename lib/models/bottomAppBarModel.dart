import 'package:architech/config/theme.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomAppBarModel{
  final Icon icon;
  final bool isActive;

  BottomAppBarModel({required this.icon, this.isActive = false});
}

List<BottomAppBarModel> barItems = [
  BottomAppBarModel(
    icon: Icon(
      Icons.home_outlined,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.my_location_outlined,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.chat_bubble_outline,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.person_outline,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Profile()) 
  ),
];

List<BottomAppBarModel> adminBarItems = [
  BottomAppBarModel(
    icon: Icon(
      Icons.home_outlined,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.calendar_today,
      color: greyColour,
      size: 28
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.people_sharp,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.settings_rounded,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Profile()) 
  ),
];