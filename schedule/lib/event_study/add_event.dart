import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/button/custom_button.dart';
import 'package:schedule/component/text_field/custom_textfield.dart';
import 'package:schedule/models/event_info.dart';
import 'package:schedule/models/schedule_info.dart';
import 'package:schedule/screen/time_table/form_schedule.dart';

class AddEvent extends StatefulWidget {
  const AddEvent(
      {super.key,
      this.addNewSchedule,
      this.label,
      this.eventInfo,
      this.updateSchedule,
      this.indexUpdate});

  final int? indexUpdate;
  final Function(EventInfo)? addNewSchedule;
  final Function(EventInfo, int)? updateSchedule;
  final String? label;
  final EventInfo? eventInfo;

  @override
  State<AddEvent> createState() => _AddEventState();
}

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

class _AddEventState extends State<AddEvent> {
  late Color? selectedColor;

  // late final TextEditingController activityController = TextEditingController();

  final TextEditingController timeStartController = TextEditingController();

  // final TextEditingController timeEndController = TextEditingController();
  late String? selectedTimeStart;

  // late String? selectedTimeEnd;
  // late String? selectedActivity;

  List<String> listTimeStart = listHour;
  List<String> listTimeEnd = listHour;

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController? _titleEditingController;
  late final TextEditingController? _noteEditingController;

  // late final TextEditingController? _roomEditingController;
  bool disabledTimeEnd = true;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.eventInfo!.colorSelected;
    selectedTimeStart = widget.eventInfo!.startTime;
    _titleEditingController =
        TextEditingController(text: widget.eventInfo!.title);
    _noteEditingController =
        TextEditingController(text: widget.eventInfo!.note);
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
                      controller: _titleEditingController,
                      labelText: "Tieu de",
                      hintText: "Nhap tieu de",
                    )),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownMenu<String>(
                  initialSelection: selectedTimeStart,
                  controller: timeStartController,
                  label: const Text('Bat dau'),
                  onSelected: (String? hour) {
                    setState(() {
                      selectedTimeStart = hour;
                    });
                    disabledTimeEnd = false;
                  },
                  menuHeight: 150,
                  dropdownMenuEntries:
                      listHour.map<DropdownMenuEntry<String>>((String hour) {
                    return DropdownMenuEntry<String>(
                      value: hour,
                      label: hour,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 60,
                    width: 300,
                    child: CustomTextField(
                      controller: _noteEditingController,
                      labelText: "Ghi chu",
                      hintText: "Nhap ghi chu...",
                    )),
                ColorPicker(
                  pickersEnabled: const <ColorPickerType, bool>{
                    ColorPickerType.primary: true,
                    ColorPickerType.accent: false,
                  },
                  onColorChanged: (Color color) {
                    // print(color.toString());

                    setState(() {
                      selectedColor = color;
                    });
                  },
                  // enableOpacity: false,
                  enableShadesSelection: false,
                  tonalColorSameSize: false,
                  color: selectedColor!,
                  heading: const Text(
                    'Chọn màu',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    EventInfo evt = EventInfo(
                        title: _titleEditingController!.text,
                        startTime: timeStartController.text,
                        note: _noteEditingController!.text,
                        colorSelected: selectedColor);

                    if (widget.indexUpdate != null) {
                      widget.updateSchedule!(evt, widget.indexUpdate!);
                    } else {
                      widget.addNewSchedule!(evt);
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
