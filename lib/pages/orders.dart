import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/pages/order/orderDetails.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:architech/viewModel/orderViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key, required int tab});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrderViewModel service = OrderViewModel();
  // late Future<List<OrderModel>> orderList;

  @override
  void initState() {
    super.initState();
    // _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    setState(() {
      // orderList = service.retrieveOrders();
    });
  }

  Future<void> _refreshOrders() async {
    await _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: topBar(context),
      floatingActionButton: SizedBox(
        width: width,
        child: outlinedBtn(
          context,
          "Place a new order",
          null,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderPlace(),
              ),
            );
          },
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
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: RefreshIndicator(
                  onRefresh: _refreshOrders,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FutureBuilder<List<OrderModel>>(
                      future: service.retrieveOrders(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<OrderModel>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: const Text('No data available'));
                        } else {
                          List<OrderModel> orders = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              final order = orders[index];
                              return Container(
                                width: double.infinity,
                                height: 80,
                                margin: EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        // Format the date appropriately
                                        "18 April",
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigate to order details
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => OrderDetails(order: order))
                                        // );
                                      },
                                      borderRadius: BorderRadius.circular(15),
                                      child: Expanded(
                                        child: Container(
                                          // width: 310,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 25),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Order no. ${order.status}"),
                                                  // Check if the parcels list is not empty before accessing it
                                                  order.parcels.isNotEmpty == true
                                                  ?  Text(
                                                      // "Parcel 1 is ${order.parcels[index].trackingNumber}",
                                                      "Parcel MY12471920${index}"
                                                    )
                                                  : Text("No parcels")
                                                ],
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    // child: FutureBuilder<List<OrderModel>>(
                    //     future: service.retrieveOrders(),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<List<OrderModel>> snapshot) {
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.waiting) {
                    //         return const Center(
                    //             child: CircularProgressIndicator());
                    //       } else if (snapshot.hasError) {
                    //         return Center(
                    //             child: Text('Error: ${snapshot.error}'));
                    //       } else if (!snapshot.hasData ||
                    //           snapshot.data!.isEmpty) {
                    //         return Center(
                    //             child: const Text('No data available'));
                    //       } else {
                    //         List<OrderModel> orders = snapshot.data!;
                    //
                    //         return ListView.builder(
                    //             padding: EdgeInsets.zero,
                    //             shrinkWrap: true,
                    //             physics: const NeverScrollableScrollPhysics(),
                    //             itemCount: orders.length,
                    //             itemBuilder: (context, index) {
                    //               return Container(
                    //                 width: width,
                    //                 height: 80,
                    //                 margin: EdgeInsets.only(bottom: 8),
                    //                 child: Stack(
                    //                   alignment: Alignment.centerLeft,
                    //                   children: [
                    //                     Container(
                    //                       child: Text(
                    //                         // dt.format(orders[index].selectedDate!),
                    //                         "18 April",
                    //                         style:
                    //                             const TextStyle(fontSize: 24),
                    //                       ),
                    //                     ),
                    //                     const SizedBox(width: 10),
                    //                     Positioned(
                    //                       right: -15,
                    //                       child: InkWell(
                    //                         onTap: () {
                    //                           // Navigator.push(
                    //                           //   context,
                    //                           //   MaterialPageRoute(builder: (context) => OrderDetails(order: orders[index]))
                    //                           // );
                    //                         },
                    //                         borderRadius:
                    //                             BorderRadius.circular(15),
                    //                         child: Container(
                    //                             width: 310,
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                     vertical: 10,
                    //                                     horizontal: 25),
                    //                             decoration: BoxDecoration(
                    //                                 border: Border.all(
                    //                                     color: Colors.black,
                    //                                     width: 1),
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         15)),
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment
                    //                                       .spaceBetween,
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.center,
                    //                               children: [
                    //                                 Column(
                    //                                   mainAxisAlignment:
                    //                                       MainAxisAlignment
                    //                                           .center,
                    //                                   crossAxisAlignment:
                    //                                       CrossAxisAlignment
                    //                                           .start,
                    //                                   children: [
                    //                                     Text(
                    //                                         "Order no. ${orders[index].status}"),
                    //                                     Text(
                    //                                         "Parcel ${index + 1} is ${orders[index].parcels[index].parcelStatus}"),
                    //                                   ],
                    //                                 ),
                    //                                 const Icon(
                    //                                   Icons
                    //                                       .arrow_forward_rounded,
                    //                                   color: Colors.black,
                    //                                   size: 24,
                    //                                 )
                    //                               ],
                    //                             )),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               );
                    //             });
                    //       }
                    //     }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order history",
                      style: TextStyle(fontSize: subTitle),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You have no past orders",
                      style: TextStyle(fontSize: regular),
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