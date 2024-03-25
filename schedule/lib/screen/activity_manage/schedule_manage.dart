import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/component/schedule_item.dart';
import 'package:schedule/models/schedule_info.dart';
import 'package:table_calendar/table_calendar.dart';

class TimeTableManage extends StatefulWidget {
  const TimeTableManage({Key? key}) : super(key: key);

  @override
  State<TimeTableManage> createState() => _TimeTableManageState();
}

class _TimeTableManageState extends State<TimeTableManage> {
  DateTime _selectedDay = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final DateTime _focusDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  final Map<DateTime, List<ScheduleInfo>> _schedules = {};
  late final ValueNotifier<List<ScheduleInfo>> _selectedEvent;
  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedEvent = ValueNotifier(_getEventForDay(_selectedDay));
    // print("===< EVENTS: ${_selectedEvent.value} >===");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("=== Dispose ===");
  }

  List<ScheduleInfo> _getEventForDay(DateTime day) {
    return _schedules[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 60,
                color: AppColor.bluePrimaryColor1,
                child: Row(
                  children: [
                    // const Padding(padding: EdgeInsets.only(left: 5)),
                    IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: SvgPicture.asset(
                          "assets/angle_left_ic.svg",
                          width: 35,
                          height: 35,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        )),
                    const Spacer(),
                    Center(
                      child: Text(AppLocalizations.of(context)!.scheduleManage,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1,
                              fontWeight: FontWeight.w600)),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                  children: [
                    Container(
                      child: TableCalendar(
                        rowHeight: 35,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusDay,
                        eventLoader: _getEventForDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            print("===< EVENTS 1: ${_getEventForDay(selectedDay)} >===");

                            print("***** SelectedDay: ${selectedDay}");
                            print("***** _SelectedDay: ${_selectedDay}");
                            _selectedDay = selectedDay;
                            _calendarFormat = CalendarFormat.week;
                            _selectedEvent.value = _getEventForDay(_selectedDay);
                            print("===< EVENTS 2: ${_getEventForDay(selectedDay)} >===");

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
                                fontWeight: FontWeight.w600,
                                color: AppColor.bluePrimaryColor1),
                            weekendStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.bluePrimaryColor1)),
                        calendarStyle: const CalendarStyle(
                            todayTextStyle: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.white),
                            selectedTextStyle: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.white),
                            defaultTextStyle:
                                TextStyle(color: AppColor.bluePrimaryColor1),
                            weekendTextStyle:
                                TextStyle(color: AppColor.bluePrimaryColor1),
                            todayDecoration: BoxDecoration(
                                color: AppColor.pinkColor2,
                                shape: BoxShape.circle),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ValueListenableBuilder<List<ScheduleInfo>>(
                          valueListenable: _selectedEvent,
                          builder: (context, value, _) {
                            return ListView.builder(
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  return ScheduleItem(
                                    text: value[index].subject,
                                    subject: "Lap Trinh HDT",
                                    teacher: "Nguyen Hoang Anh",
                                    room: "203-A3",
                                    fontSize: 15,
                                    timeIn: '08:00',
                                    timeOut: '10:00',
                                    isNow: false,
                                    isAction: true,
                                    isPractice: true,
                                  );
                                });
                          }),
                    )
                  ],
              ))
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.bluePrimaryColor1,
          onPressed: () => {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Them Moi Lich Hoc"),
                    content: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _eventController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            final newEvent = ScheduleInfo(subject: _eventController.text);
                            if (!_schedules.containsKey(_selectedDay)) {
                              _schedules[_selectedDay] = [];
                            }
                            _schedules[_selectedDay]!.add(newEvent);
                            final updatedEvents = _getEventForDay(_selectedDay);
                            _selectedEvent.value = updatedEvents.toList();
                            print("===< EVENTS: ${_selectedEvent.value} >===");

                          },
                          child: Text("Save"))
                    ],
                  );
                })
          },
          child: const Text("+",
              style: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
    );
  }
}
