import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/get_all_communities_model.dart';
import 'package:y2y/features/Communities/repo/get_all_coomunities_repo.dart';


class CommunitiesProvider with ChangeNotifier {
  List<CommunitiesModell> _communityy = [];

  List<CommunitiesModell> get communityy => _communityy;

  Future<void> fetchCommunities() async {
    try {
      final repo = GetAllCommunitiesRepo();
      _communityy = await repo.getAllCommunities();
      notifyListeners();
    } catch (e) {
      print("❌ Error: $e");
    }
  }
}
