import 'package:architech/components/cards.dart';
import 'package:architech/components/customCalendar.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/components/timePicker.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/controllers/providers/orderConfimProvider.dart';
import 'package:architech/controllers/providers/orderScheduleProvider.dart';
import 'package:architech/models/orderModelTest.dart';
import 'package:architech/pages/order/orderConfirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSchedule extends StatefulWidget {
  const OrderSchedule({super.key, required this.order});
  final OrderModelTest order;
  @override
  State<OrderSchedule> createState() => _OrderScheduleState();
}

class _OrderScheduleState extends State<OrderSchedule> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      OrderScheduleProvider controller =
          Provider.of<OrderScheduleProvider>(context, listen: false);
      controller.initFunctionShedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      appBar: titleBar(context, "Match your schedule", 50),
      floatingActionButton: InkWell(
        onTap: () => {Navigator.pop(context)},
        child: Consumer2<OrderScheduleProvider, OrderConfirmProvider>(
            builder: (context, orderScheduleProvider, orderConfirmProvider, _) {
          return SizedBox(
              child: mainBtn(context, "Proceed", false, () {
            orderConfirmProvider.changeInitalTime();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderConfirm(
                  order: orderScheduleProvider.order,
                ),
              ),
            );
          }));
        }),
      ),
      body: GestureDetector(child: SingleChildScrollView(
        child: Consumer<OrderScheduleProvider>(
            builder: (context, orderScheduleProvider, _) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 70),
                    physics: const BouncingScrollPhysics(),
                    itemCount: orderScheduleProvider.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              orderScheduleProvider.changeTabShedule(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: orderScheduleProvider.current == index
                                    ? Colors.black
                                    : lightGrey,
                                borderRadius:
                                    orderScheduleProvider.current == index
                                        ? BorderRadius.circular(12)
                                        : BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      orderScheduleProvider.icons[index],
                                      size: orderScheduleProvider.current == index
                                          ? 23
                                          : 20,
                                      color:
                                          orderScheduleProvider.current == index
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      orderScheduleProvider.items[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            orderScheduleProvider.current == index
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                width: double.infinity,
                height: height,
                child: PageView.builder(
                  itemCount: orderScheduleProvider.icons.length,
                  controller: orderScheduleProvider.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return orderScheduleProvider
                                .items[orderScheduleProvider.current] ==
                            "Date"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  "Suggested Date",
                                  style: TextStyle(
                                      fontSize: regular, color: Colors.black),
                                ),
                              ),
                              suggestedCard(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: CustomCalendar(
                                  order: orderScheduleProvider.order,
                                  initialDate:
                                      orderScheduleProvider.order.selectedDate,
                                  onDateSelected: (selectedDate) {
                                    orderScheduleProvider.updateSelectedDate(
                                      selectedDate ?? DateTime.now(),
                                    );
                                    print("Selected Date: $selectedDate");
                                  },
                                ),
                              )
                            ],
                          )
                        : TimePicker(order: orderScheduleProvider.order);
                  },
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}