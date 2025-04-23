import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Communities/Screens/communitys_details_screen.dart';
import 'package:y2y/features/Communities/model/community_model.dart';

class Communities extends StatefulWidget {
  const Communities({super.key, required this.communityy});
  final List<CommunityModel> communityy;

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: widget.communityy.isEmpty
                  ? const Center(
                      child: Text(
                        "You haven’t Joined any community yet",
                        style: TextStyle(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto",
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.communityy.length,
                      itemBuilder: (context, index) {
                        final community = widget.communityy[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          margin: const EdgeInsets.only(bottom: 15),
                          height: 150,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(community.imagepath),
                                radius: 40,
                              ),
                              const SizedBox(width: 7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    community.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  SizedBox(
                                    width: 210,
                                    child: Text(
                                      community.subtitle,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Chip(
                                        side: const BorderSide(color: white),
                                        padding: const EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        label: Text(
                                          community.chip,
                                          style: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w800,
                                            color: white,
                                          ),
                                        ),
                                        backgroundColor: cornflowerblue,
                                      ),
                                      const SizedBox(width: 20),
                                      SizedBox(
                                        width: 100,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Communitysdeitals(
                                                          community: community,
                                                        ))); //
                                          },
                                          child: Text(
                                            "Show Community",
                                            style: TextStyle(
                                                color: cornflowerblue,
                                                fontSize: 8,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
