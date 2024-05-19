import 'package:architech/components/cards.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget{
  TimePicker({super.key, required this.order});

  final OrderModel order;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> with AutomaticKeepAliveClientMixin<TimePicker> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Suggested time",
              style: TextStyle(
                fontSize: regular,
                color: Colors.black
              ),
            ),
          ),
          suggestedCard(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Available times"
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.order.times.length,
                itemBuilder: (count, index){
                  return squareCard(widget.order.times[index].time, widget.order.times[index].extraCharge.toString(), null);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}