import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/become_volunteer.dart';
import 'package:y2y/features/user/provider/edit_profile_provider.dart';
import 'package:y2y/features/user/provider/get_user_provider.dart';
import 'package:y2y/features/user/screens/edit_profile_screen.dart';
import 'package:y2y/features/user/widges/elvated_button__profile_widget.dart';
import 'package:y2y/features/user/widges/profile_container_widget.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
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
    final signupdetails = Provider.of<EditProfileProvider>(context);
    final userProvider = Provider.of<GetUserProvider>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator()) // عرض مؤشر تحميل
          : userProvider.errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                      "فشل في تحميل البيانات: ${userProvider.errorMessage}"))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // إذا كانت الصورة من رابط URL
                            CircleAvatar(
                              backgroundImage: userProvider
                                              .user?.profileImage !=
                                          null &&
                                      userProvider
                                          .user!.profileImage!.isNotEmpty
                                  ? NetworkImage(
                                      '${ApiEndpoints.baseUrl}${userProvider.user!.profileImage!}')
                                  : const AssetImage('assets/img/pic1.jpg')
                                      as ImageProvider,
                              radius: 50,
                            ),
                            Widthspace(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${userProvider.user?.firstName ?? ''} ${userProvider.user?.lastName ?? ''}',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  userProvider.user?.userName ?? '',
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
                                              bio: signupdetails.bio,
                                              city: userProvider
                                                      .user?.address?.city ??
                                                  "",
                                              dateOfBirth:
                                                  signupdetails.dateOfBirth,
                                              education: userProvider
                                                      .user?.education ??
                                                  '',
                                              gender:
                                                  userProvider.user?.gender ??
                                                      '',
                                              name:
                                                  '${userProvider.user?.firstName ?? ''} ${userProvider.user?.lastName ?? ''}',
                                              skill: userProvider
                                                      .user?.skills?.first ??
                                                  "",
                                              state: userProvider
                                                      .user?.address?.state ??
                                                  "",
                                              street: userProvider
                                                      .user?.address?.street ??
                                                  "",
                                              subname:
                                                  userProvider.user?.userName ??
                                                      '',
                                              imgpath: userProvider
                                                      .user?.profileImage ??
                                                  '',
                                              phone: userProvider.user?.phone ??
                                                  '',
                                            )));
                                // هنا يمكنك فتح شاشة تعديل البيانات
                              },
                              text: 'Edit Profile',
                              color: white,
                              width: 146.w,
                              icon: Icons.edit,
                            ),
                            Widthspace(width: 5),
                            ElvatedButtonPrfileWidget(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BecomeVolunteer()));
                              },
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
                                    signupdetails.bio,
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
                                Text("Gender",
                                    style: AppStyles().monwhite16w600style),
                                hieghtspace(hieght: 5),
                                ProfileContainerWidget(
                                    text: userProvider.user?.gender ?? ""),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date of Birth",
                                    style: AppStyles().monwhite16w600style),
                                ProfileContainerWidget(
                                  width: 155.w,
                                  text: signupdetails.dateOfBirth,
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
                                text: userProvider.user?.address!.state ?? '',
                                width: 105.w),
                            ProfileContainerWidget(
                                text: userProvider.user?.address!.city ?? '',
                                width: 105.w),
                            ProfileContainerWidget(
                                text: userProvider.user?.address!.street ?? '',
                                width: 105.w),
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Text("Education/ Occupation",
                            style: AppStyles().monwhite16w600style),
                        hieghtspace(hieght: 10),
                        ProfileContainerWidget(
                          text: userProvider.user?.education ?? '',
                          width: double.infinity,
                        ),
                        hieghtspace(hieght: 10),
                        Text("Skill/ Expertise",
                            style: AppStyles().monwhite16w600style),
                        hieghtspace(hieght: 10),
                        ProfileContainerWidget(
                          text: (userProvider.user?.skills != null &&
                                  userProvider.user!.skills!.isNotEmpty)
                              ? userProvider.user!.skills!.first
                              : 'No skill found',
                          width: double.infinity,
                        ),
                        hieghtspace(hieght: 10),
                        Text("Phone Number",
                            style: AppStyles().monwhite16w600style),
                        hieghtspace(hieght: 10),
                        ProfileContainerWidget(
                          text: userProvider.user?.phone ?? '',
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
