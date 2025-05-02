import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';


class OpportunityCard extends StatelessWidget {
  final GetAllOpportunities opportunity;
  final String userId;
  final Map<String, List<React>> opportunityReacts;
  final Map<String, String> localUserReacts;
  final Map<String, String> reactColors;

  const OpportunityCard({
    super.key,
    required this.opportunity,
    required this.userId,
    required this.opportunityReacts,
    required this.localUserReacts,
    required this.reactColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(opportunity.title ?? 'No title'),
        subtitle: Text(opportunity.company ?? ''),
        onTap: () {
          // انتقل لصفحة التفاصيل
        },
      ),
    );
  }
}
