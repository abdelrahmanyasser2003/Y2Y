import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/provider/auth_provider/login_provider.dart';
import 'package:y2y/provider/auth_provider/verify_email_provider.dart';
import 'package:y2y/provider/community_provider.dart';
import 'package:y2y/provider/edit_profile_provider.dart';
import 'package:y2y/provider/messages_provider.dart';
import 'package:y2y/provider/new_opportunity_provider.dart';
import 'package:y2y/provider/notfications_provider.dart';
import 'package:y2y/provider/profile_provider.dart';
import 'package:y2y/provider/user_chat_provider.dart';
import 'package:y2y/provider/user_details_provider.dart';
import 'package:y2y/ui/Screens/Authentication_Screens/sign_up_screen.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => NewOpportunityProvider()),
    ChangeNotifierProvider(create: (ctx) => NotficationsProvider()),
    ChangeNotifierProvider(create: (ctx) => MessagesProvider()),
    ChangeNotifierProvider(create: (ctx) => UserDetailsProvider()),
    ChangeNotifierProvider(create: (ctx) => VerifyEmailProvider()),
    ChangeNotifierProvider(create: (ctx) => CommunityProvider()),
    ChangeNotifierProvider(create: (ctx) => UserChatProvider()),
    ChangeNotifierProvider(create: (ctx) => ProfileProvider()),
    ChangeNotifierProvider(create: (ctx) => LoginProvider()),
    ChangeNotifierProvider(create: (ctx) => EditProfileProvider()),
  ], child: MyApp()));
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
          home: SignupPage(),
        );
      },
    );
  }
}
