import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';

class ScheduleItem extends StatelessWidget {
  final String text;
  final String subject;
  final String teacher;
  final String room;
  final int fontSize;

  const ScheduleItem({
    Key? key,
    required this.text,
    required this.subject,
    required this.teacher,
    required this.room,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.bluePrimaryColor3,
          border: Border.all(
            color: AppColor.bluePrimaryColor2,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize.toDouble(),
                  fontWeight: FontWeight.w700,
                  color: AppColor.bluePrimaryColor1,
                ),
              ),
            ),
            const VerticalDivider(
              color: AppColor.bluePrimaryColor2,
              width: 2,
              thickness: 2,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Giảng viên: ${(teacher)}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColor.bluePrimaryColor2
                      ),
                    ),
                    Text("Phòng học: ${(room)}",
                      style: const TextStyle(
                          fontSize: 13,
                          color: AppColor.bluePrimaryColor2
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
