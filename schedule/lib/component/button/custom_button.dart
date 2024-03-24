import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String? btnText;
  final Color? btnColor;
  final Color? textColor;
  final double? btnWidth;
  final double? btnHeight;

  const CustomButton({Key? key,
    required this.onTap,
    this.btnText = 'Gradient Button',
    this.btnColor = AppColor.bluePrimaryColor1,
    this.textColor = Colors.white,
    this.btnHeight = 30,
    this.btnWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      splashColor: Colors.blue.withOpacity(0.4),
      child: Ink(
        width: btnWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: btnColor
        ),
        child: Center(
          child: Text(btnText!,
            style: TextStyle(
              fontSize: 13,
              color: textColor,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}