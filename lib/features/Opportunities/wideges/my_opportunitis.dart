import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_opportunities_of_user_provider.dart';

import 'opportunity_card.dart';
import 'view_all_button.dart';

class MyOpportunitiesSection extends StatelessWidget {
  final String userId;
  final bool showAll;
  final VoidCallback onViewAll;
  final Map<String, List<React>> opportunityReacts;
  final Map<String, String> localUserReacts;
  final Map<String, String> reactColors;

  const MyOpportunitiesSection({
    super.key,
    required this.userId,
    required this.showAll,
    required this.onViewAll,
    required this.opportunityReacts,
    required this.localUserReacts,
    required this.reactColors,
  });

  @override
  Widget build(BuildContext context) {
    final myOpportunities =
        context.watch<GetOpportunitiesOfUserProvider>().opportunities;

    if (myOpportunities.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Opportunities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        ...myOpportunities
            .take(showAll ? myOpportunities.length : 3)
            .map((opportunity) => OpportunityCard(
                  opportunity: opportunity,
                  userId: userId,
                  opportunityReacts: opportunityReacts,
                  localUserReacts: localUserReacts,
                  reactColors: reactColors,
                )),
        if (!showAll && myOpportunities.length > 3)
          ViewAllButton(onTap: onViewAll),
      ],
    );
  }
}
