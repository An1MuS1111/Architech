import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? id;
  final String name; // Assuming name refers to the customer's name
  final List<String> parcels;
  final String phoneNumber;

  final PickUpLocation pickUpLocation;
  final Timestamp selectedDateAndTime;
  final DocumentReference selectedPaymentMethod;
  final String status;
  final int totalPrice;

  OrderModel({
    required this.id,
    required this.name,
    required this.parcels,
    required this.phoneNumber,
    required this.pickUpLocation,
    required this.selectedDateAndTime,
    required this.selectedPaymentMethod,
    required this.status,
    required this.totalPrice,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      name: data['name'] ?? '', // Set default name if not provided
      parcels: List<String>.from(data['parcels'] ?? []),
      phoneNumber:
          data['phoneNumber'] ?? '', // Set default phone number if not provided
      pickUpLocation: PickUpLocation.fromMap(
          data['pickUpLocation'] as Map<String, dynamic>?),
      selectedDateAndTime: data['selectedDate&TIme'] as Timestamp,
      selectedPaymentMethod: data['selectedPaymentMethod'] as DocumentReference,
      status:
          data['status'] ?? '', // Set default status if not provided
      totalPrice:
          data['totalPrice'] ?? null, // Set default total price if not provided
    );
  }
}

class PickUpLocation {
  final String address;
  final String addressDetails;
  final String name;

  PickUpLocation({
    required this.address,
    required this.addressDetails,
    required this.name,
  });

  factory PickUpLocation.fromMap(Map<String, dynamic>? data) {
    if (data == null)
      return PickUpLocation(address: '', addressDetails: '', name: '');
    return PickUpLocation(
      address: data['address'] ?? '',
      addressDetails: data['addressDetails'] ?? '',
      name: data['name'] ?? '',
    );
  }
}
