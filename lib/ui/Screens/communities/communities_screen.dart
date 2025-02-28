import 'package:flutter/material.dart';
import 'package:y2y/ui/screens/communities/communitys_Details_Screen.dart';
import 'package:y2y/ui/widges/colors.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  bool isjoined3 = false;
  bool isjoined2 = false;

  void togglejoin(int buttonindex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cornflowerblue,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                width: 379,
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/ai.jpg"),
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
                                  borderRadius: BorderRadius.circular(50)),

                              label: Text(
                                "Ai",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              labelStyle: TextStyle(color: white),
                              color: WidgetStatePropertyAll(cornflowerblue),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            TextButton(
                                onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     Communitysdeitals()));
                                },
                                child: Text(
                                  "Show Community >",
                                  style: TextStyle(
                                      color: cornflowerblue, fontSize: 12),
                                ))
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
                      color: white, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  width: 379,
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/img/prog.jpg"),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                side: BorderSide(color: white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                label: Text(
                                  "Programming",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Show Community >",
                                    style: TextStyle(
                                        color: cornflowerblue, fontSize: 12),
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
                Divider(
                  color: white,
                  thickness: 0.5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Explore More Communities",
                  style: TextStyle(
                      fontFamily: "Montserrat", color: white, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    width: 379,
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/img/design.jpg"),
                          radius: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      borderRadius: BorderRadius.circular(20)),
                                  label: Text(
                                    "UI/UX Design",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9
                                    ),
                                  ),
                                  
                                  labelStyle: TextStyle(color: white),
                                  color: WidgetStatePropertyAll(cornflowerblue),
                                ),
                                SizedBox(
                                  width: 55,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(0),
                                        backgroundColor:
                                            isjoined3 ? green : white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        side: BorderSide(color: green)),
                                    onPressed: () => togglejoin(3),
                                    child: Text(
                                      isjoined3 ? "joined" : "join",
                                      style: TextStyle(
                                          color: isjoined3 ? white : green,
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
                                        fontSize: 9
                                      ),
                                    ),
                                    labelStyle: TextStyle(color: white),
                                    color:
                                        WidgetStatePropertyAll(cornflowerblue),
                                  ),
                                  SizedBox(
                                    width: 65,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                          backgroundColor:
                                              isjoined2 ? green : white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          side: BorderSide(color: green)),
                                      onPressed: () => togglejoin(2),
                                      child: Text(
                                        isjoined2 ? "joined" : "join",
                                        style: TextStyle(
                                            color: isjoined2 ? white : green,
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
                  ]),
                ]),
              ])
            ])
          ]),
        )));
      
  }
}
