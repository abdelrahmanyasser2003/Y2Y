import 'package:flutter/material.dart';
import 'package:y2y/model/community_model.dart';

class CommunityProvider with ChangeNotifier {
  final List<CommunityModel> _joinedCommunities = [];

  final List<CommunityModel> availableCommunities = [
    CommunityModel(
        imagepath: "assets/img/ai.jpg",
        chip: "Ai",
        subtitle: "Stay updated on tech trends and AI developments",
        title: "Tech Innovators"),
    CommunityModel(
        imagepath: "assets/img/leader.jpg",
        chip: "Leadership",
        subtitle: "A community for leadership and academic growth",
        title: "Student Leaders"),
    CommunityModel(
        imagepath: "assets/img/design.jpg",
        chip: "UI/UX Design",
        subtitle: "Connect with fellow graphic and UI/UX designers",
        title: "Design Creatives"),
    CommunityModel(
        imagepath: "assets/img/prog.jpg",
        chip: "Programming",
        subtitle: "A space for aspiring developers to share knowledge",
        title: "Programming Gurus"),
  ];

  List<CommunityModel> get joinedCommunities => _joinedCommunities;

  void joinCommunity(CommunityModel community) {
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
