import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/database/order.model.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:flutter/material.dart';
import 'package:architech/database/database_service.dart';

class Orders extends StatefulWidget {
  // const Orders({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  DatabaseService service = DatabaseService();

  Future<List<OrderModel>>? orderList;
  List<OrderModel>? retrievedOrderList;

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    orderList = service.retrieveOrders();
    retrievedOrderList = await service.retrieveOrders();
  }

// ***
// Testing begins here
// ***

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      floatingActionButton: SizedBox(
          width: width,
          child: outlinedBtn(context, "Place a new order", null, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrderPlace()));
          })),

      //
      //
      body: SingleChildScrollView(
        // onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: orderList,
            builder: (BuildContext context,
                AsyncSnapshot<List<OrderModel>> snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    itemCount: retrievedOrderList!.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: ((direction) async {
                          await service.deleteOrder(
                              retrievedOrderList![index].id.toString());
                          // _dismiss();
                        }),
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
                                  arguments: retrievedOrderList![index]);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(retrievedOrderList![index].name),
                            subtitle: Text(
                                "${retrievedOrderList![index].pickUpLocation.address.toString()}, ${retrievedOrderList![index].pickUpLocation.address.toString()}"),
                            trailing: const Icon(Icons.arrow_right_sharp),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.done &&
                  retrievedOrderList!.isEmpty) {
                return Center(
                  child: ListView(
                    children: const <Widget>[
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('No data available')),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() {
      //     Navigator.pushNamed(context, '/add');
      //   }),
      //   tooltip: 'add',
      //   child: const Icon(Icons.add),
      // ),
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

