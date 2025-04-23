import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/repo/get_all_opportunities_repo.dart';

class GetAllOpportunitiesProvider with ChangeNotifier {
  final GetAllOpportunitiesRepo _opportunitiesService =
      GetAllOpportunitiesRepo();

  List<GetAllOpportunties> _opportunities = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<GetAllOpportunties> get opportunities => _opportunities;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchOpportunities() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      _opportunities = await _opportunitiesService.fetchOpportunities();
    } catch (e) {
      _hasError = true;
      print('❌ Error in OpportunitiesProvider: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addOpportunity(GetAllOpportunties opportunity) {
    _opportunities.add(opportunity);
    notifyListeners();
  }
}
