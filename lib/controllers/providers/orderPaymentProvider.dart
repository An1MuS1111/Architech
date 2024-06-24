import 'package:architech/models/orderModelTest.dart';
import 'package:flutter/material.dart';

class OrderPlaceProvider extends ChangeNotifier {
  TextEditingController paymentController = TextEditingController();
  OrderModelTest order = OrderModelTest();

  void disPose() {
    paymentController.dispose();
  }

  void getValues() {
    order.totalPaid = paymentController.text as double; 

    notifyListeners();
  }

  void updateStatus(){}
}