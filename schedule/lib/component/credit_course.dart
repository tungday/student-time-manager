import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';

class CreditCourse extends StatelessWidget {
  final int credit;
  final String course;
  final num progress;
  final String? teacher;
  final String? classroom;

  const CreditCourse({
    required this.credit,
    required this.course,
    required this.progress,
    this.teacher,
    this.classroom,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tap Credit Course");
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.bluePrimaryColor3
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: AppColor.pinkColor2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                    child: Text(
                      "$credit tín",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 108,
                  height: 72,
                  padding: const EdgeInsets.only(top: 6, right: 8),
                  child: Text(
                    course,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
                child: Text(
                  "$progress%",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}