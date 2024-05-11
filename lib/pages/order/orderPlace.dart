import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/pages/order/orderCriteria.dart';
import 'package:flutter/material.dart';

class OrderPlace extends StatefulWidget{
  const OrderPlace({super.key});

  @override
  State<OrderPlace> createState() => _OrderPlace();
}

class _OrderPlace extends State<OrderPlace>{
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Fill in your details", 60),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderCriteria()));
          })
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              textFormField("Name", "Enter receiver's name", false, controller, (){}),
              textFormField("Phone number", "Enter receiver's phone no", false, controller, (){}),
              textFormField("Pickup location", "Where will you pick up your order? ", false, controller, (){}),
              const SizedBox(height: 30),
              textFormField("Parcel tracking no", "Enter tracking no", false, controller, (){}),
              outlinedBtn(context, null, Icons.add, (){}),
            ],
          ),
        ),
      )
    );
  }
}