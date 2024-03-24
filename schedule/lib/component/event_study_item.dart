import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/models/event_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventStudyItem extends StatelessWidget {
  const EventStudyItem({super.key, this.eventInfo, this.day, this.isAction, this.onDeleteItemEvent, this.updateEvent});

  final EventInfo? eventInfo;
  final String? day;
  final bool? isAction;
  final VoidCallback? onDeleteItemEvent;
  final VoidCallback? updateEvent;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.bluePrimaryColor3,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(day!,
                      //   textAlign: TextAlign.center,
                      //   style: const TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w700,
                      //     color: AppColor.bluePrimaryColor1,
                      //   ),
                      // ),
                      Text(
                        eventInfo!.startTime,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1,
                          fontSize: 13,
                          color: AppColor.bluePrimaryColor1,
                        ),
                      ),
                      // Text(
                      //   eventInfo!.endTime,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     height: 1,
                      //     fontSize: 13,
                      //     color: AppColor.bluePrimaryColor1,
                      //   ),
                      // ),
                    ],
                  ),
                )),
            VerticalDivider(
              color: eventInfo!.colorSelected,
              width: 2,
              thickness: 6,
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(top: 8, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventInfo!.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColor.bluePrimaryColor1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      eventInfo!.note,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColor.bluePrimaryColor1,
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
                          child: Text("Chinh Sua"), height: 30, onTap: updateEvent),
                      PopupMenuItem(
                        child: Text("Xoa"),
                        height: 30,
                        onTap: onDeleteItemEvent,
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
