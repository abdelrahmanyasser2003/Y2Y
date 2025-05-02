import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/repo/get_opportunities_of_user_repo.dart';

class GetOpportunitiesOfUserProvider with ChangeNotifier{
  final GetUserOpportunitiesRepo _repo = GetUserOpportunitiesRepo();

  List<GetAllOpportunities> _opportunities = [];
  List<GetAllOpportunities> get opportunities => _opportunities;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchUserOpportunities() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _opportunities = await _repo.fetchUserOpportunities();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
