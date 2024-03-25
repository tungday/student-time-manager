import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/activity_item.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/schedule_item.dart';

class ListActivity extends StatefulWidget {
  const ListActivity({Key? key}) : super(key: key);

  @override
  State<ListActivity> createState() => _ListActivityState();
}

class _ListActivityState extends State<ListActivity> {
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
                  "Hoạt động hiện tại:",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluePrimaryColor1),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/activity_manage');
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
                          text:
                              AppLocalizations.of(context)!.eventManage, // Text
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
          const ActivityItem(
            day: "20/03",
            subject: "Tập thể dục buổi sáng",
            note: "",
            fontSize: 15,
            timeIn: '06:00',
            timeOut: '07:00',
            isNow: true,
            isAction: false,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text("Hoạt động hôm nay",
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
            itemBuilder: (context, index) => const ActivityItem(
              day: "20/03",
              subject: "Đi học",
              note: "Nộp bài tập",
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
