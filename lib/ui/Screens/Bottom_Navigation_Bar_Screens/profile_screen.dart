import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/core/spaceing_widges.dart';
import 'package:y2y/provider/edit_profile_provider.dart';

import 'package:y2y/ui/Screens/Profile_Setup_Screens/edit_profile_screen.dart';
import 'package:y2y/ui/Widges/elvated_button__profile_widget.dart';
import 'package:y2y/ui/Widges/profile_container_widget.dart';

import 'package:y2y/ui/widges/app_Bar_Widget.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  
  @override
  Widget build(BuildContext context) {
    final signupdetails = Provider.of<EditProfileProvider>(context);
    final userDetailsProvider = Provider.of<EditProfileProvider>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: MemoryImage(
                      userDetailsProvider.imgpath,
                    ),
                    radius: 50,
                  ),
                  Widthspace(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        signupdetails.name,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16.sp,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userDetailsProvider.subname,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.sp,
                          color: white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                children: [
                  ElvatedButtonPrfileWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            // Pass current profile data to EditProfileScreen
                            education: userDetailsProvider.education,
                            skill: userDetailsProvider.skill,
                            bio: userDetailsProvider.bio,
                            dateOfBirth: userDetailsProvider.dateOfBirth,
                            imgpath: userDetailsProvider.imgpath,
                            subname: userDetailsProvider.subname,

                            name: signupdetails.name,
                            email: signupdetails.email,
                            phone: signupdetails.phone,
                            gender: signupdetails.gender,
                            street: signupdetails.street,
                            state: signupdetails.state,
                            city: signupdetails.city,
                          ),
                        ),
                      );
                    },
                    text: 'Edit Profile',
                    color: white,
                    width: 146,
                    icon: Icons.edit,
                  ),
                  Widthspace(width: 5),
                  ElvatedButtonPrfileWidget(
                    onPressed: () {},
                    text: 'Become Volunteer',
                    fontSize: 13,
                    width: 189,
                    icon: Icons.person,
                    colorIcon: purple,
                  ),
                ],
              ),
              hieghtspace(hieght: 20),
              Divider(
                color: button,
                thickness: 1,
              ),
              Container(
                height: 142.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About me",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: cornflowerblue),
                      ),
                      Divider(
                        color: cornflowerblue,
                        thickness: 0.5,
                      ),
                      Expanded(
                        child: Text(
                          userDetailsProvider.bio,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: cornflowerblue,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Outfit",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              hieghtspace(hieght: 10),
              Row(
                children: [
                  Text("Email", style: AppStyles().monwhite16w600style),
                  Widthspace(width: 140),
                  Text("Phone Number", style: AppStyles().monwhite16w600style),
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileContainerWidget(text: signupdetails.email),
                  ProfileContainerWidget(
                    text: signupdetails.phone,
                    width: 155,
                  )
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                children: [
                  Text("Gender", style: AppStyles().monwhite16w600style),
                  Widthspace(width: 125),
                  Text("Date of Birth", style: AppStyles().monwhite16w600style),
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileContainerWidget(text: signupdetails.gender),
                  Widthspace(width: 10),
                  ProfileContainerWidget(
                    width: 155.w,
                    text: userDetailsProvider.dateOfBirth,
                  )
                ],
              ),
              hieghtspace(hieght: 10),
              Text("Address", style: AppStyles().monwhite16w600style),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileContainerWidget(text: signupdetails.state, width: 105),
                  ProfileContainerWidget(text: signupdetails.city, width: 105),
                  ProfileContainerWidget(text: signupdetails.street, width: 105)
                ],
              ),
              hieghtspace(hieght: 10),
              Text("Education/ Occupation",
                  style: AppStyles().monwhite16w600style),
              hieghtspace(hieght: 10),
              ProfileContainerWidget(
                text: userDetailsProvider.education,
                width: double.infinity,
              ),
              hieghtspace(hieght: 10),
              Text("Skill/ Expertise", style: AppStyles().monwhite16w600style),
              hieghtspace(hieght: 10),
              ProfileContainerWidget(
                text: userDetailsProvider.skill,
                width: double.infinity,
              ),
              hieghtspace(hieght: 10),
            ],
          ),
        ),
      ),
    );
  }
}
