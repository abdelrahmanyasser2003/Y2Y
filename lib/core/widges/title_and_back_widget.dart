import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';

class TitleAndBackWidget extends StatelessWidget {
  const TitleAndBackWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.center,
              text ?? "Become Volunteer",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text(
                'back',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.sp,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: white,
              ),
              iconAlignment: IconAlignment.end,
            )
          ],
        ),
        Divider(
          thickness: 0.3,
          color: white,
        )
      ],
    );
  }
}
