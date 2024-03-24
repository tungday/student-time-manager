import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/task_manage/assignment_manage/assignment_form.dart';
import 'package:schedule/screen/task_manage/assignment_manage/assignments.dart';
import 'package:schedule/screen/task_manage/assignment_manage/status_assignment.dart';

class CourseAssignment extends StatefulWidget {
  const CourseAssignment({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CourseAssignmentState();
  }

}

class _CourseAssignmentState extends State<CourseAssignment> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
          foregroundColor: Colors.white,
          backgroundColor: AppColor.bluePrimaryColor1,
          title: const Text(
              "Nhiệm vụ môn học",
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
                  Tab(text: "Đã giao",),
                  Tab(text: "Thiếu",),
                  Tab(text: "Hoàn thành",)
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Assignment(status: StatusAssignment.assigned,),
                  Assignment(status: StatusAssignment.incomplete,),
                  Assignment(status: StatusAssignment.complete,)
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AssignmentForm())
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