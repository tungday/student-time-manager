import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/component/popup_form_schedule.dart';
import 'package:schedule/component/schedule_item.dart';
import 'package:schedule/models/schedule_info.dart';
import 'package:schedule/screen/time_table/add_new_schedule.dart';
import 'package:schedule/screen/time_table/form_schedule.dart';
import 'package:table_calendar/table_calendar.dart';

class TimeTableManage extends StatefulWidget {
  const TimeTableManage({Key? key}) : super(key: key);

  @override
  State<TimeTableManage> createState() => _TimeTableManageState();
}

class _TimeTableManageState extends State<TimeTableManage> {
  DateTime _selectedDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
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

  void onDeleteItemSchedule(int index) {
    setState(() {
      print("===BEFORE: ${_selectedEvent}");
      _schedules.update(_selectedDay, (value) {
        final sc = value.removeAt(index);
        return value;
      });
      _selectedEvent.value = _getEventForDay(_selectedDay);
      print("===AFTER: ${_selectedEvent}");
    });
  }

  void addNewSchedule(ScheduleInfo scheduleInfo) {
    setState(() {
      final newEvent = scheduleInfo;
      if (!_schedules.containsKey(_selectedDay)) {
        _schedules[_selectedDay] = [];
      }
      _schedules[_selectedDay]!.add(newEvent);
      _selectedEvent.value = _getEventForDay(_selectedDay);
    });
  }

  void updateSchedule(ScheduleInfo scheduleInfo, int index) {
    setState(() {
      if (_schedules.containsKey(_selectedDay)) {
        _schedules[_selectedDay]![index] = scheduleInfo;
        _selectedEvent.value = _getEventForDay(_selectedDay);
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  void showDialogForm() {
    showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
              content: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    right: -40,
                    top: -40,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                  Form(key: _formKey, child: PopupFormSchedule()),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ScheduleForm(
      title: "Quan ly lich",
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.bluePrimaryColor1,
          onPressed: () => {
            // Navigator.pushNamed(context, '/add_schedule')
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewSchedule(
                        addNewSchedule: addNewSchedule,
                        label: "Them Moi Lich Hoc",
                        scheduleInfo: ScheduleInfo(
                            timeOut: '',
                            timeIn: '',
                            activity: '',
                            room: '',
                            subject: '',
                            teacher: ''),
                      )),
            ),
          },
          child: const Text("+",
              style: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
      child: Expanded(
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
                  _selectedDay = selectedDay;
                  _calendarFormat = CalendarFormat.week;
                  _selectedEvent.value = _getEventForDay(_selectedDay);
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
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ValueListenableBuilder<List<ScheduleInfo>>(
                valueListenable: _selectedEvent,
                builder: (context, value, _) {
                  return value.isEmpty
                      ? const Center(
                          child: Text(
                            "Chua co lich hoc",
                            style: TextStyle(
                                fontSize: 30,
                                color: AppColor.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return ScheduleItem(
                              day:
                                  "${_selectedDay.day}/${_selectedDay.month < 10 ? '0${_selectedDay.month}' : _selectedDay.month}",
                              subject: value[index].subject,
                              teacher: value[index].teacher,
                              room: value[index].room,
                              fontSize: 15,
                              timeIn: value[index].timeIn,
                              timeOut: value[index].timeOut,
                              isNow: false,
                              isAction: true,
                              isPractice: value[index].activity == 'Thuc Hanh'
                                  ? true
                                  : false,
                              onDeleteItemSchedule: () {
                                onDeleteItemSchedule(index);
                              },
                              updateSchedule: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddNewSchedule(
                                              label: 'Chinh Sua Lich Hoc',
                                              scheduleInfo: value[index],
                                              updateSchedule: updateSchedule,
                                              indexUpdate: index,
                                            )));
                              },
                            );
                          });
                }),
          )
        ],
      )),
    );
  }
}
