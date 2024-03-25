import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/component/event_study_item.dart';
import 'package:schedule/component/popup_form_schedule.dart';
import 'package:schedule/component/schedule_item.dart';
import 'package:schedule/event_study/add_event.dart';
import 'package:schedule/models/event_info.dart';
import 'package:schedule/screen/time_table/form_schedule.dart';
import 'package:table_calendar/table_calendar.dart';

class EventStudyManage extends StatefulWidget {
  const EventStudyManage({super.key});

  @override
  State<EventStudyManage> createState() => _EventStudyManageState();
}

class _EventStudyManageState extends State<EventStudyManage> {
  DateTime _selectedDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final DateTime _focusDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  final Map<DateTime, List<EventInfo>> _schedules = {};
  late final ValueNotifier<List<EventInfo>> _selectedEvent;

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

  List<EventInfo> _getEventForDay(DateTime day) {
    return _schedules[day] ?? [];
  }

  void onDeleteItemEvent(int index) {
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

  void addNewEvent(EventInfo eventInfo) {
    setState(() {
      final newEvent = eventInfo;
      if (!_schedules.containsKey(_selectedDay)) {
        _schedules[_selectedDay] = [];
      }
      _schedules[_selectedDay]!.add(newEvent);
      _selectedEvent.value = _getEventForDay(_selectedDay);
    });
  }

  void updateEvent(EventInfo eventInfo, int index) {
    setState(() {
      if (_schedules.containsKey(_selectedDay)) {
        _schedules[_selectedDay]![index] = eventInfo;
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
      title: "Quan ly su kien",
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
                  builder: (context) => AddEvent(
                      addNewSchedule: addNewEvent,
                      label: "Them Moi Su Kien",
                      eventInfo: EventInfo(
                          title: '',
                          startTime: '00:00',
                          note: '',
                          colorSelected: Color(0xfff44336)))),
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
            child: ValueListenableBuilder<List<EventInfo>>(
                valueListenable: _selectedEvent,
                builder: (context, value, _) {
                  return value.isEmpty
                      ? const Center(
                          child: Text(
                            "Chua co su kien",
                            style: TextStyle(
                                fontSize: 30,
                                color: AppColor.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return EventStudyItem(
                              day:
                                  "${_selectedDay.day}/${_selectedDay.month < 10 ? '0${_selectedDay.month}' : _selectedDay.month}",
                              eventInfo: value[index],
                              onDeleteItemEvent: () {
                                onDeleteItemEvent(index);
                              },
                              isAction: true,
                              updateEvent: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddEvent(
                                              label: 'Chinh Sua Su Kien',
                                              eventInfo: value[index],
                                              updateSchedule: updateEvent,
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
