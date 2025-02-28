import 'package:flutter/material.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';
import 'package:y2y/ui/widges/colors.dart';



class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarWidget()),
    );
  }
}
