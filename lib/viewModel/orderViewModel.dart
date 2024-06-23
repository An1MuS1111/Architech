import 'package:architech/models/orderModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addOrder(OrderModel orderData) async {
    await _db.collection("orders").add(orderData.toJson());
  }

  updateOrder(OrderModel orderData) async {
    await _db.collection("orders").doc(orderData.orderId).update(orderData.toJson());
  }

  Future<void> deleteOrder(String documentId) async {
    await _db.collection("orders").doc(documentId).delete();
  }

  Future<List<OrderModel>> retrieveOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("orders").get();
        
    return snapshot.docs
        .map((docSnapshot) => OrderModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
