import 'package:architech/components/navBars.dart';
import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget{
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrder();
}

class _PlaceOrder extends State<PlaceOrder>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Fill in your details"),
      body: const Column(
        children: [],
      )
    );
  }
}