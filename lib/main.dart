import 'package:flutter/material.dart';
import 'package:y2y/pages/enter_the_code.dart';
import 'package:y2y/pages/forgetpassword.dart';
import 'package:y2y/pages/homepage.dart';
import 'package:y2y/pages/login.dart';
import 'package:y2y/pages/policyofprivacy.dart';
import 'package:y2y/pages/resetpassword.dart';
import 'package:y2y/pages/signup.dart';
import 'package:y2y/pages/splashscreen.dart';
import 'package:y2y/pages/termsofuse.dart';
import 'package:y2y/pages/homepagecontent.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:"/splashscreen" ,
      routes: {
         "/splashscreen": (context) => const Splashscreen(),
        "/LoginPage": (context) =>  const LoginPage(),
        "/SignupPage": (context) =>  const SignupPage(),
        "/Forgetpassword": (context) => const Forgetpassword(),
        "/Enterthecode": (context) => const Enterthecode(),
        "/Resetpassword": (context) => const Resetpassword(),
        "/Homepage": (context) => const Homepage(),
        "/Policyofprivacy": (context) => const Policyofprivacy(),
        "/Termsofuse": (context) => const Termsofuse(),
        "/Homepagecontent": (context) => const Homepagecontent(),

      } ,
    );
  }
}