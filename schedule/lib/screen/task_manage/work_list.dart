import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/task_item.dart';

class WorkList extends StatefulWidget {
  const WorkList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorkListState();
  }

}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/task_manage');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: SvgPicture.asset(
                      'assets/setting_ic.svg',
                      width: 12,
                      height: 12,
                    ),
                  ),
                  const Text(
                    "Quản lý công việc",
                    style: TextStyle(
                      color: AppColor.bluePrimaryColor1,
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                    ),
                  )
                ],
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Công việc ngày ${DateFormat("dd/MM").format(DateTime.now())}:" ,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const TaskItem(
            isComplete: false,
            priority: "Cao",
            title: "Nộp học phí học kỳ 2",
            content: "Hoàn thành nộp học phí học kỳ 2 trước hạn ngày 28/2 với "
                "số tiền là 9.850.000",
            dateCreated: "22/02/2024 21:58",
          ),
          const TaskItem(
            isComplete: false,
            priority: "Trung bình",
            title: "Tham gia hiến máu tại trường",
            content: "Tham gia hiến máu vào buổi chiều cùng bạn bè và các anh "
                "chị trong clb. Địa điểm tại sân trước ký túc xá B2 vủa trueoengf",
            dateCreated: "24/02/2024 16:58",
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 8),
            child: Text(
              "Công việc đã hoàn thành:",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const TaskItem(
            isComplete: true,
            priority: "Cao",
            title: "Đăng ký cải thiện một số môn trong hè",
            content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
                "cải thiện môn ltm",
            dateCreated: "16/02/2024 10:02",
          ),
          // const TaskItem(
          //   isComplete: true,
          //   priority: "Cao",
          //   title: "Đăng ký cải thiện một số môn trong hè",
          //   content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
          //       "cải thiện môn ltm",
          //   dateCreated: "16/02/2024 10:02",
          // ),
          // const TaskItem(
          //   isComplete: true,
          //   priority: "Cao",
          //   title: "Đăng ký cải thiện một số môn trong hè",
          //   content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
          //       "cải thiện môn ltm",
          //   dateCreated: "16/02/2024 10:02",
          // ),
          // const TaskItem(
          //   isComplete: true,
          //   priority: "Cao",
          //   title: "Đăng ký cải thiện một số môn trong hè",
          //   content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
          //       "cải thiện môn ltm",
          //   dateCreated: "16/02/2024 10:02",
          // ),
          // const TaskItem(
          //   isComplete: true,
          //   priority: "Cao",
          //   title: "Đăng ký cải thiện một số môn trong hè",
          //   content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
          //       "cải thiện môn ltm",
          //   dateCreated: "16/02/2024 10:02",
          // ),
          // const TaskItem(
          //   isComplete: true,
          //   priority: "Cao",
          //   title: "Đăng ký cải thiện một số môn trong hè",
          //   content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
          //       "cải thiện môn ltm",
          //   dateCreated: "16/02/2024 10:02",
          // ),
        ],
      ),
    );
  }

}