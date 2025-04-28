import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/Screens/home_screen.dart';
import 'package:y2y/features/Communities/Screens/communitys_details_screen.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<CommunitiesProvider>(context, listen: false)
          .fetchCommunities();
      final communities =
          Provider.of<CommunitiesProvider>(context, listen: false).communities;
      setState(() {
        isJoinedList = List<bool>.filled(communities.length, false);
      });
    });
  }

  void toggleJoin(int index) {
    setState(() {
      isJoinedList[index] = !isJoinedList[index];

      if (isJoinedList.contains(true)) {
        buttontext = "Go to My Communities";
      } else {
        buttontext = "Skip to now";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final communitiesProvider = Provider.of<CommunitiesProvider>(context);
    final communitiy = communitiesProvider.communities;

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
        ),
      ),
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
              child: communitiesProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: communitiy.length,
                      itemBuilder: (context, index) {
                        if (isJoinedList.isEmpty ||
                            index >= isJoinedList.length) {
                          return const SizedBox();
                        }
                        final community = communitiy[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommunityDetails(
                                  community: community,
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                                  backgroundImage: NetworkImage(
                                    '${ApiEndpoints.baseUrl}${community.image?.replaceAll('\\', '/') ?? ''}',
                                  ),
                                  radius: 40,
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        community.name ?? 'No Name',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          community.desc ?? 'No Description',
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
                                              (community.types != null &&
                                                      community.types!.isNotEmpty)
                                                  ? community.types!.first
                                                  : 'No Type',
                                              style: const TextStyle(
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w800,
                                                color: white,
                                              ),
                                            ),
                                            backgroundColor: cornflowerblue,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommunityDetails(
                                                          community: community),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Show Community',
                                              style: TextStyle(
                                                color: cornflowerblue,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
                backgroundColor: const WidgetStatePropertyAll(green),
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
