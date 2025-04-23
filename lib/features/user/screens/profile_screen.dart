import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/user/provider/edit_profile_provider.dart';
import 'package:y2y/features/user/provider/profile_provider.dart';
import 'package:y2y/features/user/repo/user_repo2.dart';
import 'package:y2y/features/user/widges/elvated_button__profile_widget.dart';
import 'package:y2y/features/user/widges/profile_container_widget.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late Future<UserDetailsModel> _userDetailsFuture;

  @override
  void initState() {
    super.initState();
    // تهيئة المتغير _userDetailsFuture في initState
    _userDetailsFuture = UserDetailsRepo().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final signupdetails = Provider.of<EditProfileProvider>(context);
    final user = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: FutureBuilder(
        future: _userDetailsFuture, // انتظار البيانات من الـ API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // عرض مؤشر تحميل أثناء انتظار البيانات
          } else if (snapshot.hasError) {
            return Center(
                child: Text("فشل في تحميل البيانات: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final userDetails = snapshot.data!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // إذا كانت الصورة من رابط URL
                        CircleAvatar(
                          backgroundImage: userDetails.imagepath.isNotEmpty
                              ? NetworkImage(userDetails.imagepath)
                              : const AssetImage(
                                      'assets/images/default_profile.png')
                                  as ImageProvider,
                          radius: 50,
                        ),

                        Widthspace(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16.sp,
                                color: green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userDetails.userNameModel,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => EditProfileScreen(
                            //       education: userDetails.educationModel,
                            //       skill: userDetails.skillModel,
                            //       bio: userDetails.bioModel,
                            //       dateOfBirth: userDetails.dateModel,
                            //       imgpath: userDetails.imagepath,
                            //       subname: userDetails.userNameModel,
                            //       name: signupdetails.name,
                            //       email: signupdetails.email,
                            //       phone: signupdetails.phone,
                            //       gender: signupdetails.gender,
                            //       street: signupdetails.street,
                            //       state: signupdetails.state,
                            //       city: signupdetails.city,
                            //     ),
                            //   ),
                            // );
                          },
                          text: 'Edit Profile',
                          color: white,
                          width: 146.w,
                          icon: Icons.edit,
                        ),
                        Widthspace(width: 5),
                        ElvatedButtonPrfileWidget(
                          onPressed: () {},
                          text: 'Become Volunteer',
                          fontSize: 13.sp,
                          width: 189.w,
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
                                color: cornflowerblue,
                              ),
                            ),
                            Divider(
                              color: cornflowerblue,
                              thickness: 0.5,
                            ),
                            Expanded(
                              child: Text(
                                userDetails.bioModel,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: AppStyles().monwhite16w600style),
                            hieghtspace(hieght: 5),
                            ProfileContainerWidget(text: signupdetails.email),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone Number",
                                style: AppStyles().monwhite16w600style),
                            hieghtspace(hieght: 5),
                            ProfileContainerWidget(
                              text: signupdetails.phone,
                              width: 155.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                    hieghtspace(hieght: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gender",
                                style: AppStyles().monwhite16w600style),
                            hieghtspace(hieght: 5),
                            ProfileContainerWidget(text: signupdetails.gender),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date of Birth",
                                style: AppStyles().monwhite16w600style),
                            ProfileContainerWidget(
                              width: 155.w,
                              text: userDetails.dateModel,
                            ),
                          ],
                        ),
                      ],
                    ),
                    hieghtspace(hieght: 10),
                    Text("Address", style: AppStyles().monwhite16w600style),
                    hieghtspace(hieght: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileContainerWidget(
                            text: signupdetails.state, width: 105.w),
                        ProfileContainerWidget(
                            text: signupdetails.city, width: 105.w),
                        ProfileContainerWidget(
                            text: signupdetails.street, width: 105.w),
                      ],
                    ),
                    hieghtspace(hieght: 10),
                    Text("Education/ Occupation",
                        style: AppStyles().monwhite16w600style),
                    hieghtspace(hieght: 10),
                    ProfileContainerWidget(
                      text: userDetails.educationModel,
                      width: double.infinity,
                    ),
                    hieghtspace(hieght: 10),
                    Text("Skill/ Expertise",
                        style: AppStyles().monwhite16w600style),
                    hieghtspace(hieght: 10),
                    ProfileContainerWidget(
                      text: userDetails.skillModel,
                      width: double.infinity,
                    ),
                    hieghtspace(hieght: 10),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
