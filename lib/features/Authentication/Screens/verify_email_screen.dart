import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/features/Authentication/provider/verify_email_provider.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/features/Authentication/Screens/log_in_screen.dart';



class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<VerifyEmailProvider>(context).email;

    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApperLogoAuthWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Center(
            child: Expanded(
              child: Container(
                width: 330.w,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                  child: Column(
                    children: [
                      Text("Verify your Email",
                          style: AppStyles().mon24w700style),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Text(
                        'A verification email has been sent to your',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'email',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 70),
                          Text(email,
                              style: TextStyle(
                                  color: cornflowerblue,
                                  fontSize: 13.sp,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        ' Please Check your email and click the like\n    provided in the email to complete your\n                        account registration',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        '             If you didn’t receive the email within 5 minutes\n Please Use the button below to resend the verification email. ',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      ElvatedButtonWidget(
                          text: 'Resend Verification Email',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          backgroundColor: WidgetStatePropertyAll(green),
                          color: white)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
