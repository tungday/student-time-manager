import 'package:flutter/material.dart';
import 'package:schedule/component/alert_container.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/alert/alert_add.dart';

import 'noti.dart';

class AlertHome extends StatefulWidget {
  const AlertHome({Key? key}) : super(key: key);

  @override
  State<AlertHome> createState() => _AlertHomeState();
}

class _AlertHomeState extends State<AlertHome> {
  List<Map<String, dynamic>> alarms = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // Chuyển sang màn hình Noti và truyền danh sách alarms
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Noti(alarms: alarms)),
                );
              },
              icon: Icon(Icons.notifications),
            ),
          ],
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Báo Thức",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              height: 1,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  return AlertContainer(
                    label: alarm['label'],
                    datetime: alarm['datetime'],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddAlarm()),
                      );

                      // Kiểm tra nếu kết quả không null
                      if (result != null) {
                        // Thêm dữ liệu báo thức nhận được vào danh sách
                        setState(() {
                          alarms.add(result);
                        });
                      }
                    },
                    backgroundColor: AppColor.bluePrimaryColor1,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
