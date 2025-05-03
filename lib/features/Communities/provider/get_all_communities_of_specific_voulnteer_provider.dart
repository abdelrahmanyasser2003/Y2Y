import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/get_all_communities_voulnteer_model.dart';
import 'package:y2y/features/Communities/repo/get_all_communities_specific_voulnteer_repo.dart';

class GetAllCommunitiesOfSpecificVoulnteerProvider with ChangeNotifier {
  final GetAllCommunitiesSpecificVoulnteerRepo _repository =
      GetAllCommunitiesSpecificVoulnteerRepo(); // استبدل بالاسم الصحيح

  List<CommunitiesModellvoulnteer> _communities = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CommunitiesModellvoulnteer> get communities => _communities;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getAllCommunitiesgetOfSpecificVoulnteer() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _communities =
          await _repository.getAllCommunitiesgetOfSpecificVoulnteer();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
