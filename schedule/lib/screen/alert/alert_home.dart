import 'package:flutter/material.dart';
import 'package:schedule/component/alert_container.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/alert/alert_add.dart';

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
          backgroundColor: AppColor.bluePrimaryColor1,
          foregroundColor: Colors.white,
          title: const Center(
            child: Text(
              "Báo Thức",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                height: 1,
              ),
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

                      // Check if result is not null
                      if (result != null) {
                        // Add the received alarm data to the list
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
