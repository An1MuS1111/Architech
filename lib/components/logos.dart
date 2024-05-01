import 'package:flutter/material.dart';

Center bigLogo(String logoName){
  return Center(
    child: Image.asset(
      logoName,
      fit: BoxFit.fitWidth,
      width: 300,
    )
  );
}