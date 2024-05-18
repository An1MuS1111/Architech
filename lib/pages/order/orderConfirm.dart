import 'package:architech/components/cards.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:flutter/material.dart';

class OrderConfirm extends StatefulWidget{
  OrderConfirm({super.key, required this.order});

  final OrderModel order;

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  List<String> paymentOptions = [
    "Cash on Delivery",
    "QR Payment"
  ];

  List paymentAvailability = [
    null,
    "Coming soon"
  ];

  List paymentIcons = [
    Icons.attach_money_outlined,
    null
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: titleBar(context, "Fill in your details", 60),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirm()));
          })
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              child: const Text(
                "Your order",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.order.dateConverter(),
                      style: TextStyle(
                        fontSize: subTitle,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "User Phone No",
                      style: TextStyle(
                        fontSize: subTitle,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "User Pickup Location",
                      style: TextStyle(
                        fontSize: subTitle,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Registered parcels",
                style: TextStyle(
                  fontSize: regular
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Parcel 1",
                      style: TextStyle(
                        fontSize: mainTitle
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tracking no"
                      ),
                      Text(
                        "MY1234567890"
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Criterias"
                      ),
                      Text(
                        "2-3kg, Fragile"
                      )
                    ],
                  )
                ],
              )
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: mainTitle
                          ),
                        ),
                        Text(
                          "RM6.00",
                          style: TextStyle(
                            fontSize: mainTitle,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parcel Price",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                      Text(
                        "RM1.00 x 2",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery centre charge",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                      Text(
                        "RM1.00 x 2",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Criteria (2-3kg) charge",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                      Text(
                        "RM2.00",
                        style: TextStyle(
                          color: greyColour
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Registered parcels",
                style: TextStyle(
                  fontSize: regular
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (count, index){
                    return squareCard(paymentOptions[index], paymentAvailability[index], paymentIcons[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}