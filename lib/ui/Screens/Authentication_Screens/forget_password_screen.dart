import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/provider/auth_provider/verify_email_provider.dart';

import 'package:y2y/ui/Screens/Authentication_Screens/enter_the_code_screen.dart';
import 'package:y2y/ui/Widges/apper_logo_auth_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApperLogoAuthWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              width: 300.w,
              height: 240.h,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Forget Password",
                          style: AppStyles().mon24w700style),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                          maxLength: null,
                          maxLines: null,
                          onChanged: null,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: emailcontroller,
                          hintText: 'Enter Your Email or Phone Number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your Email or Phone Number";
                            }
                            return null;
                          },
                          suffixIcon: null,
                          obscureText: false),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElvatedButtonWidget(
                              color: white,
                              backgroundColor: WidgetStatePropertyAll(green),
                              text: 'Send Code',
                              onPressed: () {
                                Provider.of<VerifyEmailProvider>(context,
                                        listen: false)
                                    .setEmail(emailcontroller.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Enterthecode(),
                                  ),
                                );
                              })),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
