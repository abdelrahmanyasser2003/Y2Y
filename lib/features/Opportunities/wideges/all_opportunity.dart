import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/get_all_opportunities_provider.dart';

import 'opportunity_card.dart';
import 'view_all_button.dart';

class PublicOpportunitiesSection extends StatelessWidget {
  final String userId;
  final bool showAll;
  final VoidCallback onViewAll;
  final Map<String, List<React>> opportunityReacts;
  final Map<String, String> localUserReacts;
  final Map<String, String> reactColors;

  const PublicOpportunitiesSection({
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
    final allOpportunities =
        context.watch<GetAllOpportunitiesProvider>().opportunities;

    final publicOpportunities = allOpportunities
        .where((opportunity) => opportunity.createdBy?.id != userId)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Opportunities',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        ...publicOpportunities
            .take(showAll ? publicOpportunities.length : 3)
            .map((opportunity) => OpportunityCard(
                  opportunity: opportunity,
                  userId: userId,
                  opportunityReacts: opportunityReacts,
                  localUserReacts: localUserReacts,
                  reactColors: reactColors,
                )),
        if (!showAll && publicOpportunities.length > 3)
          ViewAllButton(onTap: onViewAll),
      ],
    );
  }
}
