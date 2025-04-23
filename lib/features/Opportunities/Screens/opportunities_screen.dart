import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Opportunities/Screens/new_opportunitie_screen.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  State<Opportunities> createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  Map<String, List<React>> opportunityReacts = {};
  String userId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final storageId = await StorageHelper().getUserId(); // جلب userId
      setState(() {
        userId = storageId ?? '';
      });

      final oppProvider = Provider.of<GetAllOpportunitiesProvider>(context, listen: false);
      final reactProvider = Provider.of<GetAllReactsProvider>(context, listen: false);

      await oppProvider.fetchOpportunities();

      for (var opportunity in oppProvider.opportunities) {
        final reacts = await reactProvider.fetchReacts(opportunity.id ?? '');
        if (!mounted) return;
        setState(() {
          opportunityReacts[opportunity.id ?? ''] = reacts ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final opportunitiesProvider = Provider.of<GetAllOpportunitiesProvider>(context);

    if (opportunitiesProvider.isLoading) {
      return const Scaffold(
        backgroundColor: cornflowerblue,
        body: Center(
          child: CircularProgressIndicator(
            color: purple,
          ),
        ),
      );
    }

    if (opportunitiesProvider.hasError) {
      return const Scaffold(
        backgroundColor: cornflowerblue,
        body: Center(child: Text('Error loading opportunities')),
      );
    }

    final publicOpportunities = opportunitiesProvider.opportunities
        .where((opportunity) => opportunity.createdBy?.id != userId)
        .toList();

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
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: publicOpportunities.length,
                itemBuilder: (context, index) {
                  final opportunity = publicOpportunities[index];
                  final reacts = opportunityReacts[opportunity.id ?? ''];

                  int trustCount = reacts?.where((r) => r.react == "trusted").length ?? 0;
                  int unTrustCount = reacts?.where((r) => r.react == "untrusted").length ?? 0;

                  final userReact = reacts?.firstWhere(
                    (r) => r.user == userId,
                    orElse: () => React(user: '', react: ''),
                  );

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                    color: Colors.blue,
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
                                      color: Colors.blue,
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
                        reacts == null
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(color: purple),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Provider.of<GetAllReactsProvider>(context, listen: false)
                                          .makeReact(opportunity.id ?? '', 'trusted');
                                      final newReacts = await Provider.of<GetAllReactsProvider>(context, listen: false)
                                          .fetchReacts(opportunity.id ?? '');
                                      if (!mounted) return;
                                      setState(() {
                                        opportunityReacts[opportunity.id ?? ''] = newReacts ?? [];
                                      });
                                    },
                                    child: Text(
                                      userReact?.react == 'trusted' ? '✅ Trusted ($trustCount)' : 'Trust ($trustCount)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: userReact?.react == 'trusted' ? Colors.green : cornflowerblue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await Provider.of<GetAllReactsProvider>(context, listen: false)
                                          .makeReact(opportunity.id ?? '', 'untrusted');
                                      final newReacts = await Provider.of<GetAllReactsProvider>(context, listen: false)
                                          .fetchReacts(opportunity.id ?? '');
                                      if (!mounted) return;
                                      setState(() {
                                        opportunityReacts[opportunity.id ?? ''] = newReacts ?? [];
                                      });
                                    },
                                    child: Text(
                                      userReact?.react == 'untrusted'
                                          ? '⛔ UnTrusted ($unTrustCount)'
                                          : 'UnTrust ($unTrustCount)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: userReact?.react == 'untrusted' ? Colors.red : cornflowerblue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              ),
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

  String imageUrl = ApiEndpoints.baseUrl + imagePath.replaceAll('\\', '/');

  return CircleAvatar(
    backgroundImage: NetworkImage(imageUrl),
    radius: 35,
  );
}
