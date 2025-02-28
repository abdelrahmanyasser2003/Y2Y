import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/screens/opportunities/new_Opportunitie_Screen.dart';
import 'package:y2y/ui/screens/opportunities/opportunities_Details_Screen.dart';
import 'package:y2y/ui/widges/colors.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  State<Opportunities> createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  List<bool> trustStates = [];

  @override
  void textbutton(int length) {
    if (trustStates.length != length) {
      trustStates = List.generate(length, (index) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final opportunities = Provider.of<Project>(context).opportunities;
    textbutton(opportunities.length);

    return Scaffold(
      backgroundColor: cornflowerblue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Newopportunitie(),
              ));
        },
        backgroundColor: purple,
        child: Icon(
          Icons.post_add,
          color: white,
        ),
      ),
      body: ListView.builder(
          itemCount: opportunities.length,
          itemBuilder: (context, index) {
            final opportunity = opportunities[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Opportunitiesdetils(
                              opportunity: opportunity,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: double.infinity,
                height: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: MemoryImage(opportunity.imagepath),
                          radius: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              opportunity.opportunitytitledetils,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: cornflowerblue,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 230,
                              child: Text(
                                opportunity.descriptionmodeldetils,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Chip(
                      side: BorderSide(color: white),
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      label: Text(
                        opportunity.caregory,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      labelStyle: TextStyle(color: white),
                      color: WidgetStatePropertyAll(cornflowerblue),
                    ),
                    Divider(
                      thickness: 1,
                      color: purple,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          icon: Icon(
                            Icons.verified,
                            color: trustStates[index] ? green : cornflowerblue,
                          ),
                          iconAlignment: IconAlignment.end,
                          onPressed: () {
                            setState(() {
                              trustStates[index] = !trustStates[index];
                            });
                          },
                          label: Text(
                            trustStates[index] ? "Trusted" : "Trust",
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    trustStates[index] ? green : cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                              fontSize: 16,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
