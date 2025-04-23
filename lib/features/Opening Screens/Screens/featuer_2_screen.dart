import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opening%20Screens/Screens/login_or_signup_screen.dart';



class Featuer2Screen extends StatelessWidget {
  const Featuer2Screen({super.key});

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
                    'assets/img/2.png',
                    width: 448.w,
                    height: 278.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Join Engaging Communities",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20.sp,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hieghtspace(hieght: 5),
                  Text(
                    textAlign: TextAlign.center,
                    "Be part of interest-based communities where you can learn, collaborate, and grow with like-minded individuals",
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
            hieghtspace(hieght: 90),
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
