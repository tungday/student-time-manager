import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/task_manage/task_handle.dart';
import 'package:schedule/screen/task_manage/task_manage.dart';

class TaskItem extends StatelessWidget {
  final bool isComplete;
  final String priority;
  final String title;
  final String content;
  final String dateCreated;

  const TaskItem({
    required this.isComplete,
    required this.priority,
    required this.title,
    required this.content,
    required this.dateCreated,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskHandler(
            typeHandle: "Chỉnh sửa công việc",
            isComplete: isComplete,
            priority: priority,
            title: title,
            content: content,
            timeCreated: dateCreated,
          ))
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        margin: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
        decoration: BoxDecoration(
          color: AppColor.bluePrimaryColor3,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 4, top: 1, right: 4, bottom: 1),
                  decoration: BoxDecoration(
                    color: isComplete ? AppColor.bluePrimaryColor2 : Colors.white,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isComplete ? Icons.check_circle : Icons.refresh_sharp,
                        size: 12,
                        color: isComplete ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(width: 1,),
                      Text(
                        isComplete ? "Đã hoàn thành" : "Chưa hoàn thành",
                        style: TextStyle(
                          color: isComplete ? Colors.white : Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 12,),
                Container(
                  padding: const EdgeInsets.only(left: 4, top: 1, right: 4, bottom: 1),
                  decoration: BoxDecoration(
                      color: isComplete ? AppColor.bluePrimaryColor2 : Colors.white,
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: Text(
                    "Ưu tiên: $priority",
                    style: TextStyle(
                        color: isComplete ? Colors.white : Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: isComplete ? null : () {
                    print("Click check icon");
                  },
                  child: Icon(
                    Icons.check_circle,
                    size: 26,
                    color: isComplete ? Colors.transparent : Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                "Nội dung: $content",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColor.bluePrimaryColor2
                ),
              ),
            ),
            Text(
              "Ngày tạo: $dateCreated",
              style: const TextStyle(
                fontSize: 10,
                color: AppColor.bluePrimaryColor2
              ),
            )
          ],
        ),
      ),
    );
  }

}