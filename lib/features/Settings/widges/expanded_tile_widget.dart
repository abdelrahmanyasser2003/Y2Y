import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ExpandedTileWidget extends StatelessWidget {
  const ExpandedTileWidget({super.key, required this.title, this.subTitle});
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 15.sp,
            color: cornflowerblue,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: cornflowerblue,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              subTitle ?? "",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12.sp,
                color: cornflowerblue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
