import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/opportunitys_model.dart';


class NewOpportunityProvider extends ChangeNotifier {
  final List<OpportunityDetilsModel> _opportunityDetails = [];

  List<OpportunityDetilsModel> get opportunities => _opportunityDetails;

  void addOpportunity(OpportunityDetilsModel opportunity) {
    _opportunityDetails.add(opportunity);
    notifyListeners();
  }
}
