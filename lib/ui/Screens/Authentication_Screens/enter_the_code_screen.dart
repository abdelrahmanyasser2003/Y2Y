import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/reset_password_screen.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/verify_email.dart';

import 'package:y2y/ui/Widges/apper_logo_auth_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

class Enterthecode extends StatelessWidget {
  const Enterthecode({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController codecontroller = TextEditingController();
    return Scaffold(
        backgroundColor: cornflowerblue,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ApperLogoAuthWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            width: 300.w,
            height: 280.h,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enter The Code",
                              style: AppStyles().mon24w700style),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 45,
                          ),
                          TextFormFieldWidget(
                            maxLength: null,
                            maxLines: null,
                            onChanged: null,
                            controller: codecontroller,
                            hintText: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter the Code";
                              }
                              return null;
                            },
                            suffixIcon: null,
                            obscureText: null,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                    width: 112.w,
                                    height: 50.h,
                                    child: ElvatedButtonWidget(
                                        color: white,
                                        backgroundColor:
                                            WidgetStatePropertyAll(green),
                                        text: 'Submit',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Resetpassword(),
                                            ),
                                          );
                                        })),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              SizedBox(
                                  width: 130.w,
                                  height: 50.h,
                                  child: ElvatedButtonWidget(
                                      color: Color(0xff3C3C43),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xffB7B7B7)),
                                      text: 'Resend',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VerifyEmail(),
                                          ),
                                        );
                                      })),
                            ],
                          ),
                        ]))),
          )
        ])));
  }
}
