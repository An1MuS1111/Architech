import 'package:architech/components/customDropdown.dart';
import 'package:architech/components/displayAddParcels.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/components/searchLocation.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/controllers/providers/orderPlaceProvider.dart';
import 'package:architech/controllers/providers/orderScheduleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPlace extends StatefulWidget {
  const OrderPlace({super.key});

  @override
  State<OrderPlace> createState() => _OrderPlace();
}

class _OrderPlace extends State<OrderPlace> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      OrderPlaceProvider orderPlaceProvider = Provider.of<OrderPlaceProvider>(context, listen: false);
      orderPlaceProvider.initFunction();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: titleBar(context, "Fill in your details", 60),
        floatingActionButton:
            Consumer2<OrderPlaceProvider, OrderScheduleProvider>(builder:
                (context, orderPlaceProvider, orderScheduleProvider, _) {
          return InkWell(
            onTap: () => {Navigator.pop(context)},
            child: SizedBox(
              child: mainBtn(
                isLoading: orderPlaceProvider.isLoading,
                context,
                "Proceed",
                false,
                () {
                  orderScheduleProvider.changeInitalTime();
                  orderPlaceProvider.proceedFillDetailsFunction(context);
                },
              ),
            ),
          );
        }),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 85),
              child: Consumer2<OrderPlaceProvider, OrderScheduleProvider>(
                  builder: (context, orderPlaceProvider,
                      orderScheduleProvider, _) {
                return Column(
                  children: [
                    textFormField("Name", "Enter receiver's name", orderPlaceProvider.nameController, () {}),
                    textFormField("Phone number", "Enter receiver's phone no", orderPlaceProvider.phoneController, () {}, keyboardType: TextInputType.number),
                    // textFormField("Pickup location", "Where will you pick up your order? ", orderPlaceProvider.pickupController,() {}),
                    SearchLocation(),
                    const SizedBox(height: 30),
                    CustomDropDown(title: "Delivery Centre", selectedValue: orderPlaceProvider.selectedValue, itemList: orderPlaceProvider.itemList),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Parcel tracking no",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    displayAddParcels(orderPlaceProvider.widgets),
                    outlinedBtn(context, null, Icons.add,() {
                        orderPlaceProvider
                          .trackingParcelTextFiledCreator();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}