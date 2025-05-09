import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opportunities/Screens/my_opportunity_screen.dart';
import 'package:y2y/features/Opportunities/Screens/new_opportunitie_screen.dart';
import 'package:y2y/features/Opportunities/Screens/opportunities_details_screen.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_opportunities_of_user_provider.dart';
import 'package:y2y/features/Opportunities/provider/make_react_provider.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  Map<String, List<React>> opportunityReacts = {};
  Map<String, String> localUserReacts = {};
  Map<String, String> reactColors = {};
  Map<String, int> reactCounts = {}; // لإضافة عدد الردود
  String userId = '';
  bool showAllMyOpportunities = false;
  bool showAllAllOpportunities = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final oppProvider =
          Provider.of<GetAllOpportunitiesProvider>(context, listen: false);
      final reactProvider =
          Provider.of<GetAllReactsProvider>(context, listen: false);
      final userOpportunityProvider =
          Provider.of<GetOpportunitiesOfUserProvider>(context, listen: false);

      await userOpportunityProvider
          .fetchUserOpportunities(); // جلب الفرص للمستخدم
      await oppProvider.fetchOpportunities(); // جلب الفرص العامة

      for (var opportunity in oppProvider.opportunities) {
        final reacts = await reactProvider
            .fetchReacts(opportunity.id ?? ''); // جلب التفاعلات
        if (!mounted) return;
        setState(() {
          opportunityReacts[opportunity.id ?? ''] = reacts ?? [];
          reactCounts[opportunity.id ?? ''] = reacts?.length ?? 0; // حساب العدد
          final userReact = reacts?.firstWhere(
            (r) => r.user == userId,
            orElse: () => React(user: '', react: ''),
          );
          localUserReacts[opportunity.id ?? ''] = userReact?.react ?? '';
          reactColors[opportunity.id ?? ''] = userReact?.react == 'trusted'
              ? 'green'
              : userReact?.react == 'untrusted'
                  ? 'red'
                  : 'blue';
        });
      }
    });
  }

  int getReactCount(List<React> reacts, String reactType) {
    // تأكد من أن 'reacts' ليست فارغة أو null، ثم قم بحساب العدد
    return reacts.where((react) => react.react == reactType).length;
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: cornflowerblue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Newopportunitie()),
          );
        },
        backgroundColor: purple,
        child: Image.asset('assets/img/Vector.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🟣 قسم "My Opportunities"
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
                                builder: (context) => MyOpportunityScreen(
                                    myOpportunity: opportunity)));
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
                                  onTap: () async {},
                                  child: Text(
                                    'trust (${getReactCount(opportunityReacts[opportunity.id ?? ''] ?? [], 'trusted')})',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: (localUserReacts[
                                                  opportunity.id ?? ''] ==
                                              'trusted')
                                          ? Colors.green
                                          : cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'untrust (${getReactCount(opportunity.react ?? [], 'untrusted')})',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: cornflowerblue,
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
              hieghtspace(hieght: 10),
              const Text(
                'All Opportunities',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
              hieghtspace(hieght: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: showAllAllOpportunities
                    ? opportunitiesProvider.opportunities.length
                    : opportunitiesProvider.opportunities.length > 3
                        ? 3
                        : opportunitiesProvider.opportunities.length,
                itemBuilder: (context, index) {
                  final opportunity =
                      opportunitiesProvider.opportunities[index];
                  final reacts = opportunityReacts[opportunity.id ?? ''] ?? [];

                  int trustCount =
                      reacts.where((r) => r.react == "trusted").length;
                  int unTrustCount =
                      reacts.where((r) => r.react == "untrusted").length;

                  String userReact =
                      localUserReacts[opportunity.id ?? ''] ?? '';
                  String reactColor =
                      reactColors[opportunity.id ?? ''] ?? 'blue';
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Opportunitiesdetils(
                                  opportunity: opportunity)));
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
                              // زر TRUST
                              GestureDetector(
                                onTap: () async {
                                  final reactProvider =
                                      Provider.of<GetAllReactsProvider>(context,
                                          listen: false);
                                  String currentReact =
                                      localUserReacts[opportunity.id ?? ''] ??
                                          '';
                                  bool success = false;

                                  if (currentReact == 'trusted') {
                                    // إرسال "remove" لإزالة التفاعل
                                    success = await reactProvider.makeReact(
                                        opportunity.id ?? '', 'remove');
                                  } else {
                                    // إضافة التفاعل "trusted"
                                    success = await reactProvider.makeReact(
                                        opportunity.id ?? '', 'trusted');
                                  }

                                  if (success) {
                                    final updatedReacts = await reactProvider
                                        .fetchReacts(opportunity.id ?? '');
                                    if (!mounted) return;

                                    setState(() {
                                      if (currentReact == 'trusted') {
                                        // إذا كان التفاعل الحالي هو "trusted"، إزالته
                                        localUserReacts[opportunity.id ?? ''] =
                                            '';
                                        reactColors[opportunity.id ?? ''] =
                                            'blue'; // تغيير اللون إلى الأزرق بعد الإزالة
                                      } else {
                                        // إذا لم يكن هناك تفاعل "trusted"، إضافته
                                        localUserReacts[opportunity.id ?? ''] =
                                            'trusted';
                                        reactColors[opportunity.id ?? ''] =
                                            'green'; // تغيير اللون إلى الأخضر بعد الإضافة
                                      }

                                      opportunityReacts[opportunity.id ?? ''] =
                                          updatedReacts ?? [];
                                    });
                                  } else {
                                    print(
                                        "❌ Error: Failed to modify react successfully.");
                                  }
                                },
                                child: Text(
                                  localUserReacts[opportunity.id ?? ''] ==
                                          'trusted'
                                      ? 'Trusted $trustCount'
                                      : 'Trust $trustCount',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    color:
                                        localUserReacts[opportunity.id ?? ''] ==
                                                'trusted'
                                            ? Colors.green
                                            : cornflowerblue,
                                  ),
                                ),
                              ),

                              // زر UNTRUST
                              GestureDetector(
                                onTap: () async {
                                  final reactProvider =
                                      Provider.of<GetAllReactsProvider>(context,
                                          listen: false);
                                  String currentReact =
                                      localUserReacts[opportunity.id ?? ''] ??
                                          '';
                                  bool success = false;

                                  if (currentReact == 'untrusted') {
                                    // إرسال "remove" لإزالة التفاعل
                                    success = await reactProvider.makeReact(
                                        opportunity.id ?? '', 'remove');
                                  } else {
                                    // إضافة التفاعل "untrusted"
                                    success = await reactProvider.makeReact(
                                        opportunity.id ?? '', 'untrusted');
                                  }

                                  if (success) {
                                    final updatedReacts = await reactProvider
                                        .fetchReacts(opportunity.id ?? '');
                                    if (!mounted) return;

                                    setState(() {
                                      if (currentReact == 'untrusted') {
                                        // إذا كان التفاعل الحالي هو "untrusted"، إزالته
                                        localUserReacts[opportunity.id ?? ''] =
                                            '';
                                        reactColors[opportunity.id ?? ''] =
                                            'blue'; // تغيير اللون إلى الأزرق بعد الإزالة
                                      } else {
                                        // إذا لم يكن هناك تفاعل "untrusted"، إضافته
                                        localUserReacts[opportunity.id ?? ''] =
                                            'untrusted';
                                        reactColors[opportunity.id ?? ''] =
                                            'red'; // تغيير اللون إلى الأحمر بعد الإضافة
                                      }

                                      opportunityReacts[opportunity.id ?? ''] =
                                          updatedReacts ?? [];
                                    });
                                  } else {
                                    print(
                                        "❌ Error: Failed to modify react successfully.");
                                  }
                                },
                                child: Text(
                                  localUserReacts[opportunity.id ?? ''] ==
                                          'untrusted'
                                      ? 'Untrusted $unTrustCount'
                                      : 'UnTrust $unTrustCount',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    color:
                                        localUserReacts[opportunity.id ?? ''] ==
                                                'untrusted'
                                            ? Colors.red
                                            : cornflowerblue,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (!showAllAllOpportunities &&
                  opportunitiesProvider.opportunities.length > 3) ...[
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
