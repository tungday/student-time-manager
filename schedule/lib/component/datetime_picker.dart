import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final String? date;
  final String? time;
  const DateTimePicker({
    this.date,
    this.time,
    super.key
  });

  @override
  State<StatefulWidget> createState() {
    return _DateTimePickerState();
  }

}

class _DateTimePickerState extends State<DateTimePicker> {
  late String _date;
  late String _time;

  @override
  void initState() {
    _date = widget.date ?? DateFormat("dd/MM/yyyy").format(DateTime.now().add(
        const Duration(days: 1)
    )).toString();
    _time = widget.time ?? "23:59";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, right: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                currentTime: DateTime.now(),
                onConfirm: (date) {
                  setState(() {
                    _date = DateFormat("dd/MM/yyy").format(date).toString();
                  });
                },
                locale: LocaleType.vi
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      _date,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  currentTime: DateTime.now(),
                  onConfirm: (time) {
                    setState(() {
                      _time = DateFormat("HH:mm").format(time).toString();
                    });
                  },
                  locale: LocaleType.vi
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.timer_outlined,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    _time,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}