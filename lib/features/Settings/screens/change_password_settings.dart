import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';
import 'package:y2y/features/Settings/screens/forget_password_settings_screen.dart';

class ChangePasswordSettings extends StatefulWidget {
  const ChangePasswordSettings({super.key});

  @override
  State<ChangePasswordSettings> createState() => _ChangePasswordSettingsState();
}

class _ChangePasswordSettingsState extends State<ChangePasswordSettings> {
  bool isvisablee = true;
  bool isvisablee1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndBackWidget(text: 'Change Password'),
            hieghtspace(hieght: 20),
            Text(
              "Old Password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 5),
            Column(
              children: [
                TextFormFieldWidget(
                  height: 60,
                  hintText: 'Enter your old password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isvisablee = !isvisablee;
                        });
                      },
                      icon: isvisablee
                          ? const Icon(Icons.visibility, color: Colors.grey)
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const Forgetpassword()));
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontFamily: "Lato",
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
            hieghtspace(hieght: 40),
            Text(
              "New Password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              height: 60,
              hintText: 'Enter your New password',
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isvisablee = !isvisablee;
                    });
                  },
                  icon: isvisablee
                      ? const Icon(Icons.visibility, color: Colors.grey)
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            hieghtspace(hieght: 10),
            Text(
              "Confirm New Password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              height: 60,
              hintText: 'Enter your New password again',
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isvisablee1 = !isvisablee1;
                    });
                  },
                  icon: isvisablee1
                      ? const Icon(Icons.visibility, color: Colors.grey)
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
            ),
            hieghtspace(hieght: 120),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElvatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ForgetPasswordSettingsScreen()));
                },
                backgroundColor: WidgetStatePropertyAll(green),
                color: white,
                text: 'Save Changes',
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
