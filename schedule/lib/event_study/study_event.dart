import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/component/event_study_item.dart';
import 'package:schedule/models/event_info.dart';

class StudyEvent extends StatefulWidget {
  const StudyEvent({super.key});

  @override
  State<StudyEvent> createState() => _StudyEventState();
}

class _StudyEventState extends State<StudyEvent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  "Su kien hom nay:",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluePrimaryColor1),
                ),

                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event_manage');
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
                        const TextSpan(
                          text: "Quan ly su kien",
                          // Text
                          style: TextStyle(
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
          const SizedBox(
            child: Center(
              child: Text(
                "T2 - 23/02/2024",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluePrimaryColor1),
              ),
            ),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Nop bao cao mon nhung",
                startTime: "08:00",
                colorSelected: AppColor.pinkColor1,
                note: "Nop tai phong 203-A3"),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Kiem tra giua ky",
                startTime: "09:00",
                colorSelected: AppColor.bluePrimaryColor2,
                note: "Mon IoT"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                  "Su kien trong tuan:",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluePrimaryColor1),
                  textAlign: TextAlign.left),
            ),
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "T3 - 25/02/2024",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluePrimaryColor1),
              ),
            ),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Nop bao cao mon nhung",
                startTime: "08:00",
                colorSelected: AppColor.redColor,
                note: "Nop tai phong 203-A3"),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Kiem tra giua ky",
                startTime: "09:00",
                colorSelected: AppColor.bluePrimaryColor1,
                note: "Mon IoT"),
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "T4 - 26/02/2024",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluePrimaryColor1),
              ),
            ),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Nop bao cao mon nhung",
                startTime: "08:00",
                colorSelected: AppColor.pinkColor1,
                note: "Nop tai phong 203-A3"),
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "T5 - 27/02/2024",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluePrimaryColor1),
              ),
            ),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Nop bao cao mon nhung",
                startTime: "08:00",
                colorSelected: AppColor.yellowColor,
                note: "Nop tai phong 203-A3"),
          ),
          EventStudyItem(
            eventInfo: EventInfo(
                title: "Kiem tra giua ky",
                startTime: "09:00",
                colorSelected: AppColor.bluePrimaryColor2,
                note: "Mon IoT"),
          ),
          // ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   itemCount: 10,
          //   itemBuilder: (context, index) => EventStudyItem(
          //     eventInfo: EventInfo(
          //         title: "Thuc tap co so",
          //         startTime: "10:00",
          //         colorSelected: AppColor.redColor,
          //         note: "Thuc tap co so"),
          //   ),
          // )
        ],
      ),
    );
  }
}
