import 'package:flutter/material.dart';

// TODO: Complete this widget
Container supportCards(
  double width, 
  Color colour,
  Icons icon, 
  double height, 
  String text){
  return Container(
    alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFF9446),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Row(
        children: [
          Icon(
            Icons.arrow_outward_rounded,
            size: 24,
            color: Colors.black
          ),
          SizedBox(width: 15),
          Text(
            "Read about us",
            style: TextStyle(
              fontSize: 18
            ),
          ),
        ],
      ),
  );
}