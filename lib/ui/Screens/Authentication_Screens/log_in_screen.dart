import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/networking/auth_apis/login_api.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/forget_password_screen.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/sign_up_screen.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/home_screen.dart';
import 'package:y2y/ui/Widges/apper_logo_auth_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

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
      isLoading = true;
    });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    final apiService = LoginApiService();

    String? token = await apiService.login(email, password);

    setState(() {
      isLoading = false;
    });

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("فشل تسجيل الدخول، تأكد من البريد الإلكتروني وكلمة المرور"),
          backgroundColor: Colors.red,
        ),
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
            ApperLogoAuthWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                width: 300.w,
                height: 370.h,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
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
                            text: "Login",
                            onPressed: isButtonEnabled
                                ? _login
                                : null, // استدعاء دالة تسجيل الدخول
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
