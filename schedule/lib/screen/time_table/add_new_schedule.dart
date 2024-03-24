import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/button/custom_button.dart';
import 'package:schedule/component/text_field/custom_textfield.dart';
import 'package:schedule/models/schedule_info.dart';
import 'package:schedule/screen/time_table/form_schedule.dart';

class AddNewSchedule extends StatefulWidget {
  const AddNewSchedule(
      {super.key,
        this.addNewSchedule,
        this.label,
        this.scheduleInfo,
        this.updateSchedule,
        this.indexUpdate
      });

  final int? indexUpdate;
  final Function(ScheduleInfo)?
      addNewSchedule;
  final Function(ScheduleInfo, int)?
  updateSchedule;
  final String? label;
  final ScheduleInfo? scheduleInfo;

  @override
  State<AddNewSchedule> createState() => _AddNewScheduleState();
}

enum ActivityLabel {
  study('Hoc', Colors.blue),
  exercise('Thuc Hanh', Colors.pink);

  const ActivityLabel(this.label, this.color);

  final String label;
  final Color color;
}

List<String> listActivity = ["Hoc", "Thuc Hanh"];
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

class _AddNewScheduleState extends State<AddNewSchedule> {
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
  late final TextEditingController? _teacherEditingController;
  late final TextEditingController? _roomEditingController;
  bool disabledTimeEnd = true;

  @override
  void initState() {
    super.initState();
    selectedTimeStart = widget.scheduleInfo!.timeIn;
    selectedTimeEnd = widget.scheduleInfo!.timeOut;
    selectedActivity = widget.scheduleInfo!.activity;
    _subjectEditingController =
        TextEditingController(text: widget.scheduleInfo!.subject);
    _teacherEditingController =
        TextEditingController(text: widget.scheduleInfo!.teacher);
    _roomEditingController =
        TextEditingController(text: widget.scheduleInfo!.room);
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
                      labelText: "Mon Hoc",
                      hintText: "Nhap ten mon hoc",
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 60,
                    width: 300,
                    child: CustomTextField(
                      controller: _teacherEditingController,
                      labelText: "Giang Vien",
                      hintText: "Nhap ten giang vien",
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 60,
                    width: 300,
                    child: CustomTextField(
                      controller: _roomEditingController,
                      labelText: "Phong Hoc",
                      hintText: "Nhap phong hoc",
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
                  label: const Text('Hoat Dong'),
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
                      label: const Text('Bat dau'),
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
                        label: const Text('Ket thuc'),
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

                    ScheduleInfo sc = ScheduleInfo(teacher: _teacherEditingController!.text
                    , subject: _subjectEditingController!.text,
                    room: _roomEditingController!.text,
                    activity: activityController.text,
                    timeIn: timeStartController.text,
                    timeOut: timeEndController.text);

                    if(widget.indexUpdate!= null){
                      widget.updateSchedule!(sc, widget.indexUpdate!);
                    }else{
                      widget.addNewSchedule!(
                          sc);
                    }


                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.bluePrimaryColor1,
                    //onPrimary: Colors.black,
                  ),
                  child: const Text("Save", style: TextStyle(
                    color: Colors.white
                  ),),
                )
              ],
            )),
      ),
    );
  }
}
