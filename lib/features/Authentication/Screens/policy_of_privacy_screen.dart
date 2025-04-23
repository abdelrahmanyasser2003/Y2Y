import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/features/Authentication/Screens/terms_of_use_screen.dart';
import 'package:y2y/features/Authentication/widges/icon_button_widget.dart';

class Policyofprivacy extends StatefulWidget {
  const Policyofprivacy({super.key});

  @override
  State<Policyofprivacy> createState() => _PolicyofprivacyState();
}

class _PolicyofprivacyState extends State<Policyofprivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ApperLogoAuthWidget(),
                IconButtonWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policy",
                      style: AppStyles().mon35w700style.copyWith(color: white)),
                  hieghtspace(hieght: 10),
                  Container(
                    width: 379.w,
                    height: 420.h,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Effective Date: [Insert Date]\n\n'
                              'This Privacy Policy describes how we collect, use, and protect your information when you use our app.\n\n'
                              '1. *Information Collection*:\n'
                              '   - We may collect personal information such as your name, email address, and usage data.\n\n'
                              '2. *Use of Information*:\n'
                              '   - Your information is used to improve user experience, provide customer support, and send updates.\n\n'
                              '3. *Data Security*:\n'
                              '   - We implement measures to ensure the safety of your data, but no method is 100% secure.\n\n'
                              '4. *Sharing of Information*:\n'
                              '   - We do not share your personal information with third parties without your consent unless required by law.\n\n'
                              '5. *Your Rights*:\n'
                              '   - You have the right to access, modify, or delete your personal information.\n\n'
                              'If you have any questions, please contact us at [Insert Contact Email].\n\n'
                              'Thank you for using our app!',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: cornflowerblue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  hieghtspace(hieght: 10),
                  SizedBox(
                      width: double.infinity,
                      child: ElvatedButtonWidget(
                        text: 'Next',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Termsofuse(),
                            ),
                          );
                        },
                        color: white,
                        backgroundColor: WidgetStatePropertyAll(green),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
