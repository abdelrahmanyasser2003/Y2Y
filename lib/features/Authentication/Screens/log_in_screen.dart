import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/features/Authentication/repo/login_api_services.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Authentication/Screens/forget_password_screen.dart';
import 'package:y2y/features/Authentication/Screens/sign_up_screen.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/Screens/home_screen.dart';
import 'package:y2y/features/Profile%20Setup/Screens/profile_pic_about_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  bool isvisablee = true;
  bool isLoading = false; // متغير لحالة التحميل
  String errorMessage = ''; //ل

  void checkFields() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkFields);
    passwordController.addListener(checkFields);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true; // عند البدء في عملية تسجيل الدخول
      errorMessage = ''; // مسح أي رسالة خطأ سابقة
    });

    bool isLoggedIn = await LoginApiServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      isLoading = false; // الانتهاء من عملية تسجيل الدخول
    });

    if (isLoggedIn) {
      showAnimatedSnackDialog(context,
          message: 'Login Successfully', type: AnimatedSnackBarType.success);
      // إذا كانت بيانات الدخول صحيحة، ننتقل إلى الصفحة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profilepicabout()),
      );
    } else {
      // إذا كانت البيانات غير صحيحة، نعرض رسالة خطأ
      setState(() {
        showAnimatedSnackDialog(context,
            message: 'email or password is not correct',
            type: AnimatedSnackBarType.error);
      });
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
            ApperLogoAuthWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                width: 300.w,
                height: 330.h,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10.r)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login",
                            style: AppStyles()
                                .mon35w700style
                                .copyWith(color: cornflowerblue)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        TextFormFieldWidget(
                          onChanged: (value) => checkFields(),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: emailController,
                          hintText: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        TextFormFieldWidget(
                          onChanged: (value) => checkFields(),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: isvisablee,
                          controller: passwordController,
                          hintText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isvisablee = !isvisablee;
                                });
                              },
                              icon: isvisablee
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Forgetpassword()));
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: cornflowerblue,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElvatedButtonWidget(
                            color: white,
                            backgroundColor: WidgetStatePropertyAll(green),
                            text: isLoading ? 'Loading...' : "Login",
                            onPressed: isButtonEnabled
                                ? () {
                                    if (!isLoading) {
                                      _login();
                                    }
                                  }
                                : null,
                          ),
                        ),
                        if (errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Create a New Account?",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: Colors.grey,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 40,
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: cornflowerblue,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
