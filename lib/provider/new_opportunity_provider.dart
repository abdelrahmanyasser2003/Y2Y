import 'package:flutter/material.dart';
import 'package:y2y/model/opportunitys_model.dart';

class NewOpportunityProvider extends ChangeNotifier {
  final List<opportunitydetilsmodel> _opportunitydeyils = [];
  List<opportunitydetilsmodel> get opportunities => _opportunitydeyils;

  void addopportunity(opportunitydetilsmodel opportunity) {
    _opportunitydeyils.add(opportunity);
    notifyListeners();
  }
}
