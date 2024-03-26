import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:schedule/screen/alert/alarm_event.dart';

import '../../component/app_colors.dart';
import 'alarm_bloc.dart';
import 'alarm_state.dart';

class AddAlarm extends StatelessWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAlarmBloc(),
      child: _AddAlarmScreen(),
    );
  }
}

class _AddAlarmScreen extends StatefulWidget {
  @override
  State<_AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<_AddAlarmScreen> {
  late String? datetime;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateFormat dateFormat =
    DateFormat('dd/MM/yyyy  |  HH:mm');
    datetime = dateFormat.format(DateTime.now()).toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bluePrimaryColor1,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: const Text(
          'Thêm báo thức',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AddAlarmBloc, AddAlarmState>(
        builder: (context, state) {


          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CupertinoDatePicker(
                          showDayOfWeek: true,
                          minimumDate: DateTime.now(),
                          dateOrder: DatePickerDateOrder.dmy,
                          onDateTimeChanged: (va) {
                            DateFormat dateFormat =
                                DateFormat('dd/MM/yyyy  |  HH:mm');
                            String formattedDateTime = dateFormat.format(va);
                            datetime = formattedDateTime;
                            print(datetime);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CupertinoTextField(
                        placeholder: "Tên sự kiện",
                        controller: controller,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      final alarmData = {
                        'label': controller.text,
                        'datetime': datetime,
                      };
                      print(datetime);

                      Navigator.pop(context, alarmData);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.bluePrimaryColor2,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Text(
                          "Lưu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
