import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/community_model.dart';
import 'package:y2y/features/Communities/model/get_all_communities_model.dart';

class CommunityProvider with ChangeNotifier {
  final List<GetAllCommunitiesModel> _joinedCommunities = [];

  final List<GetAllCommunitiesModel> availableCommunities = [];

  List<GetAllCommunitiesModel> get joinedCommunities => _joinedCommunities;

  void joinCommunity(GetAllCommunitiesModel community) {
    if (!_joinedCommunities.contains(community)) {
      _joinedCommunities.add(community);
      notifyListeners();
    }
  }

  void leaveCommunity(CommunityModel community) {
    _joinedCommunities.remove(community);
    notifyListeners();
  }
}
