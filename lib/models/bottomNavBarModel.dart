import 'package:flutter/material.dart';

class BottomNavBarModel{
  BottomNavBarModel({
    required this.page,
    required this.navKey
  });

  final Widget page;
  final GlobalKey<NavigatorState> navKey;
}