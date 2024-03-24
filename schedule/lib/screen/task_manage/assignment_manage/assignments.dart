import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/screen/task_manage/assignment_manage/status_assignment.dart';

import '../../../component/assignment_item.dart';

class Assignment extends StatefulWidget {
  final StatusAssignment status;

  const Assignment({
    required this.status,
    super.key
  });

  @override
  State<StatefulWidget> createState() {
    return _AssignmentState();
  }

}

class _AssignmentState extends State<Assignment> {
  late List<AssignmentItem> _currentWeekItems;
  late List<AssignmentItem> _nextWeeksItems;
  late List<AssignmentItem> _lastWeeksItems;

  @override
  void initState() {
    _currentWeekItems = widget.status == StatusAssignment.assigned ? [
      AssignmentItem(
        title: "Kịch bản kiểm thử phần mềm quản lý thư viện",
        content: "Kịch bản kiểm thử phần mềm quản lý thư viện",
        timeCreated: "01/03/2024 11:21",
        dateDeadline: "03/03/2024",
        timeDeadline: "23:59",
        status: widget.status,
      )
    ] : (widget.status == StatusAssignment.complete ? [
      AssignmentItem(
        title: "Viết kịch bản kiểm thử hộp đen",
        content: "Viết kịch bản kiểm thử hộp đen",
        timeCreated: "01/03/2024 11:21",
        dateDeadline: "03/03/2024",
        timeDeadline: "23:59",
        status: widget.status,
      )
    ] : [
      AssignmentItem(
        title: "Phân công công việc",
        content: "Phân công công việc",
        timeCreated: "01/03/2024 11:21",
        dateDeadline: "03/03/2024",
        timeDeadline: "23:59",
        status: widget.status,
      )
    ]);
    _nextWeeksItems = [
      AssignmentItem(
        title: "Phân công công việc",
        content: "Phân công công việc",
        timeCreated: "01/03/2024 11:21",
        dateDeadline: "03/03/2024",
        timeDeadline: "23:59",
        status: widget.status,
      )
    ];
    _lastWeeksItems = [
      AssignmentItem(
        title: "Phân công công việc",
        content: "Phân công công việc",
        timeCreated: "01/03/2024 11:21",
        dateDeadline: "03/03/2024",
        timeDeadline: "23:59",
        status: widget.status,
      )
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 4),
              child: Text(
                "Tuần này (${_currentWeekItems.length})",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            ..._currentWeekItems,
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 4),
              child: Text(
                "Các tuần ${
                  widget.status == StatusAssignment.assigned ? "tiếp theo (${_nextWeeksItems.length})"
                      : "trước (${_lastWeeksItems.length})"
                }",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            ...(widget.status == StatusAssignment.assigned ? _nextWeeksItems : _lastWeeksItems)
          ],
        ),
      ),
    );
  }

}