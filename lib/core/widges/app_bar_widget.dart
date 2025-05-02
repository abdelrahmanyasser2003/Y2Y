import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Search/Screens/search_screen.dart';
import 'package:y2y/features/Settings/screens/settings_overview_screen.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
