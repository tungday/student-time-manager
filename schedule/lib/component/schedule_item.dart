import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleItem extends StatelessWidget {
  final String text;
  final String subject;
  final String teacher;
  final String room;
  final int fontSize;
  final String timeIn;
  final String timeOut;
  final bool? isNow;
  final bool? isPractice;
  final bool? isAction;

  const ScheduleItem(
      {super.key,
      required this.text,
      required this.subject,
      required this.teacher,
      required this.room,
      required this.fontSize,
      required this.timeIn,
      required this.timeOut,
      this.isNow,
      this.isPractice,
      this.isAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.bluePrimaryColor3,
          border: isNow!
              ? Border.all(
                  color: AppColor.bluePrimaryColor2,
                  width: 2,
                )
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize.toDouble() + 2,
                          fontWeight: FontWeight.w700,
                          color: isPractice ?? false
                              ? AppColor.redColor
                              : AppColor.bluePrimaryColor1,
                        ),
                      ),
                      Text(
                        timeIn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1,
                          fontSize: 13,
                          color: isPractice ?? false
                              ? AppColor.redColor
                              : AppColor.bluePrimaryColor1,
                        ),
                      ),
                      Text(
                        timeOut,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1,
                          fontSize: 13,
                          color: isPractice ?? false
                              ? AppColor.redColor
                              : AppColor.bluePrimaryColor1,
                        ),
                      ),
                    ],
                  ),
                )),
             VerticalDivider(
              color: isPractice ?? false ? AppColor.redColor : AppColor.bluePrimaryColor1,
              width: 2,
              thickness: 2,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 8, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isPractice ?? false
                            ? AppColor.redColor
                            : AppColor.bluePrimaryColor1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${AppLocalizations.of(context)!.teacher}: ${(teacher)}",
                      style: TextStyle(
                        fontSize: 13,
                        color: isPractice ?? false
                            ? AppColor.redColor
                            : AppColor.bluePrimaryColor1,
                      ),
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.classroom}: ${(room)}",
                      style: TextStyle(
                        fontSize: 13,
                        color: isPractice ?? false
                            ? AppColor.redColor
                            : AppColor.bluePrimaryColor1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isAction ?? false
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Chinh Sua"),
                        height: 30,
                      ),
                      PopupMenuItem(
                        child: Text("Xoa"),
                        height: 30,
                      ),
                    ],
                    color: Colors.white,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
