import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/Featuer_2_Screen_voulnteer.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/request_become_volunteer.dart';

class Featuer1ScreenVoulnteer extends StatelessWidget {
  const Featuer1ScreenVoulnteer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/voulnteer 1.png',
                    width: 320.w,
                    height: 280.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Make an Impact",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 21.sp,
                      color: white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "As a volunteer, you’ll contribute your skills, ideas, and passion to real initiatives that create change. Every action you take will inspire others and leave a lasting impact",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18.sp,
                      color: white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            hieghtspace(hieght: 60),
            SizedBox(
              height: 39.h,
              width: double.infinity,
              child: ElvatedButtonWidget(
                  color: white,
                  backgroundColor: WidgetStatePropertyAll(green),
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestBecomeVolunteer()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
