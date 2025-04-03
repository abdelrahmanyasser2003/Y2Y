import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/Screens/authentication/reset_Password_Screen.dart';
import 'package:y2y/ui/Screens/authentication/verify_email.dart';
import 'package:y2y/ui/screens/authentication/enter_The_Code_Screen.dart';
import 'package:y2y/ui/screens/authentication/forget_Password_Screen.dart';
import 'package:y2y/ui/screens/authentication/log_In_Screen.dart';
import 'package:y2y/ui/screens/authentication/policy_Of_Privacy_Screen.dart';
import 'package:y2y/ui/screens/authentication/sign_Up_Screen.dart';
import 'package:y2y/ui/screens/authentication/splash_Screen.dart';
import 'package:y2y/ui/screens/authentication/terms_Of_Use_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/home_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/tab_Bar.dart';
import 'package:y2y/ui/screens/opportunities/opportunities_Screen.dart';
import 'package:y2y/ui/screens/profile_setup/communitys_Suggsestion_Screen.dart';
import 'package:y2y/ui/screens/profile_setup/interest_Selection_Screen.dart';
import 'package:y2y/ui/screens/profile_setup/profile_Pic_About_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Project(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/splashscreen",
          routes: {
            "/splashscreen": (context) => const Splashscreen(),
            "/LoginPage": (context) => const LoginPage(),
            "/SignupPage": (context) => const SignupPage(),
            "/Forgetpassword": (context) => const Forgetpassword(),
            "/Enterthecode": (context) => const Enterthecode(),
            "/Resetpassword": (context) => const Resetpassword(),
            "/Homepage": (context) => const Homepage(),
            "/Policyofprivacy": (context) => const Policyofprivacy(),
            "/Termsofuse": (context) => const Termsofuse(),
            "/Homepagecontent": (context) => const Homepagecontent(),
            "/HomepagecontProfilepicaboutent": (context) =>
                const Profilepicabout(),
            "/Interestselection": (context) => const Interestselection(),
            "/Communitysuggsestion": (context) => const Communitysuggsestion(),
            "/opportunities": (context) => const Opportunities(),
            "/verifyemail": (context) => const VerifyEmail(),
          },
        );
      },
    );
  }
}
