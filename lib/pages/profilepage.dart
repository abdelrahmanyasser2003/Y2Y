import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

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
    );
  }
}