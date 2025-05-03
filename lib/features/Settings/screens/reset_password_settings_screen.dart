import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';

class ResetPasswordSettingsScreen extends StatefulWidget {
  const ResetPasswordSettingsScreen({super.key});

  @override
  State<ResetPasswordSettingsScreen> createState() =>
      _ResetPasswordSettingsScreenState();
}

bool isvisablee = true;
bool isvisablee1 = true;

class _ResetPasswordSettingsScreenState
    extends State<ResetPasswordSettingsScreen> {
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
            TitleAndBackWidget(text: 'Forget Password'),
            hieghtspace(hieght: 20),
            Text(
              "New Password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.sp,
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
            hieghtspace(hieght: 20),
            Text(
              "Confirm New Password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.sp,
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
            hieghtspace(hieght: 255),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElvatedButtonWidget(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             ForgetPasswordSettingsScreen()));
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
