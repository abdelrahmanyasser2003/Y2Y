import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opening%20Screens/Screens/login_or_signup_screen.dart';



class Featuer3Screen extends StatelessWidget {
  const Featuer3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
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
                    'assets/img/3.png',
                    width: 360.w,
                    height: 280.h,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Connections & Networking",
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
                    "Connect with mentors, peers, and professionals that exchange knowledge and explore new opportunities",
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
            hieghtspace(hieght: 95),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              height: 50.h,
              width: double.infinity,
              child: ElvatedButtonWidget(
                  color: green,
                  backgroundColor: WidgetStatePropertyAll(white),
                  text: "Let’s Get Started",
                  fontSize: 23.sp,
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
