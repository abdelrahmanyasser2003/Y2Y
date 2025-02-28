import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/ui/Widges/apper_logo_auth_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';
import 'package:y2y/ui/screens/authentication/sign_Up_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/home_Screen.dart';
import 'package:y2y/ui/widges/colors.dart';

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
                        Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 30.sp,
                            color: cornflowerblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        TextFormFieldWidget(
                          maxLength: null,
                          maxLines: null,
                          onChanged: (value) => checkFields(),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          controller: emailController,
                          hintText: 'Email or Phone Number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your Email";
                            }
                            return null;
                          },
                          suffixIcon: null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        TextFormFieldWidget(
                          maxLength: null,
                          maxLines: null,
                          onChanged: (value) => checkFields(),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: isvisablee,
                          controller: passwordController,
                          hintText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your password";
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
                                Navigator.pushNamed(context, "/Forgetpassword");
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
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homepage(),
                                      ),
                                    );
                                  }
                                : null,
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
                                "Create a New Account ?",
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
