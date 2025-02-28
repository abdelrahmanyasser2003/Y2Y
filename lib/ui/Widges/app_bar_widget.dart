import 'package:flutter/material.dart';
import 'package:y2y/ui/widges/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
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
        );
  }
}