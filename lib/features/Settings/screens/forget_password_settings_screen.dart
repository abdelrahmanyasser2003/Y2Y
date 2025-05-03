import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';
import 'package:y2y/features/Settings/screens/reset_password_settings_screen.dart';
import 'package:y2y/features/user/provider/get_user_provider.dart';

class ForgetPasswordSettingsScreen extends StatefulWidget {
  const ForgetPasswordSettingsScreen({super.key});

  @override
  State<ForgetPasswordSettingsScreen> createState() =>
      _ForgetPasswordSettingsScreenState();
}

class _ForgetPasswordSettingsScreenState
    extends State<ForgetPasswordSettingsScreen> {
  @override
  void initState() {
    super.initState();
    // جلب بيانات البروفايل عند بداية الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetUserProvider>(context, listen: false).fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<GetUserProvider>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TitleAndBackWidget(text: 'Forget Password'),
            hieghtspace(hieght: 20),
            Text(
              "We will send you code to Reset your password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: userProvider.user?.profileImage !=
                                    null &&
                                userProvider.user!.profileImage!.isNotEmpty
                            ? NetworkImage(
                                '${ApiEndpoints.baseUrl}${userProvider.user!.profileImage!}')
                            : const AssetImage('assets/img/pic1.jpg')
                                as ImageProvider,
                        radius: 30,
                      ),
                      Widthspace(width: 20),
                      Text(
                        userProvider.user?.userName ?? "",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 19.sp,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  hieghtspace(hieght: 5),
                  Divider(
                    color: purple,
                    thickness: 1,
                  ),
                  hieghtspace(hieght: 5),
                  Text(
                    "Enter your Email or Phone Number",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      color: cornflowerblue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  hieghtspace(hieght: 5),
                  TextFormFieldWidget(
                    hintText: 'f*********@gmail.com',
                    colorBord: green,
                    fillColor: chat,
                  ),
                  hieghtspace(hieght: 20),
                  Text(
                    "Enter the code",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      color: cornflowerblue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  hieghtspace(hieght: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormFieldWidget(
                        hintText: 'f*********@gmail.com',
                        colorBord: green,
                        fillColor: chat,
                      ),
                      hieghtspace(hieght: 3),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const Forgetpassword()));
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              fontFamily: "Lato",
                              color: cornflowerblue,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            hieghtspace(hieght: 100),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElvatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordSettingsScreen()));
                },
                backgroundColor: WidgetStatePropertyAll(green),
                color: white,
                text: 'Continue',
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
