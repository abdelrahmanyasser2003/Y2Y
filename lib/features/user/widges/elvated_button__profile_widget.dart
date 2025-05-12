import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ElvatedButtonPrfileWidget extends StatelessWidget {
  const ElvatedButtonPrfileWidget(
      {super.key,
      this.fontWeight,
      required this.onPressed,
      this.icon,
      this.height,
      required this.text,
      this.color,
      this.colorIcon,
      required this.width,
      this.fontSize});
  final void Function()? onPressed;
  final IconData? icon;
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? colorIcon;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 41.h,
      child: ElevatedButton.icon(
        label: Text(
          text,
          style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 15.sp,
              color: color,
              fontFamily: "Poppins"),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: colorIcon ?? white,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(button),
          elevation: WidgetStatePropertyAll(5),
          shadowColor: WidgetStatePropertyAll(Colors.black),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
