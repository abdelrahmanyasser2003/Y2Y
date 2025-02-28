import 'package:flutter/material.dart';
import 'package:y2y/ui/Widges/chip_widget.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/screens/profile_setup/communitys_Suggsestion_Screen.dart';

import 'package:y2y/ui/widges/colors.dart';



class Interestselection extends StatefulWidget {
  const Interestselection({super.key});

  @override
  State<Interestselection> createState() => _InterestselectionState();
}

class _InterestselectionState extends State<Interestselection> {
  bool isprogramming = false;
  bool isai = false;
  bool isdatascience = false;
  bool iswebdevelopment = false;
  bool iscybersecurity = false;
  bool isaccounting = false;
  bool ismarketing = false;
  bool isfinance = false;
  bool isuiuxDesign = false;
  bool isgraphicDesign = false;
  bool isanimation = false;
  bool isphotography = false;
  bool isvideoediting = false;
  bool isfootball = false;
  bool isswimminig = false;
  bool isyuga = false;
  bool ispainting = false;
  bool isplayinstruments = false;
  bool issinging = false;

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
              "What are you interested in?",
              style: TextStyle(
                  fontFamily: "Montserrat", color: white, fontSize: 20),
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
              "Select categories that match your skills and passions",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontFamily: "Lato",
                  color: white),
            ),
            SizedBox(
              height: 10,
            ),
            Column(children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 840,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Technology & Programming",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                            color: cornflowerblue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ChipWidgt(
                              value: isprogramming,
                              onSelected: (value) {
                                setState(() {
                                  isprogramming = value;
                                });
                              },
                              text: "Programming",
                              selected: isprogramming),
                          SizedBox(
                            width: 5,
                          ),
                          ChipWidgt(
                              value: isdatascience,
                              onSelected: (value) {
                                setState(() {
                                  isdatascience = value;
                                });
                              },
                              text: "Data Science",
                              selected: isdatascience),
                        ],
                      ),
                      Row(
                        children: [
                          ChipWidgt(
                              value: iswebdevelopment,
                              onSelected: (value) {
                                setState(() {
                                  iswebdevelopment = value;
                                });
                              },
                              text: "Web Development",
                              selected: iswebdevelopment),
                          SizedBox(
                            width: 10,
                          ),
                          ChipWidgt(
                              value: isai,
                              onSelected: (value) {
                                setState(() {
                                  isai = value;
                                });
                              },
                              text: "Ai",
                              selected: isai),
                        ],
                      ),
                      InputChip(
                        side: BorderSide(color: white),
                        avatar: Checkbox(
                          side: BorderSide(color: white),
                          fillColor: WidgetStatePropertyAll(cornflowerblue),
                          value: iscybersecurity,
                          onChanged: (value) {},
                        ),
                        onSelected: (value) {
                          setState(() {
                            iscybersecurity = value;
                          });
                        },
                        checkmarkColor: white,
                        selected: iscybersecurity,
                        label: Text(
                          "Cybersecurity",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        labelStyle: TextStyle(color: white),
                        color: WidgetStatePropertyAll(cornflowerblue),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Business & Economics",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w800,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isaccounting,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isaccounting = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isaccounting,
                                label: Text(
                                  "Accounting",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: ismarketing,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    ismarketing = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: ismarketing,
                                label: Text(
                                  "Marketing",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              )
                            ],
                          ),
                          Center(
                            child: InputChip(
                              side: BorderSide(color: white),
                              avatar: Checkbox(
                                side: BorderSide(color: white),
                                fillColor:
                                    WidgetStatePropertyAll(cornflowerblue),
                                value: isfinance,
                                onChanged: (value) {},
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isfinance = value;
                                });
                              },
                              checkmarkColor: white,
                              selected: isfinance,
                              label: Text(
                                "Finance",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              labelStyle: TextStyle(color: white),
                              color: WidgetStatePropertyAll(cornflowerblue),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Design & Creativity",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w800,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isuiuxDesign,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isuiuxDesign = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isuiuxDesign,
                                label: Text(
                                  "UI/UX Design",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isgraphicDesign,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isgraphicDesign = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isgraphicDesign,
                                label: Text(
                                  "Graphic Design",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  InputChip(
                                    side: BorderSide(color: white),
                                    avatar: Checkbox(
                                      side: BorderSide(color: white),
                                      fillColor: WidgetStatePropertyAll(
                                          cornflowerblue),
                                      value: isanimation,
                                      onChanged: (value) {},
                                    ),
                                    onSelected: (value) {
                                      setState(() {
                                        isanimation = value;
                                      });
                                    },
                                    checkmarkColor: white,
                                    selected: isanimation,
                                    label: Text(
                                      "Animation",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    labelStyle: TextStyle(color: white),
                                    color:
                                        WidgetStatePropertyAll(cornflowerblue),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  InputChip(
                                    side: BorderSide(color: white),
                                    avatar: Checkbox(
                                      side: BorderSide(color: white),
                                      fillColor: WidgetStatePropertyAll(
                                          cornflowerblue),
                                      value: isphotography,
                                      onChanged: (value) {},
                                    ),
                                    onSelected: (value) {
                                      setState(() {
                                        isphotography = value;
                                      });
                                    },
                                    checkmarkColor: white,
                                    selected: isphotography,
                                    label: Text(
                                      "Photography",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    labelStyle: TextStyle(color: white),
                                    color:
                                        WidgetStatePropertyAll(cornflowerblue),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: InputChip(
                              side: BorderSide(color: white),
                              avatar: Checkbox(
                                side: BorderSide(color: white),
                                fillColor:
                                    WidgetStatePropertyAll(cornflowerblue),
                                value: isvideoediting,
                                onChanged: (value) {},
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isvideoediting = value;
                                });
                              },
                              checkmarkColor: white,
                              selected: isvideoediting,
                              label: Text(
                                "Video Editing",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              labelStyle: TextStyle(color: white),
                              color: WidgetStatePropertyAll(cornflowerblue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sports & Fitness",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w800,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isfootball,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isfootball = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isfootball,
                                label: Text(
                                  "Football",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isswimminig,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isswimminig = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isswimminig,
                                label: Text(
                                  "Swimminig",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              )
                            ],
                          ),
                          Center(
                            child: InputChip(
                              side: BorderSide(color: white),
                              avatar: Checkbox(
                                side: BorderSide(color: white),
                                fillColor:
                                    WidgetStatePropertyAll(cornflowerblue),
                                value: isyuga,
                                onChanged: (value) {},
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isyuga = value;
                                });
                              },
                              checkmarkColor: white,
                              selected: isyuga,
                              label: Text(
                                "Yuga",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              labelStyle: TextStyle(color: white),
                              color: WidgetStatePropertyAll(cornflowerblue),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Art & Music",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w800,
                                color: cornflowerblue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: ispainting,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    ispainting = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: ispainting,
                                label: Text(
                                  "Painting",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              InputChip(
                                side: BorderSide(color: white),
                                avatar: Checkbox(
                                  side: BorderSide(color: white),
                                  fillColor:
                                      WidgetStatePropertyAll(cornflowerblue),
                                  value: isplayinstruments,
                                  onChanged: (value) {},
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isplayinstruments = value;
                                  });
                                },
                                checkmarkColor: white,
                                selected: isplayinstruments,
                                label: Text(
                                  "Play Instruments",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                labelStyle: TextStyle(color: white),
                                color: WidgetStatePropertyAll(cornflowerblue),
                              )
                            ],
                          ),
                          Center(
                            child: InputChip(
                              side: BorderSide(color: white),
                              avatar: Checkbox(
                                side: BorderSide(color: white),
                                fillColor:
                                    WidgetStatePropertyAll(cornflowerblue),
                                value: issinging,
                                onChanged: (value) {},
                              ),
                              onSelected: (value) {
                                setState(() {
                                  issinging = value;
                                });
                              },
                              checkmarkColor: white,
                              selected: issinging,
                              label: Text(
                                "Singing",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              labelStyle: TextStyle(color: white),
                              color: WidgetStatePropertyAll(cornflowerblue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 95,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: cornflowerblue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 210,
                    height: 50,
                    child: ElvatedButtonWidget(
                      text: "Save & Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Communitysuggsestion(),
                          ),
                        );
                      },
                      color: white,
                      backgroundColor: WidgetStatePropertyAll(green),
                    )),
              ]),
            ]),
          ],
        ),
      )),
    );
  }
}
