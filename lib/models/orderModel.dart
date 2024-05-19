import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderModel extends ChangeNotifier{
  late String name, phoneNumber, pickupLocation, deliveryCentre;
  DateTime? selectedDate;
  late DateTime selectedTime;
  // late double extraCharge;
  late List<ParcelModel> parcels = [];
  double parcelPrice = 1.00;
  double centrePrice = 1.00;

  // Testing
  final times = [
    TimesAvailable("10:30:00", 1),
    TimesAvailable("11:30:00", 0),
    TimesAvailable("14:30:00", 0),
  ];

  double totalPrice(){
    parcelPrice += (parcels.length + 1);
    centrePrice += (parcels.length + 1);

    return parcelPrice + centrePrice;
  }
  
  dateConverter(bool toString){
    DateFormat dateFormat = DateFormat("dd MMM yyyy");

    if(toString == true){
      return dateFormat.format(selectedDate!);

    }else{
      // To be changed
      return dateFormat.parse("05:30");
    }
  }

  timeConverter(bool toString, DateTime? time1, String time2){
    DateFormat timeFormat = DateFormat("hh:mm");

    if(toString == true){
      return timeFormat.add_yMEd().add_jms().format(selectedTime);

    }else{
      return timeFormat.parse(time2);
    }
  }
}

class TimesAvailable{
  TimesAvailable(this.time, this.extraCharge);

  final String time;
  final double extraCharge;

  @override
  String toString() => "TimeSlot { time: $time, charge: $extraCharge}";
}