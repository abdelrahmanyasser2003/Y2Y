import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
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
    
  int myindex = 0;
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
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: purple,
            unselectedItemColor: Colors.black,
            onTap: (value) {
              setState(() {
                myindex = value;
              });
            },
            currentIndex: myindex,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: skyblue,
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                      )),
                  label: ""),
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message,
                        size: 30,
                      )),
                  label: ""),
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        size: 30,
                      )),
                  label: ""),
            ]),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child:   TabBar(
                controller: _tabController,
                labelColor: purple,
                unselectedLabelColor: white,
                indicator:  const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: purple,),
                    insets: EdgeInsets.symmetric(horizontal: 0)),
                labelStyle:  const TextStyle(fontSize: 18),
                tabs: const [
                  Tab(
                    text: "Communities",
                  ),
                  Tab(
                    text: "Opportunities",
                  ),
                ],
              ),
            )
                )
                );
  }
}
