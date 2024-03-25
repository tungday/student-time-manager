import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/schedule_item.dart';

class ScheduleManage extends StatefulWidget {
  const ScheduleManage({Key? key}) : super(key: key);

  @override
  State<ScheduleManage> createState() => _ScheduleManageState();
}

class _ScheduleManageState extends State<ScheduleManage> {
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
                Text(
                  "${AppLocalizations.of(context)!.currentClassSchedule}:",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluePrimaryColor1),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/schedule_manage');
                  },
                  child: RichText(
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
                        TextSpan(
                          text: AppLocalizations.of(context)!.scheduleManage, // Text
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColor.bluePrimaryColor1,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ScheduleItem(
            day: "15/03",
            subject: "Lap Trinh HDT",
            teacher: "Nguyen Hoang Anh",
            room: "203-A3",
            fontSize: 15,
            timeIn: '08:00',
            timeOut: '10:00',
            isNow: true,
            isAction: false,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                  "${AppLocalizations.of(context)!.todayClassSchedule}:",
                style: const TextStyle(
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
              day: "15/03",
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
