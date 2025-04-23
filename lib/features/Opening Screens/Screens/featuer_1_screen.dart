import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opening%20Screens/Screens/login_or_signup_screen.dart';




class Featuer1Screen extends StatelessWidget {
  const Featuer1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/ytylogo.png',
              width: 160.w,
              height: 111.h,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/1.png',
                    width: 340.w,
                    height: 300.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Find your Opportunity",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 21.sp,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hieghtspace(hieght: 5),
                  Text(
                    textAlign: TextAlign.center,
                    "Discover volunteering, events, and skill-building opportunities that match your interests and help you grow",
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
            hieghtspace(hieght: 70),
            SizedBox(
              height: 39.h,
              width: 80.w,
              child: ElvatedButtonWidget(
                  color: white,
                  backgroundColor: WidgetStatePropertyAll(button),
                  text: "Skip",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginOrSignup()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
