import 'package:flutter/material.dart';
import 'package:schedule/component/credit_course.dart';

class ClassList extends StatefulWidget {
  const ClassList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClassListState();
  }

}

class _ClassListState extends State<ClassList> {
  late List<CreditCourse> _creditCourses;

  @override
  void initState() {
    _creditCourses = [
      const CreditCourse(
        credit: 3,
        course: "Đảm bảo chất lượng phần mềm",
        progress: 38,
      ),
      const CreditCourse(
        credit: 3,
        course: "Phát triển ứng dụng cho các thiết bị di động",
        progress: 17,
      ),
      const CreditCourse(
        credit: 3,
        course: "Xây dựng các hệ thống nhúng",
        progress: 31,
      ),
      const CreditCourse(
        credit: 3,
        course: "Kiến trúc và thiết kế phần mềm",
        progress: 38,
      ),
      const CreditCourse(
        credit: 3,
        course: "Phát triển phần mềm hướng dịch vụ",
        progress: 38,
      ),
      const CreditCourse(
        credit: 1,
        course: "Chuyên đề công nghệ phần mềm",
        progress: 0,
      )
    ];
    super.initState();
  }

  List<Container> renderCreditCourses(List<CreditCourse> creditCourses) {
    List<Container> coursesRowContainers = [];
    for (int i = 0, len = creditCourses.length; i < len; i += 2) {
      coursesRowContainers.add(Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: (i + 1 < len) ? [
              creditCourses[i],
              creditCourses[i + 1]
            ] : [
              creditCourses[i]
            ]
        ),
      ));
    }
    return coursesRowContainers;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 10, right: 12),
        child: Column(
          children: [
            const Text(
              "Kỳ 2 - Năm 2023 - 2024",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey
              )
            ),
            ...renderCreditCourses(_creditCourses)
          ],
        ),
      ),
    );
  }

}