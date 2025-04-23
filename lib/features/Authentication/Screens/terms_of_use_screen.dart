import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/features/Authentication/widges/icon_button_widget.dart';
import 'package:y2y/features/Profile%20Setup/Screens/profile_pic_about_screen.dart';

class Termsofuse extends StatefulWidget {
  const Termsofuse({super.key});

  @override
  State<Termsofuse> createState() => _TermsofuseState();
}

class _TermsofuseState extends State<Termsofuse> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ApperLogoAuthWidget(), IconButtonWidget()],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Terms of Use",
                    style: AppStyles().mon35w700style.copyWith(color: white)),
                hieghtspace(hieght: 10),
                Container(
                  width: 379,
                  height: 420,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: const SingleChildScrollView(
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
                              fontSize: 15,
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
                Row(
                  children: [
                    Checkbox(
                      side: BorderSide(color: white),
                      value: ischecked,
                      onChanged: (value) {
                        setState(() {
                          ischecked = value ?? false;
                        });
                      },
                      fillColor: const WidgetStatePropertyAll(white),
                      checkColor: cornflowerblue,
                    ),
                    const Text(
                        "i accept the terms of use\n and policy of privacy",
                        style: TextStyle(
                            fontSize: 12,
                            color: white,
                            fontWeight: FontWeight.bold)),
                    Widthspace(width: 10),
                    SizedBox(
                        width: 121,
                        height: 50,
                        child: ElvatedButtonWidget(
                          text: 'Continue',
                          onPressed: ischecked
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Profilepicabout(),
                                      ));
                                }
                              : null,
                          color: white,
                          backgroundColor: WidgetStatePropertyAll(green),
                        )),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
