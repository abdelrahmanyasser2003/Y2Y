import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/provider/messages_provider.dart';
import 'package:y2y/provider/notfications_provider.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/messages_screen.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/notifications_screen.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/profile_screen.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/tab_bar.dart';

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
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbottom = Provider.of<NotficationsProvider>(context);
    final barbottomm = Provider.of<MessagesProvider>(context);
    int unreadCount = barbottom.notifications.where((n) => !n.isRead).length;
    int unreadCountMessages =
        barbottomm.messageslist.where((n) => !n.isNew).length;

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
        height: 60.h,
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
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
                    ? "assets/img/profile-Bottombar-active.png"
                    : "assets/img/User-Bottombar.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
