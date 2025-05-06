import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/get_all_communities_user_model.dart';

import 'package:y2y/features/Communities/repo/get_all_communities_specific_user_repo.dart';

class GetAllCommunitiesOfSpecificUserProvider with ChangeNotifier{
    final GetAllCommunitiesSpecificUserRepo _repository =
      GetAllCommunitiesSpecificUserRepo(); // استبدل بالاسم الصحيح

  List<GetAllCommunitiesUserModel> _communities = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<GetAllCommunitiesUserModel> get communities => _communities;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getAllCommunitiesgetOfSpecificuser() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _communities =
          await _repository.getAllCommunitiesgetOfSpecificuser();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}