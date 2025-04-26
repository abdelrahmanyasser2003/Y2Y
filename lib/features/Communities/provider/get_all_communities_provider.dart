import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/get_all_communities_model.dart';
import 'package:y2y/features/Communities/repo/get_all_coomunities_repo.dart';

class CommunitiesProvider with ChangeNotifier {
  List<CommunitiesModell> _communities = [];

  List<CommunitiesModell> get communities => _communities;

  bool isLoading = false;

  Future<void> fetchCommunities() async {
    try {
      isLoading = true;
      notifyListeners();

      final repo = GetAllCommunitiesRepo();
      _communities = await repo.getAllCommunities();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("❌ Error: $e");
      notifyListeners();
    }
  }
}
