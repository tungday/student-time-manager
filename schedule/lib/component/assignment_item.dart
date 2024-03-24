import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/task_manage/assignment_manage/assignment_form.dart';
import 'package:schedule/screen/task_manage/assignment_manage/status_assignment.dart';

class AssignmentItem extends StatelessWidget {
  final String title;
  final String content;
  final String dateDeadline;
  final String timeDeadline;
  final StatusAssignment status;
  final String? timeCreated;

  const AssignmentItem({
    required this.title,
    required this.content,
    required this.dateDeadline,
    required this.timeDeadline,
    required this.status,
    this.timeCreated,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AssignmentForm(
            typeHandle: "Chỉnh sửa nhiệm vụ môn học",
            isComplete: status != StatusAssignment.assigned,
            title: title,
            content: content,
            dateDeadline: dateDeadline,
            timeDeadline: timeDeadline,
            timeCreated: timeCreated
          ))
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
          color: status == StatusAssignment.incomplete ? AppColor.pinkColor2
              : AppColor.bluePrimaryColor3,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0.75)
            ),
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                "assets/book_ic.svg",
                width: 18,
                color: status == StatusAssignment.incomplete ? Colors.redAccent
                    : AppColor.bluePrimaryColor2,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: status == StatusAssignment.incomplete ? const Icon(
                Icons.error_outline,
                color: Colors.redAccent,
              ) : (status == StatusAssignment.assigned ? Text(
                "$dateDeadline $timeDeadline",
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.bluePrimaryColor2
                ),
              ) : const Icon(
                Icons.check_circle,
                color: AppColor.bluePrimaryColor2,
              ))
            )
          ],
        ),
      ),
    );
  }

}