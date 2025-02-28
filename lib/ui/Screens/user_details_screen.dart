import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';
import 'package:y2y/ui/widges/colors.dart';

class Userdetils extends StatefulWidget {
  const Userdetils({super.key});

  @override
  State<Userdetils> createState() => _UserdetilsState();
}

class _UserdetilsState extends State<Userdetils> {
  @override
  Widget build(BuildContext context) {
    // final userdetilss = Provider.of<Project>(context).userdetils;
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget()),
        body:
            //: ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (context, index) {
            //     final uuserdetils = userdetilss[index];

            SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/img/pic1.jpg"),
                          // AssetImage("uuserdetils.imagepath"),
                          radius: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ahmed Saad",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                                color: cornflowerblue,
                              ),
                            ),
                            Text(
                              "krkj",
                              // "uuserdetils.userNameModel",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  color: cornflowerblue),
                            ),
                            Text(
                              "Community Owner /\nVolnteeer",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  color: cornflowerblue),
                            ),
                          ],
                        ),
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
                                backgroundColor: const WidgetStatePropertyAll(
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
                                  Image.asset("assets/img/icons_message.png"),
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
                    TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cornflowerblue,
                              )),
                          hintText: "uuserdetils.dateModel",
                          hintStyle: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cornflowerblue,
                          )),
                    ),
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
                    TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cornflowerblue,
                              )),
                          hintText: "MIS, AI Developer and Researcher",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w600,
                            color: cornflowerblue,
                          )),
                    ),
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
                    TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cornflowerblue,
                              )),
                          hintText: "Data Science, Programming, AI",
                          hintStyle: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cornflowerblue,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 290,
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
                              TextField(
                                maxLines: 7,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: white)),
                                    hintText:
                                        "Hello! I'm Ahmed Saad, an AI developer and researcher with a strong passion for data science and programming. As a volunteer, I love to share my knowledge and skills in AI. Born in 1998, I'm always excited to push the boundaries of technology and innovation. Let's connect and explore the world of AI together!",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w500,
                                      color: cornflowerblue,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ])),
        ));
  }
}
