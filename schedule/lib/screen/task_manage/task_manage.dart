import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/calendar/week_selected.dart';
import 'package:schedule/component/task_item.dart';
import 'package:schedule/screen/task_manage/task_handle.dart';

class TaskManage extends StatefulWidget {
  const TaskManage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TaskManageState();
  }

}

class _TaskManageState extends State<TaskManage> {
  late DateTime _dateSelected;
  late List<TaskItem> _taskItems = [];

  @override
  void initState() {
    _dateSelected = DateTime.now();
    _taskItems = [
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
      const TaskItem(
        isComplete: true,
        priority: "Cao",
        title: "Đăng ký cải thiện một số môn trong hè",
        content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
            "cải thiện môn ltm",
        dateCreated: "16/02/2024 10:02",
      ),
      const TaskItem(
        isComplete: true,
        priority: "Cao",
        title: "Đăng ký cải thiện một số môn trong hè",
        content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
            "cải thiện môn ltm",
        dateCreated: "16/02/2024 10:02",
      ),
      const TaskItem(
        isComplete: true,
        priority: "Cao",
        title: "Đăng ký cải thiện một số môn trong hè",
        content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
            "cải thiện môn ltm",
        dateCreated: "16/02/2024 10:02",
      ),
      const TaskItem(
        isComplete: true,
        priority: "Cao",
        title: "Đăng ký cải thiện một số môn trong hè",
        content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
            "cải thiện môn ltm",
        dateCreated: "16/02/2024 10:02",
      ),
      const TaskItem(
        isComplete: true,
        priority: "Cao",
        title: "Đăng ký cải thiện một số môn trong hè",
        content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
            "cải thiện môn ltm",
        dateCreated: "16/02/2024 10:02",
      ),
    ];
    super.initState();
  }

  void changeDate(DateTime date) {
    setState(() {
      _dateSelected = date;
      _taskItems = DateFormat("dd/MM/yyy")
          .format(_dateSelected) == "21/03/2024" ? [
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
        const TaskItem(
          isComplete: true,
          priority: "Cao",
          title: "Đăng ký cải thiện một số môn trong hè",
          content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
              "cải thiện môn ltm",
          dateCreated: "16/02/2024 10:02",
        ),
        const TaskItem(
          isComplete: true,
          priority: "Cao",
          title: "Đăng ký cải thiện một số môn trong hè",
          content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
              "cải thiện môn ltm",
          dateCreated: "16/02/2024 10:02",
        ),
        const TaskItem(
          isComplete: true,
          priority: "Cao",
          title: "Đăng ký cải thiện một số môn trong hè",
          content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
              "cải thiện môn ltm",
          dateCreated: "16/02/2024 10:02",
        ),
        const TaskItem(
          isComplete: true,
          priority: "Cao",
          title: "Đăng ký cải thiện một số môn trong hè",
          content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
              "cải thiện môn ltm",
          dateCreated: "16/02/2024 10:02",
        ),
        const TaskItem(
          isComplete: true,
          priority: "Cao",
          title: "Đăng ký cải thiện một số môn trong hè",
          content: "Đăng nhập vào trang qldt của trường lúc 12h để đăng ký "
              "cải thiện môn ltm",
          dateCreated: "16/02/2024 10:02",
        ),
      ]  : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.bluePrimaryColor1,
          title: const Text(
            "Quản lý công việc",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 1
            )
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 0.5
                  )
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 1.0,
                      offset: const Offset(0.0, 0.75)
                  )
                ]
              ),
              child: WeekSelected(func: changeDate,),
            ),
            _taskItems.isEmpty ? Expanded(
              child: Align(
                alignment: const Alignment(0, -0.25),
                child: Text(
                  "Chưa có công việc nào được thêm",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ) : Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: _taskItems.map<TaskItem>((item) => item).toList(),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskHandler())
            );
          },
          tooltip: "Add task",
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            size: 36,
          ),
        ),
      ),
    );
  }

}