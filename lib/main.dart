import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/features/Authentication/Screens/log_in_screen.dart';
import 'package:y2y/features/Authentication/provider/verify_email_provider.dart';
import 'package:y2y/features/Become%20a%20Volunteer/provider/become_volunteer_provider.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/provider/messages_provider.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/provider/notfications_provider.dart';
import 'package:y2y/features/Communities/provider/community_provider.dart';
import 'package:y2y/features/Communities/provider/create_community_provider.dart';
import 'package:y2y/features/Communities/provider/delete_community_provider.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_of_specific_user_provider.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_of_specific_voulnteer_provider.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_provider.dart';
import 'package:y2y/features/Communities/provider/handle_join_request_provider.dart';
import 'package:y2y/features/Communities/provider/join_community_provider.dart';
import 'package:y2y/features/Communities/provider/leave_community_provider.dart';
import 'package:y2y/features/Communities/provider/update_community_provider.dart';
import 'package:y2y/features/Opportunities/provider/delete_opportunity_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_opportunities_of_user_provider.dart';
import 'package:y2y/features/Opportunities/provider/make_react_provider.dart';
import 'package:y2y/features/Opportunities/provider/new_opportunity_provider.dart';
import 'package:y2y/features/Opportunities/provider/update_opportunity_provider.dart';
import 'package:y2y/features/Search/provider/get_all_categoris_provider.dart';
import 'package:y2y/features/Search/provider/get_all_communities_of_specific_subcategory_provider.dart';
import 'package:y2y/features/Search/provider/get_all_subcategories_provider.dart';
import 'package:y2y/features/Search/provider/search_provider.dart';
import 'package:y2y/features/Settings/provider/logput_provider.dart';
import 'package:y2y/features/user/provider/edit_profile_provider.dart';
import 'package:y2y/features/user/provider/get_user_provider.dart';
import 'package:y2y/features/user/provider/profile_provider.dart';
import 'package:y2y/features/user/provider/update_user_provider.dart';
import 'package:y2y/features/user/provider/user_chat_provider.dart';
import 'package:y2y/features/user/provider/user_details_provider.dart';
import 'package:y2y/features/user/repo/update_user_repo.dart';

void main() {
  DioHelper.initDio();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => CreateOpportunityProvider()),
    ChangeNotifierProvider(create: (ctx) => NotficationsProvider()),
    ChangeNotifierProvider(create: (ctx) => MessagesProvider()),
    ChangeNotifierProvider(create: (ctx) => UserDetailsProvider()),
    ChangeNotifierProvider(create: (ctx) => VerifyEmailProvider()),
    ChangeNotifierProvider(create: (ctx) => CommunityProvider()),
    ChangeNotifierProvider(create: (ctx) => UserChatProvider()),
    ChangeNotifierProvider(create: (ctx) => ProfileProvider()),
    ChangeNotifierProvider(create: (ctx) => EditProfileProvider()),
    ChangeNotifierProvider(create: (ctx) => SearchProvider()),
    ChangeNotifierProvider(create: (ctx) => GetAllCategoriesProvider()),
    ChangeNotifierProvider(create: (ctx) => GetAllSubcategoriesProvider()),
    ChangeNotifierProvider(create: (ctx) => GetAllOpportunitiesProvider()),
    ChangeNotifierProvider(create: (ctx) => GetAllReactsProvider()),
    ChangeNotifierProvider(create: (ctx) => MakeReactProvider()),
    ChangeNotifierProvider(create: (ctx) => CommunitiesProvider()),
    ChangeNotifierProvider(create: (ctx) => JoinCommunityProvider()),
    ChangeNotifierProvider(
        create: (ctx) => GetAllCommunitiesOfSpecificSubcategoryProvider()),
    ChangeNotifierProvider(create: (ctx) => GetUserProvider()),
    ChangeNotifierProvider(create: (ctx) => EditProfileProvider()),
    ChangeNotifierProvider(
        create: (ctx) => UpdateUserProvider(UpdateUserRepo())),
    ChangeNotifierProvider(create: (ctx) => LogoutProvider()),
    ChangeNotifierProvider(create: (ctx) => BecomeVolunteerProvider()),
    ChangeNotifierProvider(create: (ctx) => OpportunityDeleteProvider()),
    ChangeNotifierProvider(create: (ctx) => GetOpportunitiesOfUserProvider()),
    ChangeNotifierProvider(create: (ctx) => HandleJoinRequestProvider()),
    ChangeNotifierProvider(create: (ctx) => LeaveCommunityProvider()),
    ChangeNotifierProvider(create: (ctx) => CreateCommunityProvider()),
    ChangeNotifierProvider(create: (ctx) => DeleteCommunityProvider()),
    ChangeNotifierProvider(create: (ctx) => UpdateCommunityProvider()),
    ChangeNotifierProvider(
        create: (ctx) => GetAllCommunitiesOfSpecificUserProvider()),
    ChangeNotifierProvider(
        create: (ctx) => GetAllCommunitiesOfSpecificVoulnteerProvider()),
    ChangeNotifierProvider(create: (ctx) => UpdateOpportunityProvider()),
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
          home: LoginPage(),
        );
      },
    );
  }
}
