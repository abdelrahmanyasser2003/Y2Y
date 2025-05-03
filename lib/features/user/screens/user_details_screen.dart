import 'package:flutter/material.dart';

import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Communities/model/get_all_communities_voulnteer_model.dart';
import 'package:y2y/features/user/widges/user_details_container_widget.dart';

class Userdetils extends StatefulWidget {
  const Userdetils({super.key, required this.request});
  final AskToJoin request;

  @override
  State<Userdetils> createState() => _UserdetilsState();
}

class _UserdetilsState extends State<Userdetils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget()),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('uuserdetils.imagepath'),
                                radius: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.request.firstName} ${widget.request.lastName}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                      color: cornflowerblue,
                                    ),
                                  ),
                                  Text(
                                    'uuserdetils.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        color: cornflowerblue),
                                  ),
                                ],
                              ),
                              Widthspace(width: 70),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_forward_outlined,
                                    color: cornflowerblue),
                              )
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
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 250,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              cornflowerblue),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7))),
                                    ),
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Send Message",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: white,
                                                fontFamily: "Poppins"),
                                          ),
                                        ),
                                        Image.asset(
                                            "assets/img/icons_message.png"),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 45,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: cornflowerblue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: PopupMenuButton<String>(
                                  color: white,
                                  onSelected: (value) {
                                    if (value == "edit") {
                                      print("تم اختيار التعديل");
                                    } else if (value == "delete") {
                                      print("تم اختيار الحذف");
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      value: "mute",
                                      child: Text(
                                        "Mute",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "delete",
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "Report",
                                      child: Text(
                                        "Report",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "Block",
                                      child: Text(
                                        "Block",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                  ],
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 45,
                          ),
                          Text(
                            "Date of Birth",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          UserDetailsContainerWidget(
                              text: 'uuserdetils.dateModel'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Education/ Occupation",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          UserDetailsContainerWidget(text: 'widget.request'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Skill/ Expertise",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          UserDetailsContainerWidget(
                              text: 'uuserdetils.skillModel'),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: 325,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: cornflowerblue),
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About me",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                          color: cornflowerblue),
                                    ),
                                    Divider(
                                      color: cornflowerblue,
                                      thickness: 0.5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'uuserdetils.bioModel',
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Lato",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ])),
              );
            }));
  }
}
