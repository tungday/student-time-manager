import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:schedule/component/app_colors.dart";
import "package:schedule/component/schedule_item.dart";
import "package:schedule/screen/time_table/time_table.dart";

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with TickerProviderStateMixin {
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
    return Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 60,
              color: AppColor.bluePrimaryColor1,
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  IconButton(
                      onPressed: () => {},
                      icon: SvgPicture.asset(
                        "assets/user_ic.svg",
                        width: 35,
                        height: 35,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Xin Chào",
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Text("NGUYEN PHUONG NAM".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13, height: 1, fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppColor.bluePrimaryColor1,
              margin: const EdgeInsets.only(top: 1),
              height: 30,
              child: TabBar.secondary(
                  controller: _tabController,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  indicator:
                      const BoxDecoration(color: AppColor.bluePrimaryColor2),
                  indicatorColor: AppColor.yellowColor,
                  tabs: const [
                    Tab(
                      child: Text("Thời khóa biểu"),
                    ),
                    Tab(
                      child: Text("Sự kiện học tập"),
                    )
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                TimeTable(),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Center(child: Text('SU KIEN HOC TAP')),
                ),
              ]),
            )
          ],
        ));
  }
}
