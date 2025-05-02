import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';
import 'package:y2y/features/Authentication/Screens/log_in_screen.dart';
import 'package:y2y/features/Settings/provider/logput_provider.dart';
import 'package:y2y/features/Settings/screens/faqs_screen.dart';
import 'package:y2y/features/Settings/screens/privacy_policy_screen.dart';
import 'package:y2y/features/Settings/screens/send_feedback_screen.dart';
import 'package:y2y/features/Settings/screens/terms_of_use_screen.dart';
import 'package:y2y/features/Settings/widges/list_tile_setting_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndBackWidget(text: 'Settings'),
              hieghtspace(hieght: 20),
              Text(
                "Account Settings",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20.sp,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              hieghtspace(hieght: 10),
              ListTileSettingWidget(
                title: 'Profile Information',
                subTitle: 'Email Address, Phone Number, etc...',
                trailing: Icon(Icons.arrow_forward_ios, color: cornflowerblue),
                icon: Icons.person,
                backgroundColor: Color(0xffA6D6FF),
              ),
              ListTileSettingWidget(
                title: 'Change Password',
                subTitle: 'Change your current password',
                trailing: Icon(Icons.arrow_forward_ios, color: cornflowerblue),
                icon: Icons.lock,
                backgroundColor: Color(0xff00C48C),
              ),
              ListTileSettingWidget(
                title: 'Push Notifications',
                fontSize: 15,
                subTitle: 'Control all new activities notify',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: cornflowerblue,
                ),
                icon: Icons.notifications,
                backgroundColor: Color(0xffFF98A8),
              ),
              hieghtspace(hieght: 15),
              Text(
                "General",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20.sp,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              hieghtspace(hieght: 5),
              ListTileSettingWidget(
                title: 'Change Language',
                fontSize: 15,
                subTitle: selectedLanguage,
                trailing: PopupMenuButton<String>(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  icon: Icon(Icons.arrow_drop_down,
                      size: 40, color: cornflowerblue),
                  onSelected: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Arabic',
                      textStyle: TextStyle(fontFamily: 'Inter'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Arabic'),
                          if (selectedLanguage == 'Arabic')
                            Icon(Icons.check, color: cornflowerblue, size: 18),
                        ],
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 'English',
                      textStyle: TextStyle(fontFamily: 'Inter'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('English'),
                          if (selectedLanguage == 'English')
                            Icon(Icons.check, color: cornflowerblue, size: 18),
                        ],
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 'French',
                      textStyle: TextStyle(fontFamily: 'Inter'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('French'),
                          if (selectedLanguage == 'French')
                            Icon(Icons.check, color: cornflowerblue, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
                icon: Icons.language,
                backgroundColor: Color(0xffA6D6FF),
              ),
              ListTileSettingWidget(
                title: 'FAQs',
                subTitle: 'Learn more about us',
                icon: Icons.question_answer,
                backgroundColor: Color(0xffF2A6FF),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqsScreen()));
                },
              ),
              ListTileSettingWidget(
                title: 'Send Feedback',
                subTitle: 'Share If you have issue or thoughts',
                icon: Icons.mail_outline,
                backgroundColor: Color(0xffFFDF92),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SendFeedbackScreen()));
                },
              ),
              ListTileSettingWidgett(
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen()));
                },
              ),
              ListTileSettingWidgett(
                title: 'Terms of Use',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsOfUseScreen()));
                },
              ),
              Consumer<LogoutProvider>(
                builder: (context, logoutProvider, child) {
                  return GestureDetector(
                    onTap: logoutProvider.isLoading
                        ? null
                        : () async {
                            final success = await logoutProvider.logout();
                            if (success) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }
                          },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
