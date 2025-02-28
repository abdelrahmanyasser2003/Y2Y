import 'package:flutter/material.dart';
import 'package:y2y/ui/screens/communities/communities_Screen.dart';
import 'package:y2y/ui/screens/opportunities/opportunities_Screen.dart';
import 'package:y2y/ui/widges/colors.dart';

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
              onPressed: () {},
              icon: Image.asset("assets/img/Search-Appbar.png")),
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/img/Setting-Appbar.png"))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: purple,
          unselectedLabelColor: white,
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: purple,
              ),
              insets: EdgeInsets.symmetric(horizontal: 0)),
          labelStyle: const TextStyle(fontSize: 18, fontFamily: "Montserrat"),
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
      body: TabBarView(
          controller: _tabController,
          children: const [Communities(), Opportunities()]),
    );
  }
}
