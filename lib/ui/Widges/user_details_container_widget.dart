import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/app_colors.dart';

class UserDetailsContainerWidget extends StatelessWidget {
  const UserDetailsContainerWidget(
      {super.key, required this.text, this.hieght, this.width});
  final String text;
  final double? width;
  final double? hieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght ?? 50.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: cornflowerblue),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: cornflowerblue,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Lato",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
