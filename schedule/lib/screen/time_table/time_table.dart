import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/schedule_item.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  "Lịch học hiện tại:",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluePrimaryColor1),
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              'assets/setting_ic.svg',
                              width: 12,
                              height: 12,
                            ) // Icon
                            ),
                      ),
                      const TextSpan(
                        text: 'Quản lý lịch', // Text
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColor.bluePrimaryColor1,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ScheduleItem(
            text: "15/03",
            subject: "Lap Trinh HDT",
            teacher: "Nguyen Hoang Anh",
            room: "203-A3",
            fontSize: 15,
            timeIn: '08:00',
            timeOut: '10:00',
            isNow: true,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Lịch học trong ngày:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluePrimaryColor1),
                  textAlign: TextAlign.left),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => const ScheduleItem(
              text: "15/03",
              subject: "Lap Trinh HDT",
              teacher: "Nguyen Hoang Anh",
              room: "203-A3",
              fontSize: 15,
              timeIn: '08:00',
              timeOut: '10:00',
              isNow: false,
            ),
          )
        ],
      ),
    );
  }
}
