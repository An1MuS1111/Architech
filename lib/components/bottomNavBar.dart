import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget{
  BottomNavBar({
    super.key,
    required this.pageIndex,
    required this.onTap
  });

  final int pageIndex;
  final Function(int) onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomNavItem(Icons.home_outlined, pageIndex == 0, onTap: () => onTap(0)),
          bottomNavItem(Icons.my_location_outlined, pageIndex == 1, onTap: () => onTap(1)),
          bottomNavItem(Icons.chat_bubble_outline, pageIndex == 2, onTap: () => onTap(2)),
          bottomNavItem(Icons.person_outline, pageIndex == 3, onTap: () => onTap(3))
        ]
      ),
    );
  }
}

Widget bottomNavItem(IconData icon, bool isSelected, {Function()? onTap}){
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: isSelected 
      ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: primaryColour,
          ),
          Divider(
            color: primaryColour,
            indent: 30,
            endIndent: 30,
            thickness: 3,
          )
        ],
      )
      : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: lightGrey,
          ),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            thickness: 3,
          )
        ],
      )
    )
  );
}