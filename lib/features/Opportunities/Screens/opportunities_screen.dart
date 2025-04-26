import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/features/Opportunities/Screens/new_opportunitie_screen.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({Key? key}) : super(key: key);

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  Map<String, List<React>> opportunityReacts = {};
  Map<String, String> localUserReacts = {};
  Map<String, String> reactColors = {};
  String userId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final oppProvider =
          Provider.of<GetAllOpportunitiesProvider>(context, listen: false);
      final reactProvider =
          Provider.of<GetAllReactsProvider>(context, listen: false);

      await oppProvider.fetchOpportunities();

      for (var opportunity in oppProvider.opportunities) {
        final reacts = await reactProvider.fetchReacts(opportunity.id ?? '');
        if (!mounted) return;
        setState(() {
          opportunityReacts[opportunity.id ?? ''] = reacts ?? [];
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

  @override
  Widget build(BuildContext context) {
    final opportunitiesProvider =
        Provider.of<GetAllOpportunitiesProvider>(context);

    if (opportunitiesProvider.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: CircularProgressIndicator(color: Colors.purple),
        ),
      );
    }

    if (opportunitiesProvider.hasError) {
      return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(child: Text('Error loading opportunities')),
      );
    }

    final publicOpportunities = opportunitiesProvider.opportunities
        .where((opportunity) => opportunity.createdBy?.id != userId)
        .toList();

    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Newopportunitie()),
          );
        },
        backgroundColor: Colors.purple,
        child: Image.asset('assets/img/Vector.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: publicOpportunities.length,
                itemBuilder: (context, index) {
                  final opportunity = publicOpportunities[index];
                  final reacts = opportunityReacts[opportunity.id ?? ''] ?? [];

                  int trustCount =
                      reacts.where((r) => r.react == "trusted").length;
                  int unTrustCount =
                      reacts.where((r) => r.react == "untrusted").length;

                  String userReact =
                      localUserReacts[opportunity.id ?? ''] ?? '';
                  String reactColor = reactColors[opportunity.id ?? ''] ?? 'blue';

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        const Divider(thickness: 1, color: Colors.purple),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final reactProvider =
                                    Provider.of<GetAllReactsProvider>(context,
                                        listen: false);

                                if (userReact == 'trusted') {
                                  await reactProvider.makeReact(
                                      opportunity.id ?? '', 'remove');

                                  setState(() {
                                    localUserReacts[opportunity.id ?? ''] = '';
                                    reactColors[opportunity.id ?? ''] = 'blue';
                                  });
                                } else {
                                  await reactProvider.makeReact(
                                      opportunity.id ?? '', 'trusted');

                                  setState(() {
                                    localUserReacts[opportunity.id ?? ''] = 'trusted';
                                    reactColors[opportunity.id ?? ''] = 'green';
                                  });
                                }

                                final updatedReacts = await reactProvider
                                    .fetchReacts(opportunity.id ?? '');
                                if (!mounted) return;
                                setState(() {
                                  opportunityReacts[opportunity.id ?? ''] =
                                      updatedReacts ?? [];
                                });
                              },
                              child: Text(
                                userReact == 'trusted'
                                    ? 'Trusted $trustCount'
                                    : 'Trust $trustCount',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: reactColors[opportunity.id ?? ''] == 'green'
                                      ? Colors.green
                                      : Colors.blue,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final reactProvider =
                                    Provider.of<GetAllReactsProvider>(context,
                                        listen: false);

                                if (userReact == 'untrusted') {
                                  await reactProvider.makeReact(
                                      opportunity.id ?? '', 'remove');

                                  setState(() {
                                    localUserReacts[opportunity.id ?? ''] = '';
                                    reactColors[opportunity.id ?? ''] = 'blue';
                                  });
                                } else {
                                  await reactProvider.makeReact(
                                      opportunity.id ?? '', 'untrusted');

                                  setState(() {
                                    localUserReacts[opportunity.id ?? ''] = 'untrusted';
                                    reactColors[opportunity.id ?? ''] = 'red';
                                  });
                                }

                                final updatedReacts = await reactProvider
                                    .fetchReacts(opportunity.id ?? '');
                                if (!mounted) return;
                                setState(() {
                                  opportunityReacts[opportunity.id ?? ''] =
                                      updatedReacts ?? [];
                                });
                              },
                              child: Text(
                                userReact == 'untrusted'
                                    ? 'Untrusted $unTrustCount'
                                    : 'UnTrust $unTrustCount',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  color:
                                      reactColors[opportunity.id ?? ''] == 'red'
                                          ? Colors.red
                                          : Colors.blue,
                                  fontWeight: FontWeight.w700,
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

  Widget getProfileImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const CircleAvatar(
        backgroundImage: AssetImage('assets/img/Full Stack.png'),
        radius: 35,
      );
    }

    final Uri uri = Uri.parse(ApiEndpoints.baseUrl).resolve(imagePath.replaceAll('\\', '/'));

    return CircleAvatar(
      backgroundImage: NetworkImage(uri.toString()),
      radius: 35,
    );
  }
}
