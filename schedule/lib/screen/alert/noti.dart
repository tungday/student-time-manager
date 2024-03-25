import 'package:flutter/material.dart';
import 'package:schedule/component/alert_container.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/noti_container.dart';

class Noti extends StatefulWidget {
  final List<Map<String, dynamic>> alarms;

  const Noti({Key? key, required this.alarms}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Thông báo",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              height: 1,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: widget.alarms.length,
          itemBuilder: (context, index) {
            final alarm = widget.alarms[index];
            return NotiContainer(
              label: alarm['label'],
              datetime: alarm['datetime'],
            );
          },
        ),
      ),
    );
  }
}
