import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/placeOrder.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget{
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders>{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlaceOrder())
          ),
        },
        child: SizedBox(
          width: width,
          child: outlinedBtn("Place a new order")
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Active Orders",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Column(
                  children: [
                    Center(
                      child: Text(
                        "You have no active orders"
                      ),
                    ),
                  ],
                )
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order history",
                      style: TextStyle(
                        fontSize: subTitle
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You have no past orders",
                      style: TextStyle(
                        fontSize: regular
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}