import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/button/custom_button.dart';
import 'package:schedule/component/text_field/custom_textfield.dart';
import 'package:schedule/models/activity_info.dart';
import 'package:schedule/models/schedule_info.dart';
import 'package:schedule/screen/time_table/form_schedule.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity(
      {super.key,
      this.addNewActivity,
      this.label,
      this.activityInfo,
      this.updateActivity,
      this.indexUpdate});

  final int? indexUpdate;
  final Function(ActivityInfo)? addNewActivity;
  final Function(ActivityInfo, int)? updateActivity;
  final String? label;
  final ActivityInfo? activityInfo;

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

enum ActivityLabel {
  study('Hoc', Colors.blue),
  exercise('Thuc Hanh', Colors.pink);

  const ActivityLabel(this.label, this.color);

  final String label;
  final Color color;
}

List<String> listActivity = ["Học tập", "Giải trí", "Sự kiện quan trọng"];
List<String> listHour = [
  '00:00',
  '01:00',
  '02:00',
  '03:00',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
  '23:00'
];

class _AddNewActivityState extends State<AddNewActivity> {
  late final TextEditingController activityController = TextEditingController();

  // ActivityLabel? selectedActivity;

  final TextEditingController timeStartController = TextEditingController();
  final TextEditingController timeEndController = TextEditingController();
  late String? selectedTimeStart;
  late String? selectedTimeEnd;
  late String? selectedActivity;

  List<String> listTimeStart = listHour;
  List<String> listTimeEnd = listHour;

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController? _subjectEditingController;
  late final TextEditingController? _noteEditingController;
  bool disabledTimeEnd = true;

  @override
  void initState() {
    super.initState();
    selectedTimeStart = widget.activityInfo!.timeIn;
    selectedTimeEnd = widget.activityInfo!.timeOut;
    selectedActivity = widget.activityInfo!.activity;
    _subjectEditingController =
        TextEditingController(text: widget.activityInfo!.subject);
    _noteEditingController =
        TextEditingController(text: widget.activityInfo!.note);
  }

  @override
  Widget build(BuildContext context) {
    return ScheduleForm(
      title: widget.label,
      child: Expanded(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 60,
                    width: 300,
                    child: CustomTextField(
                      controller: _subjectEditingController,
                      labelText: "Hoạt động",
                      hintText: "Nhập tên hoạt động",
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 60,
                    width: 300,
                    child: CustomTextField(
                      controller: _noteEditingController,
                      labelText: "Ghi chú",
                      hintText: "Nhập ghi chú",
                    )),
                const SizedBox(
                  height: 20,
                ),
                DropdownMenu<String>(
                  initialSelection: selectedActivity,
                  controller: activityController,
                  // requestFocusOnTap: true,
                  // enableFilter: true,
                  // inputDecorationTheme: const InputDecorationTheme(
                  //   filled: true,
                  //   contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  // ),
                  label: const Text('Thể loại'),
                  onSelected: (String? activity) {
                    setState(() {
                      selectedActivity = activity;
                    });
                  },

                  dropdownMenuEntries: listActivity
                      .map<DropdownMenuEntry<String>>((String activity) {
                    return DropdownMenuEntry<String>(
                      value: activity,
                      label: activity,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownMenu<String>(
                      initialSelection: selectedTimeStart,
                      controller: timeStartController,
                      label: const Text('Bắt đầu'),
                      onSelected: (String? hour) {
                        setState(() {
                          selectedTimeStart = hour;
                          listTimeEnd = listHour
                              .where((e) =>
                                  int.parse(e.substring(0, 2)) >
                                  int.parse(selectedTimeStart!.substring(0, 2)))
                              .toList();
                          selectedTimeEnd = listTimeEnd[0];
                        });
                        disabledTimeEnd = false;
                      },
                      menuHeight: 150,
                      dropdownMenuEntries: listHour
                          .map<DropdownMenuEntry<String>>((String hour) {
                        return DropdownMenuEntry<String>(
                          value: hour,
                          label: hour,
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IgnorePointer(
                      ignoring: disabledTimeEnd,
                      child: DropdownMenu<String>(
                        initialSelection: selectedTimeEnd,
                        controller: timeEndController,
                        label: const Text('Kết thúc'),
                        onSelected: (String? hour) {
                          setState(() {
                            selectedTimeEnd = hour;
                          });
                        },
                        menuHeight: 150,
                        dropdownMenuEntries: listTimeEnd
                            .map<DropdownMenuEntry<String>>((String hour) {
                          return DropdownMenuEntry<String>(
                            value: hour,
                            label: hour,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    ActivityInfo sc = ActivityInfo(
                        note: _noteEditingController!.text,
                        subject: _subjectEditingController!.text,
                        activity: activityController.text,
                        timeIn: timeStartController.text,
                        timeOut: timeEndController.text);

                    if (widget.indexUpdate != null) {
                      widget.updateActivity!(sc, widget.indexUpdate!);
                    } else {
                      widget.addNewActivity!(sc);
                    }

                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.bluePrimaryColor1,
                    //onPrimary: Colors.black,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
