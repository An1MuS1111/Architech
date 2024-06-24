import 'package:architech/components/cards.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/controllers/providers/orderConfimProvider.dart';
import 'package:architech/controllers/providers/orderPlaceProvider.dart';
import 'package:architech/controllers/providers/orderProvider.dart';
import 'package:architech/controllers/providers/orderScheduleProvider.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/models/orderModelTest.dart';
import 'package:architech/pages/order/orderPayment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderConfirm extends StatefulWidget {
  OrderConfirm({super.key, required this.order});

  final OrderModelTest order;

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  List<String> paymentOptions = ["Cash on Delivery", "QR Payment"];
  List paymentAvailability = [null, "Coming soon"];
  List paymentIcons = [Icons.attach_money_outlined, null];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: titleBar(context, "Confirm your order", 60),
      floatingActionButton: Consumer3<OrderPlaceProvider,
              OrderScheduleProvider, OrderConfirmProvider>(
          builder: (context, orderPlaceProvider, orderScheduleProvider,
              orderConfirmProvider, _) {
        return InkWell(
          onTap: () => {Navigator.pop(context)},
          child: SizedBox(
              child: mainBtn(
                  isLoading: orderConfirmProvider.isLoading,
                  context,
                  "Proceed to Pay",
                  false, () async {
                    //finded
                    await orderConfirmProvider.addOrderToFirestore(
                      context: context,
                      OrderModel(
                        orderId: generateOrderId(),
                        userId: generateOrderId1(),
                        name: orderPlaceProvider.nameController.text,
                        phoneNumber: orderPlaceProvider.phoneController.text,
                        pickupLocation: PickLocation(
                          address: orderPlaceProvider.selectedPickAddress,
                          latitude: orderPlaceProvider.latitude,
                          longitude: orderPlaceProvider.longitude,
                        ),
                        deliveryCentre: PickLocation(
                          address: orderPlaceProvider.deliveryAddress,
                          latitude: orderPlaceProvider.deliveryLat,
                          longitude: orderPlaceProvider.deliveryLong,
                        ),
                        selectedDate: orderScheduleProvider.order.selectedDate.toString(),
                        selectedTime:
                            (orderScheduleProvider.selectedTimeValue?.time.toString() ??
                                ""),
                        paymentMethod:
                            orderConfirmProvider.selectedPayment == 0 ? "Cash" : "Qr",
                        status: "true",
                        parcels: orderPlaceProvider.parcelsMain,
                        deliveryCharge:
                            (orderPlaceProvider.parcelsMain.length * 1).toString(),
                        totalPrice: (double.parse(
                                    orderConfirmProvider.calculatedPriceCriteriaList(
                                        orderPlaceProvider.parcelsMain)) +
                                (orderPlaceProvider.parcelsMain.length * 1) +
                                (orderPlaceProvider.parcelsMain.length * 1))
                            .toString(),
                      ),
                    );

                    Navigator.push(context, MaterialPageRoute(builder: (context) => RazorPayPage(order: orderPlaceProvider.order)));
                  }
                )
              ),
            );
          }
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              child: const Text(
                "Your order",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              child: Consumer2<OrderPlaceProvider, OrderScheduleProvider>(
                  builder: (context, orderPlaceProvider,
                      orderScheduleProvider, _) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: regular,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                orderPlaceProvider.nameController.text,
                                style: TextStyle(
                                  fontSize: regular,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Phone number",
                              style: TextStyle(
                                fontSize: regular,
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              orderPlaceProvider.phoneController.text,
                              style: TextStyle(
                                fontSize: regular,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Number of parcels",
                                style: TextStyle(
                                  fontSize: regular,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                orderScheduleProvider.order.parcels.length.toString(),
                                style: TextStyle(
                                  fontSize: regular,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Delivery time",
                              style: TextStyle(
                                fontSize: regular,
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              dateFormatter(
                                orderScheduleProvider.order.selectedDate,
                              ) + ", " + order.timeConverter(true, null, orderScheduleProvider.order.selectedTime),
                              style: TextStyle(
                                fontSize: regular,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Drop-off location",
                      style: TextStyle(
                        fontSize: regular,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      orderPlaceProvider.selectedPickAddress,
                      style: TextStyle(
                        fontSize: regular,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ); 
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Registered parcels",
                style: TextStyle(fontSize: regular),
              ),
            ),
            Consumer2<OrderPlaceProvider, OrderScheduleProvider>(builder:
                (context, orderPlaceProvider, orderScheduleProvider, _) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: orderPlaceProvider.parcelListModel.length * 110,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderPlaceProvider.parcelListModel.length,
                      itemBuilder: (context, index) {
                        var data =
                            orderPlaceProvider.parcelListModel[index];
                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parcel ${index + 1}",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tracking no",
                                  ),
                                  Text(
                                    data.name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Criteria",
                                  ),
                                  SizedBox(
                                    width:
                                        (data.criteriaList?.length ?? 0) * 80,
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.criteriaList?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        var datas = data.criteriaList?[index];
                                        return Center(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            margin: EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                              color: secondaryColour,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Text(datas.toString()),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                  // indent: 20,
                                  // endIndent: 20,
                                  ),
                            ],
                          ),
                        );
                      }),
                ),
              );
            }),
            Consumer3<OrderPlaceProvider, OrderScheduleProvider,
                    OrderConfirmProvider>(
                builder: (context, orderPlaceProvider, orderScheduleProvider,
                    orderConfirmProvider, _) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: LimitedBox(
                    maxHeight: 400,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.order.parcels.length,
                        itemBuilder: (context, index) {
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  widget.order.parcels[index].toString(),
                                  style: TextStyle(fontSize: mainTitle),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tracking no"),
                                  Text(widget.order.parcels[index].trackingNo)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Criterias"),
                                  Text("2-3Kg, Fragile")
                                ],
                              )
                            ],
                          );
                        }),
                  ));
            }),
            Consumer3<OrderPlaceProvider, OrderScheduleProvider,
                    OrderConfirmProvider>(
                builder: (context, orderPlaceProvider, orderScheduleProvider,
                    orderConfirmProvider, _) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: mainTitle),
                          ),
                          Text(
                            "RM  ${(double.parse(orderConfirmProvider.calculatedPriceCriteriaList(orderPlaceProvider.parcelsMain)) + (orderPlaceProvider.parcelsMain.length * 1) + (orderPlaceProvider.parcelsMain.length * 1)).toString()}",
                            style: TextStyle(
                                fontSize: mainTitle,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Parcel Price",
                            style: TextStyle(color: greyColour)),
                        Text(
                            "RM 1.0 x ${orderPlaceProvider.parcelsMain.length}",
                            style: TextStyle(color: greyColour)),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery centre charge",
                            style: TextStyle(color: greyColour)),
                        Text(
                            "RM 1.0 x ${(orderPlaceProvider.parcelsMain.length * 1).toString()}",
                            style: TextStyle(color: greyColour)),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Criteria (${orderPlaceProvider.calculateKg(orderPlaceProvider.totalKg)}kg) charge",
                            style: TextStyle(color: greyColour)),
                        Text(
                            "RM ${orderConfirmProvider.calculatedPriceCriteriaList(orderPlaceProvider.parcelsMain)}",
                            style: TextStyle(color: greyColour)),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Registered parcels",
                style: TextStyle(fontSize: regular),
              ),
            ),
            Consumer<OrderConfirmProvider>(
                builder: (context, orderConfirmProvider, _) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (count, index) {
                      return GestureDetector(
                        onTap: () {
                          orderConfirmProvider.selectedPaymentsFunction(index);
                        },
                        child: squareCard(
                          paymentOptions[index],
                          paymentAvailability[index],
                          paymentIcons[index],
                          selected:
                              orderConfirmProvider.selectedPayment == index
                                  ? true
                                  : false,
                          selectedInitial:
                              orderConfirmProvider.changePayementValue,
                        ),
                      );
                    },
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}