import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/screen/time_table/add_new_schedule.dart';

class ActivityItem extends StatelessWidget {
  final String day;
  final String subject;
  final String note;
  final int fontSize;
  final String timeIn;
  final String timeOut;
  final bool? isNow;
  final bool? isPractice;
  final bool? isAction;
  final VoidCallback? onDeleteItemActivity;
  final VoidCallback? updateActivity;
  const ActivityItem({
    super.key,
    required this.day,
    required this.subject,
    required this.note,
    required this.fontSize,
    required this.timeIn,
    required this.timeOut,
    this.isNow,
    this.isPractice,
    this.isAction,
    this.onDeleteItemActivity,
    this.updateActivity,
  });

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
                        day,
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
              color: isPractice ?? false
                  ? AppColor.redColor
                  : AppColor.bluePrimaryColor1,
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
                    Expanded(
                      child: Center(
                        widthFactor: 1,
                        child: Text(
                          subject,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isPractice ?? false
                                ? AppColor.redColor
                                : AppColor.bluePrimaryColor1,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: note != "",
                      child: Expanded(
                        flex: 1,
                        child: Text(
                          note == "" ? "" : "Ghi chú: ${(note)}",
                          style: TextStyle(
                            fontSize: 13,
                            color: isPractice ?? false
                                ? AppColor.redColor
                                : AppColor.bluePrimaryColor1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            isAction ?? false
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Text("Chỉnh sửa"),
                          height: 30,
                          onTap: updateActivity),
                      PopupMenuItem(
                        child: Text("Xoá"),
                        height: 30,
                        onTap: onDeleteItemActivity,
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
