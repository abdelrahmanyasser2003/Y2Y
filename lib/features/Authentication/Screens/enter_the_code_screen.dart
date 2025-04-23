import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/features/Authentication/provider/verify_email_provider.dart';
import 'package:y2y/features/Authentication/repo/enter_the_code_api_services.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Authentication/Screens/reset_password_screen.dart';
import 'package:y2y/features/Authentication/Screens/verify_email_screen.dart';
import 'package:y2y/features/Authentication/widges/icon_button_widget.dart';


// استيراد خدمة التحقق من الكود

class Enterthecode extends StatelessWidget {
  const Enterthecode({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController codecontroller = TextEditingController();

    // دالة للتحقق من الكود
    Future<void> verifyCode() async {
      String email = Provider.of<VerifyEmailProvider>(context, listen: false)
          .email; // قم بتعديل هذا للحصول على البريد الإلكتروني من الـ Provider أو متغير آخر
      String otp = codecontroller.text;

      bool result =
          await EnterTheCodeApiServices().verifyCode(email: email, otp: otp);

      if (result) {
        // إذا كان الكود صحيحًا، يمكنك الانتقال إلى شاشة إعادة تعيين كلمة المرور
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Resetpassword(
              otpp: codecontroller.text,
              email: email,
            ), // قم بتوجيه المستخدم إلى شاشة إعادة تعيين كلمة المرور
          ),
        );
      } else {
        // إذا فشل التحقق من الكود، اعرض رسالة خطأ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('الكود المدخل غير صحيح.')),
        );
      }
    }

    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ApperLogoAuthWidget(),
            IconButtonWidget(),
          ],
        ),
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
                                    onPressed:
                                        verifyCode, // استدعاء دالة التحقق من الكود
                                  )),
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
      ])),
    );
  }
}
