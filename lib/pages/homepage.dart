import 'package:flutter/material.dart';
import 'package:y2y/pages/Communities.dart';
import 'package:y2y/pages/opportunities.dart';
import 'package:y2y/sherd/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
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
              icon: const Icon(
                Icons.search,
                color: white,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: white,
                size: 30,
              ))
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
          labelStyle: const TextStyle(fontSize: 18),
          tabs: const [
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
