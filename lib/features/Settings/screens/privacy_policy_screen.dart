import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TitleAndBackWidget(
              text: 'Privacy Policy',
            ),
            hieghtspace(hieght: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Text(
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
