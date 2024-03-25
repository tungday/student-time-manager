import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleForm extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Widget? floatingActionButton;

  const ScheduleForm({Key? key, required this.title, this.child, this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
          child: Container(
            color: Colors.white,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                        child: Text(title ?? "",
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
                child ?? const SizedBox.shrink()
              ],
        ),
      )),
      floatingActionButton: floatingActionButton,
    );
  }
}
