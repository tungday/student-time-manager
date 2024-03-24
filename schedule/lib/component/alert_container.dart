import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:schedule/component/app_colors.dart';

class AlertContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color borderColor;
  final String label;
  final String datetime;

  const AlertContainer({
    this.width = 300,
    this.height = 80,
    this.borderColor = Colors.black,
    required this.label ,
    required this.datetime ,

  });

  @override
  _AlertContainerState createState() => _AlertContainerState();
}

class _AlertContainerState extends State<AlertContainer> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSwitched = !isSwitched;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.bluePrimaryColor2,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.fromLTRB(12.0, 15.0, 20.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.label,
                        style: const TextStyle(
                            color: AppColor.bluePrimaryColor1,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.datetime,
                        style: const TextStyle(
                            color: AppColor.bluePrimaryColor1,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Text(
                      //   widget.date,
                      //   style: const TextStyle(
                      //       color: AppColor.bluePrimaryColor1,
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 20),
                      // ),
                    ],
                  )
                ],
              ),
              FlutterSwitch(
                width: 60.0,
                height: 30.0,
                value: isSwitched,
                borderRadius: 30.0,
                padding: 3.0,
                toggleSize: 25.0,
                activeToggleColor: Colors.white,
                inactiveToggleColor: Colors.white,
                activeSwitchBorder: Border.all(
                  color: AppColor.bluePrimaryColor1,
                  width: 2.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                activeColor: AppColor.green,
                inactiveColor: Colors.grey,
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
