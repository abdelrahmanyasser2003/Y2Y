import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/repo/leave_community_repo.dart';

class LeaveCommunityProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> leaveCommunity(String communityId) async {
    isLoading = true;
    bool result = await LeaveCommunityRepo().leaveCommunity(communityId);
    isLoading = false;
    return result;
  }
}
