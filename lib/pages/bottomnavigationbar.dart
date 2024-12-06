import 'package:flutter/material.dart';
import 'package:y2y/pages/homepage.dart';
import 'package:y2y/pages/messagepage.dart';
import 'package:y2y/pages/notificationspage.dart';
import 'package:y2y/pages/profilepage.dart';
import 'package:y2y/sherd/colors.dart';

class Bottomnavigationbarr extends StatefulWidget {
  const Bottomnavigationbarr({super.key});
  @override
  State<Bottomnavigationbarr> createState() => _BottomNavigationBarrState();
}
class _BottomNavigationBarrState extends State<Bottomnavigationbarr> {
  final PageController _pageController = PageController();
int myindex = 0;
@override
void dispose() {
  _pageController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: purple,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              myindex = index;
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
      body: PageView(
        onPageChanged: (index) {},
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children:  const [
          Homepage(),
          Notificationspage(),
          Messagepage(),
          Profilepage()
        ],
      ),
    );
  }
}
