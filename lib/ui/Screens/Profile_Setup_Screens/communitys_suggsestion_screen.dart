import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/provider/community_provider.dart';
import 'package:y2y/ui/Screens/Bottom_Navigation_Bar_Screens/home_screen.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';



class Communitysuggsestion extends StatefulWidget {
  const Communitysuggsestion({super.key});

  @override
  State<Communitysuggsestion> createState() => _CommunitysuggsestionState();
}

class _CommunitysuggsestionState extends State<Communitysuggsestion> {
  List<bool> isJoinedList = [];
  String buttontext = "Skip to now";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final communityProvider =
          Provider.of<CommunityProvider>(context, listen: false);

      if (communityProvider.availableCommunities.isNotEmpty) {
        setState(() {
          isJoinedList = List.generate(
              communityProvider.availableCommunities.length, (index) => false);
        });
      }
    });
  }

  void toggleJoin(int index) {
    final communityProvider =
        Provider.of<CommunityProvider>(context, listen: false);
    final community = communityProvider.availableCommunities[index];

    setState(() {
      isJoinedList[index] = !isJoinedList[index];

      if (isJoinedList[index]) {
        communityProvider.joinCommunity(community);
      } else {
        communityProvider.leaveCommunity(community);
      }

      if (isJoinedList.contains(true)) {
        buttontext = "Go to My Communities";
      } else {
        buttontext = "Skip to now";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final communitiy =
        Provider.of<CommunityProvider>(context).availableCommunities;

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Suggested Communities",
              style: TextStyle(
                  fontFamily: "Montserrat", color: white, fontSize: 23),
            ),
            const Divider(
              color: white,
              thickness: 0.5,
              endIndent: 25,
            ),
            const SizedBox(height: 5),
            const Text(
              "Based on your interests, here are some communities you can join",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontFamily: "Lato",
                  color: white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: communitiy.length,
                itemBuilder: (context, index) {
                  if (isJoinedList.isEmpty || index >= isJoinedList.length) {
                    return const SizedBox();
                  }
                  final communities = communitiy[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 150,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(communities.imagepath),
                          radius: 40,
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              communities.title,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: cornflowerblue,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat"),
                            ),
                            const SizedBox(height: 2),
                            SizedBox(
                              width: 210,
                              child: Text(
                                communities.subtitle,
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                    side: const BorderSide(color: white),
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    label: Text(
                                      communities.chip,
                                      style: const TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    labelStyle: const TextStyle(color: white),
                                    backgroundColor: cornflowerblue,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 25,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: isJoinedList[index]
                                                ? green
                                                : white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            side:
                                                const BorderSide(color: green)),
                                        onPressed: () => toggleJoin(index),
                                        child: Text(
                                          isJoinedList[index]
                                              ? "Joined"
                                              : "Join",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: isJoinedList[index]
                                                  ? white
                                                  : green,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElvatedButtonWidget(
                    text: buttontext,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Homepage())); // تم التغيير
                    },
                    backgroundColor: WidgetStatePropertyAll(green),
                    color: white)),
          ],
        ),
      ),
    );
  }
}
