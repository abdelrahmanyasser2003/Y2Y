import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Opportunities/Screens/my_opportunity_screen.dart';
import 'package:y2y/features/Opportunities/Screens/new_opportunitie_screen.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_opportunities_of_user_provider.dart';
import 'package:y2y/features/Opportunities/repo/make_react_repo.dart';
import 'package:y2y/features/user/models/user_model.dart';
import 'package:y2y/features/user/repo/user_repo.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  Map<String, List<React>> opportunityReacts = {};
  bool showAllMyOpportunities = false;
  bool showAllAllOpportunities = false;
  String userId = '';
  bool isLoadingUser = false;
  UserModel? currentUser; // إضافة متغير لتخزين بيانات المستخدم
  bool isVolunteer = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadUserData();
      if (userId.isEmpty) return;
      await _loadOpportunitiesData();
    });
  }

  Future<void> _loadUserData() async {
    setState(() => isLoadingUser = true);
    try {
      final userRepo = UserRepo();
      final userData = await userRepo.getProfileData();
      setState(() {
        currentUser = userData;
        userId = userData.id ?? '';
        isVolunteer = userData.roles?.contains("volunteer") ?? false;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      setState(() => isLoadingUser = false);
    }
  }

  Future<void> _loadOpportunitiesData() async {
    final oppProvider =
        Provider.of<GetAllOpportunitiesProvider>(context, listen: false);
    final reactProvider =
        Provider.of<GetAllReactsProvider>(context, listen: false);
    final userOpportunityProvider =
        Provider.of<GetOpportunitiesOfUserProvider>(context, listen: false);

    await userOpportunityProvider.fetchUserOpportunities();
    await oppProvider.fetchOpportunities();

    for (var opportunity in oppProvider.opportunities) {
      final reacts = await reactProvider.fetchReacts(opportunity.id ?? '');
      if (!mounted) return;
      setState(() {
        opportunityReacts[opportunity.id ?? ''] = reacts ?? [];
      });
    }
  }

  int getReactCount(List<React> reacts, String reactType) {
    return reacts.where((react) => react.react == reactType).length;
  }

  Color getReactColor(String opportunityId, String reactType) {
    final reacts = opportunityReacts[opportunityId] ?? [];

    final userReact = reacts.firstWhere(
      (r) => r.user == userId,
      orElse: () => React(react: ''),
    );

    if (userReact.react == reactType) {
      return reactType == 'trusted' ? green : Colors.red;
    }

    return cornflowerblue;
  }

  Future<void> _updateReact(String opportunityId, String reactType) async {
    await MakeReactRepo().makeReact(opportunityId, reactType);
    final reacts =
        await Provider.of<GetAllReactsProvider>(context, listen: false)
            .fetchReacts(opportunityId);

    if (!mounted) return;
    setState(() {
      opportunityReacts[opportunityId] = reacts ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingUser) {
      return const Scaffold(
        backgroundColor: cornflowerblue,
        body: Center(
          child: CircularProgressIndicator(color: purple),
        ),
      );
    }

    if (userId.isEmpty) {
      return Scaffold(
        backgroundColor: cornflowerblue,
        body: Center(
          child: Text(
            'لا يمكن تحميل بيانات المستخدم',
            style: TextStyle(color: white),
          ),
        ),
      );
    }

    final opportunitiesProvider =
        Provider.of<GetAllOpportunitiesProvider>(context);
    final myOpportunitiesProvider =
        Provider.of<GetOpportunitiesOfUserProvider>(context);

    if (opportunitiesProvider.isLoading || myOpportunitiesProvider.isLoading) {
      return const Scaffold(
        backgroundColor: cornflowerblue,
        body: Center(
          child: CircularProgressIndicator(color: purple),
        ),
      );
    }

    final myOpportunities = myOpportunitiesProvider.opportunities;
    final allOpportunities = opportunitiesProvider.opportunities;

    return Scaffold(
      backgroundColor: cornflowerblue,
      floatingActionButton: isVolunteer
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Newopportunitie(),
                  ),
                );
              },
              backgroundColor: purple,
              child: Image.asset('assets/img/Vector.png'),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (myOpportunities.isNotEmpty) ...[
                const Text(
                  'My Opportunities',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: showAllMyOpportunities
                      ? myOpportunities.length
                      : myOpportunities.length > 3
                          ? 3
                          : myOpportunities.length,
                  itemBuilder: (context, index) {
                    final opportunity = myOpportunities[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyOpportunityScreen(myOpportunity: opportunity),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                getProfileImage(opportunity.image),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      opportunity.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        opportunity.description ?? '',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Divider(thickness: 1, color: purple),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await _updateReact(
                                        opportunity.id ?? '', 'trusted');
                                  },
                                  child: Text(
                                    'trusted (${getReactCount(opportunityReacts[opportunity.id ?? ''] ?? [], 'trusted')})',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: getReactColor(
                                          opportunity.id ?? '', 'trusted'),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await _updateReact(
                                        opportunity.id ?? '', 'untrusted');
                                  },
                                  child: Text(
                                    'untrusted (${getReactCount(opportunityReacts[opportunity.id ?? ''] ?? [], 'untrusted')})',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: getReactColor(
                                          opportunity.id ?? '', 'untrusted'),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (!showAllMyOpportunities && myOpportunities.length > 3) ...[
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAllMyOpportunities = true;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 1,
                            width: 50,
                            color: white,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'View All',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 1,
                            width: 50,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ],
              const SizedBox(height: 10),
              const Text(
                'All Opportunities',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: showAllAllOpportunities
                    ? allOpportunities.length
                    : allOpportunities.length > 3
                        ? 3
                        : allOpportunities.length,
                itemBuilder: (context, index) {
                  final opportunity = allOpportunities[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyOpportunityScreen(myOpportunity: opportunity),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              getProfileImage(opportunity.image),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    opportunity.title ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      opportunity.description ?? '',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Divider(thickness: 1, color: purple),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await _updateReact(
                                      opportunity.id ?? '', 'trusted');
                                },
                                child: Text(
                                  'trusted (${getReactCount(opportunityReacts[opportunity.id ?? ''] ?? [], 'trusted')})',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: getReactColor(
                                        opportunity.id ?? '', 'trusted'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _updateReact(
                                      opportunity.id ?? '', 'untrusted');
                                },
                                child: Text(
                                  'untrusted (${getReactCount(opportunityReacts[opportunity.id ?? ''] ?? [], 'untrusted')})',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: getReactColor(
                                        opportunity.id ?? '', 'untrusted'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (!showAllAllOpportunities && allOpportunities.length > 3) ...[
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAllAllOpportunities = true;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 1,
                          width: 50,
                          color: white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'View All',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 1,
                          width: 50,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

Widget getProfileImage(String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/img/Full Stack.png'),
      radius: 35,
    );
  }

  final Uri uri =
      Uri.parse(ApiEndpoints.baseUrl).resolve(imagePath.replaceAll('\\', '/'));

  return CircleAvatar(
    backgroundImage: NetworkImage(uri.toString()),
    radius: 35,
  );
}
