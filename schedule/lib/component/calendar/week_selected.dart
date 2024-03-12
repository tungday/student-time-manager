import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekSelected extends StatefulWidget {
  const WeekSelected({Key? key}) : super(key: key);

  @override
  State<WeekSelected> createState() => _WeekSelectedState();
}

class _WeekSelectedState extends State<WeekSelected> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        rowHeight: 35,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _selectedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _calendarFormat = CalendarFormat.week;
          });
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            if (_calendarFormat == CalendarFormat.week) {
              _calendarFormat = CalendarFormat.month;
            } else {
              _calendarFormat = CalendarFormat.week;
            }
          });
        },
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
                fontWeight: FontWeight.w600, color: AppColor.bluePrimaryColor1),
            weekendStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.bluePrimaryColor1)),
        calendarStyle: const CalendarStyle(
            todayTextStyle:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            selectedTextStyle:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            defaultTextStyle: TextStyle(color: AppColor.bluePrimaryColor1),
            weekendTextStyle: TextStyle(color: AppColor.bluePrimaryColor1),
            todayDecoration: BoxDecoration(
                color: AppColor.pinkColor2, shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
              color: AppColor.pinkColor1,
              shape: BoxShape.circle,
            )),
        headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
                color: AppColor.bluePrimaryColor1,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            headerMargin: EdgeInsets.only(bottom: 0),
            headerPadding: EdgeInsets.all(0)),
      ),
    );
  }
}
