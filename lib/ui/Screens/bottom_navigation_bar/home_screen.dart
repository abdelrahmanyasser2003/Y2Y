import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/messages_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/notifications_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/profile_Screen.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/tab_Bar.dart';
import 'package:y2y/ui/widges/colors.dart';



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
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // تحديث الواجهة عند تغيير التبويب
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbottom = Provider.of<Project>(context);
    int unreadCount = barbottom.notifications.where((n) => !n.isRead).length;
    int unreadCountMessages =
        barbottom.messageslist.where((n) => !n.isNew).length;

    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Center(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const <Widget>[
            Homepagecontent(),
            Notificationspage(),
            Messagepage(),
            Profilepage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: skyblue,
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          tabs: <Widget>[
            Tab(
              icon: Image.asset(
                _tabController.index == 0
                    ? "assets/img/Home-Bottobar-active.png" // الصورة المفعلة
                    : "assets/img/Home-Bottobar.png", // الصورة العادية
              ),
            ),
            Tab(
              icon: Stack(
                children: [
                  Image.asset(
                    _tabController.index == 1
                        ? "assets/img/Notification-Bottombar-active.png"
                        : "assets/img/Notification-Bottombar.png",
                  ),
                  if (unreadCount > 0)
                    Positioned(
                      right: 2,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Tab(
              icon: Stack(
                children: [
                  Image.asset(
                    _tabController.index == 2
                        ? "assets/img/Messages-Bottombar-active.png"
                        : "assets/img/Messeges-Bottombar.png",
                  ),
                  if (unreadCountMessages > 0)
                    Positioned(
                      right: 2,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          unreadCountMessages.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Tab(
              icon: Image.asset(
                _tabController.index == 3
                    ? "assets/img/Messeges-Bottombar.png"
                    : "assets/img/User-Bottombar.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
