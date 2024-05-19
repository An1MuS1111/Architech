import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderModel extends ChangeNotifier{
  late String name, phoneNumber, pickupLocation, deliveryCentre;
  DateTime? selectedDate;
  late DateTime selectedTime;
  // late double extraCharge;
  late List<ParcelModel> parcels = [];

  // Testing
  final times = [
    TimesAvailable("10:30:00", 1),
    TimesAvailable("11:30:00", 0),
    TimesAvailable("14:30:00", 0),
  ];

  double totalPrice(double totalParcels){
    double parcelPrice = totalParcels * 1.0;
    double centrePrice = totalParcels * 1.0;

    return parcelPrice + centrePrice;
  }
  
  String dateConverter(){
    DateFormat dateFormat = DateFormat("dd MMM yyyy");

    return dateFormat.format(selectedDate!);
  }

  String timeConverter(){
    DateFormat dateFormat = DateFormat("hh:mm");

    return dateFormat.add_yMEd().add_jms().format(selectedTime);
  }
}

class TimesAvailable{
  TimesAvailable(this.time, this.extraCharge);

  final String time;
  final double extraCharge;

  String toString() => "TimeSlot { time: $time, charge: $extraCharge}";
}