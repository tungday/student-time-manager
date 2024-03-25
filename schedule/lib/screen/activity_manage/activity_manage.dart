import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/screen/activity_manage/list_activity.dart';

import '../../component/app_colors.dart';

class ActivityManage extends StatefulWidget {
  const ActivityManage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ActivityManageState();
  }
}

class _ActivityManageState extends State<ActivityManage>
    with TickerProviderStateMixin {
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
          title: const Row(children: [
            Expanded(
                child: Text(
              "THỜI GIAN BIỂU",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 22, height: 1),
            )),
            Icon(Icons.notifications)
          ]),
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
                    fontSize: 14),
                indicator:
                    const BoxDecoration(color: AppColor.bluePrimaryColor2),
                indicatorColor: AppColor.yellowColor,
                tabs: const [
                  Tab(
                    text: "Thời gian biểu",
                  ),
                  Tab(
                    text: "Sự kiện quan trọng",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [ListActivity()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
