import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/spaceing_widges.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/log_in_screen.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/sign_up_screen.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/ytylogo.png",
                width: 270,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(
                textAlign: TextAlign.center,
                "Youth to Youth",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 35.sp,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Connect, Learn and Grow!",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 21.sp,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              hieghtspace(hieght: 60),
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: ElvatedButtonWidget(
                        text: "Login",
                        fontSize: 23.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        backgroundColor: WidgetStatePropertyAll(green),
                        color: white),
                  ),
                  Widthspace(width: 10),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: ElvatedButtonWidget(
                        text: "Sign up",
                        fontSize: 23.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        backgroundColor: WidgetStatePropertyAll(white),
                        color: green),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
