import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/viewModel/orderViewModel.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:architech/pages/order/orderDetails.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget{
  // Orders({super.key, this.order});

  // final OrderModel? order;

  // Testing
  Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders>{
  DateFormat dt = DateFormat("dd MMM");
  // Testing
  late List<OrderModel> orders;
  late OrderModel order1, order2;
  Orderviewmodel db = Orderviewmodel();

  @override
  void initState(){
    super.initState();
    orders = [];
    order1 = OrderModel();
    order2 = OrderModel();

    order1.status = "APR01M123";
    order1.name = "Mariam";
    order1.phoneNumber = "91208210381123";
    order1.pickupLocation = "KTC";
    order1.parcels = [
      ParcelModel("MY1234567890"),
      ParcelModel("DP0987654321")
    ];
    order1.selectedDate = DateTime.now();
    order1.selectedTime = DateTime.now();
    order1.selectedPayment = "Cash on delivery";

    order2.status = "APR02M456";
    order2.name = "Mariam";
    order2.phoneNumber = "012334234324";
    order2.pickupLocation = "KRP";
    order2.parcels = [
      ParcelModel("PQ9293121413"),
      ParcelModel("SPA123213154")
    ];
    order2.selectedDate = DateTime.parse("20240517");
    order2.selectedTime = DateTime.now();
    order2.selectedPayment = "Cash on delivery";

    orders.add(order1);
    orders.add(order2);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    // return Scaffold(
    //   appBar: topBar(context),
    //   bottomNavigationBar: bottomBar(context),
    //   floatingActionButton: SizedBox(
    //     width: width,
    //     child: outlinedBtn(context, "Place a new order", null, (){
    //       Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPlace()));
    //     })
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Center(
    //             child: Text(
    //               "Active Orders",
    //               style: TextStyle(
    //                 fontSize: 24
    //               ),
    //             ),
    //           ),
    //           Container(
    //             height: 250,
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: Column(
    //               children: [
    //                 if (widget.order == null && widget.order?.parcels == null) const Center(
    //                   child: Text(
    //                     "You have no active orders"
    //                   ),
    //                 ) else ListView.builder(
    //                   padding: EdgeInsets.zero,
    //                   shrinkWrap: true,
    //                   physics: NeverScrollableScrollPhysics(),
    //                   itemCount: widget.order?.parcels.length,
    //                   itemBuilder: (context, index){
    //                     return Container(
    //                       margin: EdgeInsets.only(bottom: 8),
    //                       child: Row(
    //                         children: [
    //                           Container(
    //                             width: 290,
    //                             decoration: BoxDecoration(
    //                               border: Border.all(
    //                                 color: Colors.black,
    //                                 width: 1
    //                               )
    //                             ),
    //                             child: Row(
    //                               children: [
    //                                 Column(
    //                                   children: [
    //                                     Text(
    //                                       "Order no. ${widget.order!.parcels[index].trackingNo}"
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 const Icon(
    //                                   Icons.arrow_right_rounded,
    //                                   color: Colors.black,
    //                                 )
    //                               ],
    //                             )
    //                           ),
    //                           const Expanded(
    //                             child: Text(
    //                               "18 Apr"
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     );  
    //                   }
    //                 )
    //               ],
    //             )
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Order history",
    //                   style: TextStyle(
    //                     fontSize: subTitle
    //                   ),
    //                 ),
    //                 const SizedBox(height: 10),
    //                 Text(
    //                   "You have no past orders",
    //                   style: TextStyle(
    //                     fontSize: regular
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      floatingActionButton: SizedBox(
        width: width,
        child: outlinedBtn(context, "Place a new order", null, (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPlace()));
        })
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  "Active Orders",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
              ),
            ),
            // Container(
            //   child: FutureBuilder(
            //     future: db.getAllOrders(),
            //     builder: (context, AsyncSnapshot<List<OrderModel>> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         return Text(snapshot.data![1].toString());
            //       } else if (snapshot.connectionState == ConnectionState.none) {
            //         return Text("No data");
            //       }
            //       return CircularProgressIndicator();
            //     },
            //   )
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index){
                  return Container(
                    width: width,
                    height: 80,
                    margin: EdgeInsets.only(bottom: 8),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          child: Text(
                            dt.format(orders[index].selectedDate!),
                            style: const TextStyle(
                              fontSize: 24
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Positioned(
                          right: -15,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => OrderDetails(order: orders[index]))
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 310,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order no. ${orders[index].status}"
                                      ),
                                      Text(
                                        "Parcel ${index + 1} is ${orders[index].parcels[index].parcelStatus}"
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  )
                                ],
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  );  
                }
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}