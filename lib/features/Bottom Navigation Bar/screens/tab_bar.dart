import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Communities/Screens/communities_screen.dart';
import 'package:y2y/features/Communities/provider/community_provider.dart';

import 'package:y2y/features/Opportunities/Screens/opportunities_screen.dart';
import 'package:y2y/features/Search/Screens/search_screen.dart';
import 'package:y2y/features/Settings/screens/settings_overview_screen.dart';

class Homepagecontent extends StatefulWidget {
  const Homepagecontent({super.key});

  @override
  State<Homepagecontent> createState() => HomepagecontentState();
}

class HomepagecontentState extends State<Homepagecontent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handletabselection);
    super.initState();
    // Start listening to changes.
  }

  _handletabselection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: AppBar(
        backgroundColor: cornflowerblue,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/img/White Logo Icon.png"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Image.asset("assets/img/Search-Appbar.png")),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              icon: Image.asset("assets/img/Setting-Appbar.png"))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: purple,
          unselectedLabelColor: white,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.w,
                color: purple,
              ),
              insets: EdgeInsets.symmetric(horizontal: 0)),
          labelStyle: TextStyle(
            fontSize: 15.sp,
            fontFamily: "Montserrat",
          ),
          tabs: [
            Tab(
              text: "Communities",
            ),
            Tab(
              text: "Opportunities",
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Communities(
          communityy: Provider.of<CommunityProvider>(context).joinedCommunities,
        ),
        Opportunities()
      ]),
    );
  }
}
