import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/task_manage/class_list.dart';
import 'package:schedule/screen/task_manage/work_list.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TaskHomeState();
  }

}

class _TaskHomeState extends State<TaskHome> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
          title: const Center(
            child: Text(
                "Công việc - Nhiệm vụ - Deadline",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                height: 1
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: AppColor.bluePrimaryColor1,
              margin: const EdgeInsets.only(top: 1),
              height: 30,
              child: TabBar.secondary(
                controller: _tabController,
                unselectedLabelColor: Colors.white,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14
                ),
                indicator: const BoxDecoration(color: AppColor.bluePrimaryColor2),
                indicatorColor: AppColor.yellowColor,
                tabs: const [
                  Tab(text: "Danh sách công việc",),
                  Tab(text: "Danh sách lớp tín chỉ",)
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  WorkList(),
                  ClassList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}