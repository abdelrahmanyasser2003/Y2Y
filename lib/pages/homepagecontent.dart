import 'package:flutter/material.dart';
import 'package:y2y/pages/bottomnavigationbar.dart';

class Homepagecontent extends StatefulWidget {
  const Homepagecontent({super.key});

  @override
  State<Homepagecontent> createState() => HomepagecontentState();
}

class HomepagecontentState extends State<Homepagecontent> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            bottomNavigationBar: Bottomnavigationbarr(),
        ),
      ),
    );
  }
}