import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  DateTime today = DateTime.now();
  DateTime? _selectedDate;

  void _onDaySelected(DateTime day, DateTime focusedDay){
    if(!isSameDay(_selectedDate, day)){
      setState(() {
        _selectedDate = day;
      });
    }
  }
  
  void initState() {
    super.initState();
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: TableCalendar(
        locale: "en_US",
        focusedDay: today,
        firstDay: today,
        lastDay: DateTime.utc(2024, 7, 31),
        rowHeight: 50,
        headerStyle: HeaderStyle(
          headerMargin: EdgeInsets.only(bottom: 20),
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
            color: Colors.white
          ),
          todayTextStyle: TextStyle(
            color: primaryColour
          ),
          selectedDecoration: BoxDecoration(
            color: secondaryColour,
            borderRadius: BorderRadius.circular(10)
          ),
          selectedTextStyle: TextStyle(
            color: Colors.black
          )
        ),
        onDaySelected: _onDaySelected,
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
      ),
    );
  }
}