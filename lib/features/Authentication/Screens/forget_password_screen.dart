import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/features/Authentication/provider/verify_email_provider.dart';
import 'package:y2y/features/Authentication/repo/forget_password_api_services.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Authentication/Screens/enter_the_code_screen.dart';
import 'package:y2y/features/Authentication/widges/icon_button_widget.dart';


// استيراد خدمة إعادة تعيين كلمة المرور

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailcontroller = TextEditingController();

  // خدمة إعادة تعيين كلمة المرور
  Future<void> _sendCode() async {
    bool result = await ForgotPasswordApiServices().forgotPassword(
      email: emailcontroller.text,
    );

    if (result) {
      Provider.of<VerifyEmailProvider>(context, listen: false)
          .setEmail(emailcontroller.text);

      // إذا كان الطلب ناجحًا، انتقل إلى شاشة إدخال الكود
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Enterthecode(),
        ),
      );
    } else {
      // إذا فشل الطلب، اعرض رسالة خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'فشل في إرسال الطلب، حاول مرة أخرى',
        )),
      );
    }
  }

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
                            onPressed: _sendCode, // استدعاء الدالة هنا
                          )),
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
