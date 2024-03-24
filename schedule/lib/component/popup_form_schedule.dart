import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/button/custom_button.dart';
import 'package:schedule/component/text_field/custom_textfield.dart';

class PopupFormSchedule extends StatelessWidget {
  const PopupFormSchedule(
      {super.key, this.controller, this.keyboardType, this.hintText});

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text("Them moi mon hoc",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Mon hoc:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            CustomTextField(
                width: 150,
                controller: controller,
                keyboardType: keyboardType,
                hintText: hintText),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Giang vien:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            CustomTextField(
                controller: controller,
                keyboardType: keyboardType,
                hintText: hintText),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Phong hoc:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            CustomTextField(
                controller: controller,
                keyboardType: keyboardType,
                hintText: hintText),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Thuc hanh:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            Checkbox(
              value: true,
              onChanged: (value) => {value = true},
            ),
            // CustomTextField(
            //     controller: controller,
            //     keyboardType: keyboardType,
            //     hintText: hintText),
          ],
        ),
        const Text(
          "Thoi gian:",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Tu:",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                // Spacer(),
                CustomTextField(
                    width: 70,
                    controller: controller,
                    keyboardType: keyboardType,
                    hintText: hintText),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Den:",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                // Spacer(),
                CustomTextField(
                    width: 70,
                    controller: controller,
                    keyboardType: keyboardType,
                    hintText: hintText),
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Spacer(),
            CustomButton(
              onTap: () => {
                Navigator.of(context).pop()
              },
              btnText: "Cancel",
              btnHeight: 30,
              btnWidth: 60,
              btnColor: Colors.white,
              textColor: AppColor.bluePrimaryColor1,
            ),
            const SizedBox(
              width: 15,
            ),
            CustomButton(
              onTap: () => {
                Navigator.of(context).pop()
              },
              btnText: "Save",
              btnHeight: 30,
              btnWidth: 50,
            )
          ],
        )
      ],
    );
  }
}
