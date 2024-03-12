import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/calendar/week_selected.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TimeTableManage extends StatefulWidget {
  const TimeTableManage({Key? key}) : super(key: key);

  @override
  State<TimeTableManage> createState() => _TimeTableManageState();
}

class _TimeTableManageState extends State<TimeTableManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 60,
                color: AppColor.bluePrimaryColor1,
                child: Row(
                  children: [
                    // const Padding(padding: EdgeInsets.only(left: 5)),
                    IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: SvgPicture.asset(
                          "assets/angle_left_ic.svg",
                          width: 35,
                          height: 35,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        )),
                    const Spacer(),
                     Center(
                      child: Text(AppLocalizations.of(context)!.scheduleManage ,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1,
                              fontWeight: FontWeight.w600)),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ),
              WeekSelected()
            ],
          ),
        ),
      ),
    );
  }
}
