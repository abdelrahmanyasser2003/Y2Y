import 'package:flutter/material.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/screens/bottom_navigation_bar/home_Screen.dart';
import 'package:y2y/ui/widges/colors.dart';

class Communitysuggsestion extends StatefulWidget {
  const Communitysuggsestion({super.key});

  @override
  State<Communitysuggsestion> createState() => _CommunitysuggsestionState();
}

class _CommunitysuggsestionState extends State<Communitysuggsestion> {
  bool isjoined1 = false;
  bool isjoined2 = false;
  bool isjoined3 = false;
  bool isjoined4 = false;
  String buttontext1 = "Skip to now";

  void togglejoin(int buttonindex) {
    setState(() {
      if (buttonindex == 1) {
        isjoined1 = !isjoined1;
      } else if (buttonindex == 2) {
        isjoined2 = !isjoined2;
      } else if (buttonindex == 3) {
        isjoined3 = !isjoined3;
      } else if (buttonindex == 4) {
        isjoined4 = !isjoined4;
      }

      if (isjoined1 || isjoined2 || isjoined3 || isjoined4) {
        buttontext1 = "Go to Home Page";
      } else {
        buttontext1 = "Skip to now";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cornflowerblue,
        appBar: AppBar(
            backgroundColor: cornflowerblue,
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                "assets/img/White Logo Icon.png",
                width: 80,
                height: 80,
              ),
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suggested Communities",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: white,
                            fontSize: 23),
                      ),
                      Divider(
                        color: white,
                        thickness: 0.5,
                        endIndent: 25,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Based on your interests, here are some communities you can join",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontFamily: "Lato",
                            color: white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          width: 379,
                          height: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/img/ai.jpg"),
                                radius: 40,
                              ),
                              SizedBox(
                                width: 5,
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
                                    "Stay updated on tech trands and AI\n developments",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto"),
                                  ),
                                  Row(
                                    children: [
                                      Chip(
                                        side: BorderSide(color: white),
                                        // avatar:IconButton(onPressed:(){}, icon: Image.asset("assets/img/microchip-ai.png",color: white,)),
                                        padding: EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),

                                        label: Text(
                                          "Ai",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        labelStyle: TextStyle(color: white),
                                        color: WidgetStatePropertyAll(
                                            cornflowerblue),
                                      ),
                                      SizedBox(
                                        width: 90,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0),
                                              backgroundColor:
                                                  isjoined1 ? green : white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              side: BorderSide(color: green)),
                                          onPressed: () => togglejoin(1),
                                          child: Text(
                                            isjoined1 ? "joined" : "join",
                                            style: TextStyle(
                                                color:
                                                    isjoined1 ? white : green,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(children: [
                          Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            width: 379,
                            height: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/img/leader.jpg"),
                                  radius: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Student Leaders",
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
                                      "A community for leadership and\nacademic growth",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto"),
                                    ),
                                    Row(
                                      children: [
                                        Chip(
                                          side: BorderSide(color: white),
                                          padding: EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          label: Text(
                                            "Leadership",
                                            style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          labelStyle: TextStyle(color: white),
                                          color: WidgetStatePropertyAll(
                                              cornflowerblue),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(0),
                                                backgroundColor:
                                                    isjoined2 ? green : white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                side: BorderSide(color: green)),
                                            onPressed: () => togglejoin(2),
                                            child: Text(
                                              isjoined2 ? "joined" : "join",
                                              style: TextStyle(
                                                  color:
                                                      isjoined2 ? white : green,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                width: 379,
                                height: 130,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/img/design.jpg"),
                                      radius: 40,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Design Creatives",
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
                                          "Connect with fellow graphic and UI/UX\ndesigners",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: cornflowerblue,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Roboto"),
                                        ),
                                        Row(
                                          children: [
                                            Chip(
                                              side: BorderSide(color: white),
                                              padding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              label: Text(
                                                "UI/UX Design",
                                                style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              labelStyle:
                                                  TextStyle(color: white),
                                              color: WidgetStatePropertyAll(
                                                  cornflowerblue),
                                            ),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    backgroundColor: isjoined3
                                                        ? green
                                                        : white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                    side: BorderSide(
                                                        color: green)),
                                                onPressed: () => togglejoin(3),
                                                child: Text(
                                                  isjoined3 ? "joined" : "join",
                                                  style: TextStyle(
                                                      color: isjoined3
                                                          ? white
                                                          : green,
                                                      fontFamily: "Poppins",
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(10),
                                    width: 379,
                                    height: 130,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage("assets/img/prog.jpg"),
                                          radius: 40,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Programming Gurus",
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
                                              "A space for aspiring developers to\nshare knowledge",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: cornflowerblue,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto"),
                                            ),
                                            Row(
                                              children: [
                                                Chip(
                                                  padding: EdgeInsets.all(0),
                                                  side:
                                                      BorderSide(color: white),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  label: Text(
                                                    "Programming",
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                  labelStyle:
                                                      TextStyle(color: white),
                                                  color: WidgetStatePropertyAll(
                                                      cornflowerblue),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        backgroundColor:
                                                            isjoined4
                                                                ? green
                                                                : white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                        side: BorderSide(
                                                            color: green)),
                                                    onPressed: () =>
                                                        togglejoin(4),
                                                    child: Text(
                                                      isjoined4
                                                          ? "joined"
                                                          : "join",
                                                      style: TextStyle(
                                                          color: isjoined4
                                                              ? white
                                                              : green,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: ElvatedButtonWidget(
                                          text: buttontext1,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Homepage()));
                                            setState(() {
                                              if (isjoined1 ||
                                                  isjoined2 ||
                                                  isjoined3 ||
                                                  isjoined4) {
                                                buttontext1 = "Go to Home Page";
                                              }
                                            });
                                          },
                                          backgroundColor:
                                              WidgetStatePropertyAll(green),
                                          color: white)),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ])
                    ]))));
  }
}
