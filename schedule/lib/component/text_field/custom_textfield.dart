import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final double? width;
  final String? labelText;
  // final Widget? prefixIcon;
  // final Widget? suffixIcon;

  const CustomTextField({Key? key,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '*',
    this.hintText,
    this.width = 150,
    this.labelText
    // this.prefixIcon,
    // this.suffixIcon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        obscuringCharacter: obscureCharacter!,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColor.bluePrimaryColor1,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            color: AppColor.grayColor,
          ),
          // prefixIcon: prefixIcon,
          // suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: AppColor.bluePrimaryColor1,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.lightBlue,
              width: 2.0,
            ),

          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}