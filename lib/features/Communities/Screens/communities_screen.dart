import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Communities/Screens/communitys_details_screen.dart';
import 'package:y2y/features/Communities/Screens/joined_commynitiy_screen.dart';
import 'package:y2y/features/Communities/Screens/my_community_details_screen.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_of_specific_user_provider.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_of_specific_voulnteer_provider.dart';
import 'package:y2y/features/Communities/provider/get_all_communities_provider.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommunitiesProvider>(context, listen: false)
          .fetchCommunities();
      Provider.of<GetAllCommunitiesOfSpecificVoulnteerProvider>(context,
              listen: false)
          .getAllCommunitiesgetOfSpecificVoulnteer();
      Provider.of<GetAllCommunitiesOfSpecificUserProvider>(context,
              listen: false)
          .getAllCommunitiesgetOfSpecificuser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔹 عرض المجتمعات التي يديرها المستخدم فقط إذا لم تكن فارغة
              Consumer<GetAllCommunitiesOfSpecificVoulnteerProvider>(
                builder: (context, provider, child) {
                  final managedCommunities = provider.communities;

                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: purple),
                    );
                  }

                  if (managedCommunities.isEmpty) {
                    return const SizedBox(); // سكشن مخفي إذا فاضي
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Communities I Manage",
                        style: TextStyle(
                          color: white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      hieghtspace(hieght: 20),
                      ...managedCommunities.map((community) {
                        final imageUrl =
                            '${ApiEndpoints.baseUrl}${community.image?.replaceAll("\\", "/") ?? ''}';

                        return communityCard(
                          image: NetworkImage(imageUrl),
                          title: community.name ?? '',
                          subtitle: community.desc ?? '',
                          chip: community.types?.first ?? '',
                          joinWidget: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyCommunityDetailsScreen(
                                          myCommunity: community),
                                ),
                              );
                            },
                            child: const Text(
                              'Manage',
                              style: TextStyle(
                                color: cornflowerblue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),

              hieghtspace(hieght: 30),
              Consumer<GetAllCommunitiesOfSpecificUserProvider>(
                builder: (context, provider, child) {
                  final joinedCommunities = provider.communities;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Communities",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (provider.isLoading)
                        const Center(
                          child: CircularProgressIndicator(color: purple),
                        )
                      else if (joinedCommunities.isEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 50),
                            Center(
                              child: Text(
                                "You haven’t Joined any community yet",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: white,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: joinedCommunities.map((community) {
                            final imageUrl =
                                '${ApiEndpoints.baseUrl}${community.image?.replaceAll("\\", "/") ?? ''}';

                            return communityCard(
                              image: NetworkImage(imageUrl),
                              title: community.name ?? '',
                              subtitle: community.desc ?? '',
                              chip: community.types?.first ?? "",
                              joinWidget: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          JoinedCommynitiyScreen(
                                              joinedCommunity: community),
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
                            );
                          }).toList(),
                        ),
                    ],
                  );
                },
              ),

              hieghtspace(hieght: 20),
              Divider(color: white, thickness: 0.5),
              hieghtspace(hieght: 20),

              /// 🔹 المجتمعات المقترحة
              Text(
                "Explore More Communities",
                style: TextStyle(
                  color: white,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Consumer<CommunitiesProvider>(
                builder: (context, provider, child) {
                  final apiCommunities = provider.communities;
                  if (apiCommunities.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(color: purple),
                    );
                  }

                  return Column(
                    children: apiCommunities.asMap().entries.map((entry) {
                      final community = entry.value;
                      final imageUrl =
                          '${ApiEndpoints.baseUrl}${community.image?.replaceAll('\\', '/') ?? ''}';

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommunityDetails(community: community),
                            ),
                          );
                        },
                        child: communityCard(
                          image: NetworkImage(imageUrl),
                          title: community.name ?? '',
                          subtitle: community.desc ?? '',
                          chip: community.types?.first ?? '',
                          joinWidget: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CommunityDetails(community: community),
                                ),
                              );
                            },
                            child: Text(
                              'Show Community',
                              style: TextStyle(
                                color: cornflowerblue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget communityCard({
    required ImageProvider image,
    required String title,
    required String subtitle,
    required String chip,
    required Widget joinWidget,
  }) {
    return GestureDetector(
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
              backgroundImage: image,
              radius: 40,
              onBackgroundImageError: (_, __) =>
                  debugPrint('❌ Image Load Failed'),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
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
                      subtitle,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        side: const BorderSide(color: white),
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        label: Text(
                          chip,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                            color: white,
                          ),
                        ),
                        backgroundColor: cornflowerblue,
                      ),
                      joinWidget,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
