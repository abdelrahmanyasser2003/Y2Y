import 'package:flutter/material.dart';
import 'package:y2y/ui/screens/user_Details_Screen.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';

import 'package:y2y/ui/widges/colors.dart';


class Communitysdeitals extends StatefulWidget {
  const Communitysdeitals({super.key});

  @override
  State<Communitysdeitals> createState() => _CommunitysdeitalsState();
}

class _CommunitysdeitalsState extends State<Communitysdeitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
          appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarWidget()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/img/ai.jpg"),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tech Innovators",
                          style: TextStyle(
                              fontSize: 18,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Stay updated on tech trands and AI\ndevelopments",
                          style: TextStyle(
                              fontSize: 11,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                      ]),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: cornflowerblue,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Category :",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    side: BorderSide(color: white),
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    label: Text(
                      "Tech",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                    color: WidgetStatePropertyAll(cornflowerblue),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sub Category :",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    side: BorderSide(color: white),
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    label: Text(
                      "AI",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                    color: WidgetStatePropertyAll(cornflowerblue),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Members:",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "1,293",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Text(
                    "Location :",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 48,
                  ),
                  Text(
                    "Alexandria",
                    style: TextStyle(
                        fontSize: 11,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: purple,
                thickness: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Volunteer (Admin) :",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            "Ahmed Saad",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Start Date :",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          SizedBox(
                            width: 122,
                          ),
                          Text(
                            "End Date :",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sun 03/08/2025",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto"),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Text(
                            "Tue 14/08/2025",
                            style: TextStyle(
                                fontSize: 14,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: purple,
                thickness: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meeting Schedule :",
                    style: TextStyle(
                        fontSize: 14,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "Monday at 3:30 pm",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        "Location:",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Star Workspace",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Wednesday at 5:00 pm",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Location:",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "CAFE CLUB",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Saturday at 8:00 pm",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Location:",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "City Walk",
                        style: TextStyle(
                            fontSize: 12,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: purple,
                thickness: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Community Roles :",
                style: TextStyle(
                    fontSize: 14,
                    color: cornflowerblue,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "1.  Respectful Communication: Always communicate with\n     kindness and respect.\n2.  Privacy and Confidentiality: Respect the privacy of other\n     members\n3.  Positive Environment: Contribute to a positive and\n     supportive community atmosphere.\n4.  Constructive Feedback: Provide feedback in a\n     constructive and helpful manner.",
                style: TextStyle(
                    fontSize: 11,
                    color: cornflowerblue,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto"),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: purple,
                thickness: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Members :",
                    style: TextStyle(
                        fontSize: 24,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all >",
                      style: TextStyle(
                          fontSize: 13,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Userdetils()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/img/pic1.jpg"),
                    radius: 40,
                  ),
                  title: Text(
                    "Ahmed Saad",
                    style: TextStyle(
                        fontSize: 13,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  subtitle: Text(
                    "Volunteer (Admin)",
                    style: TextStyle(
                        fontSize: 13,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/pic2.jpg"),
                  radius: 40,
                ),
                title: Text(
                  "Fady Adel",
                  style: TextStyle(
                      fontSize: 13,
                      color: cornflowerblue,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/pic3.jpg"),
                  radius: 40,
                ),
                title: Text(
                  "Salma Hany",
                  style: TextStyle(
                      fontSize: 13,
                      color: cornflowerblue,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Userdetils()));
                },
              ),
            ]),
          ),
        ));
  }
}
