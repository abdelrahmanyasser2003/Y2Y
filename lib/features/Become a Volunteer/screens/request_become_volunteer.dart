import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';

class RequestBecomeVolunteer extends StatefulWidget {
  const RequestBecomeVolunteer({super.key});

  @override
  State<RequestBecomeVolunteer> createState() => _RequestBecomeVolunteerState();
}

class _RequestBecomeVolunteerState extends State<RequestBecomeVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Become Volunteer",
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
            Text(
              "Verify Your Identity",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Please upload clear photos of the front and back of your official ID to complete your application",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15.sp,
                color: white,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
