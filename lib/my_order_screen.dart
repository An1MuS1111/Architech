import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:architech/database/order.model.dart';
import 'package:flutter/material.dart';

Future<List<OrderModel>> getOrders() async {
  try {
    // Get orders with specific status
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    QuerySnapshot snapshot =
        await orders.where('status', isEqualTo: 'pending').get();

    List<OrderModel> orderList = [];
    for (var doc in snapshot.docs) {
      orderList.add(OrderModel.fromFirestore(doc));
    }
    return orderList;
  } catch (error) {
    // Handle error here (e.g., print error message)
    print("Error getting orders: $error");
    // You can also re-throw the error or return an empty list
    // re-throw error;
    return [];
  }
}

class MyOrdersScreen extends StatefulWidget {
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  Future<List<OrderModel>>? futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: futureOrders == null
          ? Center(child: CircularProgressIndicator())
          : _buildOrderList(futureOrders!),
    );
  }

  Widget _buildOrderList(Future<List<OrderModel>> orders) {
    return FutureBuilder<List<OrderModel>>(
      future: orders,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<OrderModel> orderList = snapshot.data!;
          return ListView.builder(
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              OrderModel order = orderList[index];
              // Use order data to build your desired UI (e.g., ListTile)
              return ListTile(
                title: Text(order.name),
                subtitle: Text(order.status),
                trailing: Text(order.totalPrice.toString()),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
