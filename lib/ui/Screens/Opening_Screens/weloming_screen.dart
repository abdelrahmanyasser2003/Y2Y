import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/spaceing_widges.dart';
import 'package:y2y/ui/Screens/Opening_Screens/on_boarding_screen.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';

class WelomingScreen extends StatelessWidget {
  const WelomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Image.asset(
              "assets/img/ytylogo.png",
              width: 319,
              height: 227,
            ),
            Text(
              textAlign: TextAlign.center,
              "Welcome to    Youth To Youth",
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
            hieghtspace(hieght: 100),
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
