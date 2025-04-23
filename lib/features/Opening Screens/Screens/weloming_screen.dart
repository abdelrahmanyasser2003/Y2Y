import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opening%20Screens/Screens/on_boarding_screen.dart';

class WelomingScreen extends StatelessWidget {
  const WelomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Image.asset(
              "assets/img/ytylogo.png",
              width: 319.w,
              height: 227.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "Welcome to Youth To Youth",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 30.sp,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
            hieghtspace(hieght: 30),
            Text(
              textAlign: TextAlign.center,
              "“Empowering youth through volunteering, networking, and opportunities -- connecting like-minded individuals to make an impact”",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 24.sp,
                color: white,
                fontWeight: FontWeight.w400,
              ),
            ),
            hieghtspace(hieght: 80),
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ElvatedButtonWidget(
                  color: white,
                  backgroundColor: WidgetStatePropertyAll(green),
                  text: "Get Started",
                  fontSize: 23.sp,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
