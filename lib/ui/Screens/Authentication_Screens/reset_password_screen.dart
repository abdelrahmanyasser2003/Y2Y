import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/ui/Widges/apper_logo_auth_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  bool hasUppercase = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isButtonEnabled = false;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void checkFields() {
    setState(() {
      isButtonEnabled = passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    passwordController.addListener(checkFields);
    confirmPasswordController.addListener(checkFields);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reset Your Password",
                          style: AppStyles()
                              .mon24w700style
                              .copyWith(fontSize: 20)),
                      SizedBox(height: MediaQuery.of(context).size.height / 37),
                      TextFormFieldWidget(
                        hintText: 'New Password',
                        maxLength: null,
                        maxLines: null,
                        onChanged: (value) => checkFields(),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your password";
                          }
                          if (value.length < 8) {
                            return "password must be at least 6 characters long";
                          }
                          if (value.contains(RegExp(r'[A-Z]'))) {
                            hasUppercase = true;
                          } else {
                            return "must contain at least one uppercase letter";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        obscureText: isPasswordVisible,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      TextFormFieldWidget(
                        maxLength: null,
                        maxLines: null,
                        onChanged: (value) => checkFields(),
                        controller: confirmPasswordController,
                        hintText: "Confirm New Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please confirm your password";
                          }
                          if (value != passwordController.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        obscureText: isConfirmPasswordVisible,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          child: ElvatedButtonWidget(
                            text: 'Save Changes ',
                            onPressed: isButtonEnabled
                                ? () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Password reset successful!"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                : null,
                            color: white,
                            backgroundColor: WidgetStatePropertyAll(green),
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
