import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ElvatedButtonWidget extends StatelessWidget {
  const ElvatedButtonWidget(
      {super.key,
      this.fontSize,
      this.colorBorder,
      this.text,
      this.icon,
      required this.onPressed,
      required this.backgroundColor,
      required this.color});
  final String? text;
  final IconData? icon;
  final Color? colorBorder;

  final double? fontSize;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(5),
        shadowColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: backgroundColor,
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colorBorder ?? green))),
      ),
      child: Text(
        text ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize ?? 15.sp,
            color: color,
            fontFamily: "Poppins"),
      ),
    );
  }
}
