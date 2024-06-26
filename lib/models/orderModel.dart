import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final String name;
  final String phoneNumber;
  final PickLocation pickupLocation;
  final PickLocation deliveryCentre;
  // final List<PickLocation> pickupLocation;
  // final List<PickLocation> deliveryCentre;
  final String selectedDate;
  final String selectedTime;
  final String paymentMethod;
  final String status;
  final List<Parcel> parcels; // Changed from 'parcel' to 'parcels'
  final String deliveryCharge;
  final String totalPrice;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.pickupLocation,
    required this.deliveryCentre,
    required this.selectedDate,
    required this.selectedTime,
    required this.paymentMethod,
    required this.status,
    required this.parcels,
    required this.deliveryCharge,
    required this.totalPrice,
  });
  

  // Convert object to JSON format for Firestore
  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "userId": userId,
        "name": name,
        "phoneNumber": phoneNumber,
        "pickupLocation": pickupLocation.toJson(),
        "deliveryCentre": deliveryCentre.toJson(),
        "selectedDate": selectedDate,
        "selectedTime": selectedTime,
        "paymentMethod": paymentMethod,
        "status": status,
        "parcels": parcels.map((parcel) => parcel.toJson()).toList(),
        "deliveryCharge": deliveryCharge,
        "totalPrice": totalPrice,
      };

  OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : orderId = doc.id,
        userId = doc.data()!["userId"],
        // deliveryCentre = doc.data()!["deliveryCentre"],
        deliveryCentre = PickLocation.fromJson(doc.data()!["deliveryCentre"]),
        name = doc.data()!["name"],
        phoneNumber = doc.data()!["phoneNumber"],
        // pickupLocation= doc.data()!["pickupLocation"],
        pickupLocation = PickLocation.fromJson(doc.data()!["pickupLocation"]),
        // pickupLocation= PickLocation.fromJson(doc.data()!['pickupLocation'][0] as Map<String, dynamic>),
        // selectedDateAndTime = doc.data()?["selectedDateAndTime"], // Use null-aware operator
        selectedDate = doc.data()!["selectedDate"],
        selectedTime = doc.data()!["selectedTime"],
        paymentMethod = doc.data()!["paymentMethod"],
        status = doc.data()!["status"],
        parcels = (doc.data()?["parcels"] as List<dynamic>)
            .map((parcel) => Parcel.fromJson(parcel as Map<String, dynamic>))
            .toList(),
        deliveryCharge = doc.data()!["deliveryCharge"],
        totalPrice = doc.data()!["totalPrice"];
}

class Parcel {
  final String parcelId;
  final String trackingNumber;
  final List<String> criteria;
  final String timeCharge;
  final String criteriaCharge;
  final String parcelCharge;
  final String totalParcels;

  Parcel({
    required this.parcelId,
    required this.trackingNumber,
    required this.criteria,
    required this.timeCharge,
    required this.criteriaCharge,
    required this.parcelCharge,
    required this.totalParcels,
  });

  Map<String, dynamic> toJson() => {
        "parcelId": parcelId,
        "trackingNumber": trackingNumber,
        "criteria": criteria,
        "timeCharge": timeCharge,
        "criteriaCharge": criteriaCharge,
        "parcelCharge": parcelCharge,
        "totalParcels": totalParcels,
      };

  factory Parcel.fromJson(Map<String, dynamic> json) =>
    Parcel(
      parcelId: json['parcelId'],
      trackingNumber: json['trackingNumber'],
      criteria: List<String>.from(json['criteria']),
      timeCharge: json['timeCharge'],
      criteriaCharge: json['criteriaCharge'],
      parcelCharge: json['parcelCharge'],
      totalParcels: json['totalParcels'],
    );
}

class PickLocation {
  final String address;
  final String latitude;
  final String longitude;

  PickLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };

  factory PickLocation.fromJson(Map<String, dynamic> json) =>
    PickLocation(
      address: json['address'], 
      latitude: json['latitude'], 
      longitude: json['longitude']
    );
}