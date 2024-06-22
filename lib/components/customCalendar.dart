import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModelTest.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget{
  const CustomCalendar({
    Key? key,
    required this.order,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  final OrderModelTest order;
  final DateTime initialDate;
  final ValueChanged<DateTime?> onDateSelected;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> with AutomaticKeepAliveClientMixin<CustomCalendar> {
  DateTime today = DateTime.now();
  DateTime? _selectedDate;
  
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay){
    if(!isSameDay(_selectedDate, day) && !day.isBefore(today)){
      setState(() {
        _selectedDate = day;
        widget.order.selectedDate = _selectedDate ?? DateTime.now();
        widget.onDateSelected(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: 400,
      child: TableCalendar(
        locale: "en_US",
        focusedDay: today,
        firstDay: today,
        lastDay: DateTime.utc(2024, 7, 31),
        rowHeight: 50,
        headerStyle: HeaderStyle(
          headerMargin: const EdgeInsets.only(bottom: 20),
          headerPadding: EdgeInsets.zero,
          titleCentered: true,
          formatButtonVisible: false,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColour,
              width: 1.0
            ),
            borderRadius: BorderRadius.circular(10)
          )
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.zero
          ),
          todayTextStyle: TextStyle(
            color: primaryColour
          ),
          selectedDecoration: BoxDecoration(
            color: secondaryColour,
            // borderRadius: BorderRadius.circular(10)
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.black
          ),
          disabledTextStyle: const TextStyle(
            color: Colors.grey
          ),
        ),
        onDaySelected: _onDaySelected,
        onPageChanged: (focusedDay) {
          _selectedDate = focusedDay;
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        enabledDayPredicate: (day) {
          return !day.isBefore(today); // Disable past dates
        },
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}