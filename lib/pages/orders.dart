import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/order.model.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:architech/viewModel/orderViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:architech/viewModel/orderViewModel.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrderViewModel service = OrderViewModel();
  late Future<List<OrderModel>> orderList;

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    setState(() {
      orderList = service.retrieveOrders();
    });
  }

  Future<void> _refreshOrders() async {
    await _initRetrieval();
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
          child: outlinedBtn(context, "Place a new order", null, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrderPlace()));
          })),
      body: RefreshIndicator(
        onRefresh: _refreshOrders,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<OrderModel>>(
            future: orderList,
            builder: (BuildContext context,
                AsyncSnapshot<List<OrderModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: const Text('No data available'));
              } else {
                List<OrderModel> orders = snapshot.data!;
                return ListView.separated(
                    itemCount: orders.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) async {
                          await service
                              .deleteOrder(orders[index].id.toString());
                          _refreshOrders();
                        },
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16.0)),
                          padding: const EdgeInsets.only(right: 28.0),
                          alignment: AlignmentDirectional.centerEnd,
                          child: const Text(
                            "DELETE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        resizeDuration: const Duration(milliseconds: 200),
                        key: UniqueKey(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 83, 80, 80),
                              borderRadius: BorderRadius.circular(16.0)),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "/edit",
                                  arguments: orders[index]);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(orders[index].name),
                            subtitle: Text(
                                "${orders[index].pickUpLocation.address}, ${orders[index].pickUpLocation.address}"),
                            trailing: const Icon(Icons.arrow_right_sharp),
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}



// ***
// The testing ends here
// ***
  // @override
  // Widget build(BuildContext context) {
  //   double width = MediaQuery.of(context).size.width * 0.9;

  //   return Scaffold(
  //     appBar: topBar(context),
  //     bottomNavigationBar: bottomBar(context),
  //     floatingActionButton: SizedBox(
  //         width: width,
  //         child: outlinedBtn(context, "Place a new order", null, () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const OrderPlace()));
  //         })),

  //     //
  //     //
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Center(
  //               child: Text(
  //                 "Active Orders",
  //                 style: TextStyle(fontSize: 24),
  //               ),
  //             ),
  //             Container(
  //                 height: 250,
  //                 padding: const EdgeInsets.symmetric(vertical: 10),
  //                 child: const Column(
  //                   children: [
  //                     Center(
  //                       child: Text("You have no active orders"),
  //                     ),
  //                   ],
  //                 )),
  //             Container(
  //               padding: const EdgeInsets.symmetric(vertical: 10),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Order history",
  //                     style: TextStyle(fontSize: subTitle),
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Text(
  //                     "You have no past orders",
  //                     style: TextStyle(fontSize: regular),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

