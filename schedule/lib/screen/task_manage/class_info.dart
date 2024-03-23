import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';

class ClassInfo extends StatelessWidget {
  final String course;
  final String? teacher;
  final String? classroom;
  final num progress;

  const ClassInfo({
    required this.course,
    this.teacher,
    this.classroom,
    required this.progress,
    super.key
  });

  List<GestureDetector> renderFeatures({required List<Map<String, dynamic>> features}) {
    return features.map<GestureDetector>((feature) => GestureDetector(
      onTap: feature["tapHandle"],
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColor.lightGreen,
          borderRadius: BorderRadius.circular(8)
        ),
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: 38,
              // height: 38,
              padding: const EdgeInsets.only(right: 18),
              child: SvgPicture.asset(
                feature["icon"],
                width: 24,
                color: AppColor.bluePrimaryColor2,
              ),
            ),
            Expanded(
              child: Text(
                feature["label"],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 26,
            )
          ],
        ),
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Thông tin lớp học",
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
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 18),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      course,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 164,
                    color: Colors.grey.withOpacity(0.5),
                  )
                ]
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/teacher_ic.svg",
                    width: 16,
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      teacher ?? "Không có thông tin",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/classroom_ic.svg",
                    width: 16,
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      classroom ?? "Không có thông tin",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 16, right: 10, bottom: 16),
              margin: const EdgeInsets.only(bottom: 10),
              color: AppColor.lightGreen,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Tiến trình môn học",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/arrow_right_long_ic.svg",
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "20/5",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.red
                        ),
                      ),
                      const SizedBox(height: 6,),
                      LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: AppColor.grayColor,
                        color: AppColor.bluePrimaryColor2,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      Text(
                        "$progress%",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ...renderFeatures(features: [
              {
                "label": "Thông tin sinh viên",
                "icon": "assets/group_user_ic.svg",
                "tapHandle": () {}
              },
              {
                "label": "Kết quả học tập",
                "icon": "assets/learning_result_ic.svg",
                "tapHandle": () {}
              },
              {
                "label": "Nhiệm vụ môn học",
                "icon": "assets/assignment_ic.svg",
                "tapHandle": () {}
              },
            ]),
          ],
        )
      ),
    );
  }

}