import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Testing
class Orderviewmodel{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create order
  Future createOrder(OrderModel order) async{
    final docOrder = firestore.collection("orders").doc();

    final order = OrderModel();
    order.orderId = docOrder.id;
    order.name = "Mariam";
    order.phoneNumber = "01239172612";
    order.pickupLocation = "KTC S21";
    order.deliveryCentre = "OPC";
    order.parcels = [];
    order.selectedDate = DateTime.now();
    order.selectedTime = DateTime.now();
    order.selectedPayment = "Cash on delivery";
    order.totalPaid = 6;
    order.status = "Being processed";

    final orderJson = order.toJson();
    await docOrder.set(orderJson);
  }

  // Read all orders
  Future<List<OrderModel>> getAllOrders() async{
    List<OrderModel> orderList = [];

    try{
      await firestore.collection("orders").get().then((value) => {
        value.docs.forEach((element) {
          Map mapData = value as Map<dynamic, dynamic>;
          print(mapData);

          OrderModel order = OrderModel();
          List<ParcelModel> parcelList = mapData["parcels"];

          order.orderId = element.id;
          order.name = mapData["name"];
          order.phoneNumber = mapData["phoneNumber"];
          order.pickupLocation = mapData["pickupLocation"];
          order.deliveryCentre = mapData["delivery"];
          // order.parcels = parcelList.map((data) => ParcelModel(data).toList());
          order.parcels = mapData["parcels"];
          order.selectedDate = mapData["selectedDate"];
          order.selectedTime = mapData["selectedTime"];
          order.selectedPayment = mapData["selectedPayment"];
          order.totalPaid = mapData["totalPaid"];
          order.status = mapData["status"];
        })
      });
    }catch (error){
      print(error);
    }

    return orderList;
  }

  // Update specific order
  Future updateOrder(OrderModel order) async{
    final docOrder = firestore.collection("orders").doc();

    // final order = OrderModel();

    docOrder.update({
      "name": "TestUpdatedName",
      "phoneNumber": "TestUpdatedNo",
      "pickupLocation": "TestUpdatedPickup",
      "deliveryCentre": "TestUpdatedDelivery",
      "parcels": "TestUpdatedNo",
      "selectedDate": "TestUpdatedDate",
      "selectedTime": "TestUpdatedTime",
      "selectedPayment": "TestUpdatedPayment",
      "totalPaid": 1,
      "status": "TestUpdatedStatus",
    });
  }
}