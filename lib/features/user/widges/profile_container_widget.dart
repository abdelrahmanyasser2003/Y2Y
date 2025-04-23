import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget(
      {super.key, required this.text, this.hieght, this.width});
  final double? width;
  final double? hieght;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 175.w,
      height: hieght ?? 49.h,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: cornflowerblue,
            fontWeight: FontWeight.w600,
            fontFamily: "Lato",
          ),
        ),
      ),
    );
  }
}
