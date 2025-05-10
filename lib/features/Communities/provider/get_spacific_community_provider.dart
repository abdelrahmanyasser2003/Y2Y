import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/model/get_spacific_community_model.dart';
import 'package:y2y/features/Communities/repo/get_spacific_community_repo.dart';


class GetSpecificCommunityProvider extends ChangeNotifier {
  final GetSpacificCommunityRepo _communityRepo = GetSpacificCommunityRepo();
  
  // حالة البيانات
  List<GetSpacificCommunityModel> _communityData = [];
  List<GetSpacificCommunityModel> get communityData => _communityData;

  // حالة الخطأ
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // حالة التحميل
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // جلب بيانات المجتمع
  Future<void> fetchCommunityData(String communityId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _communityData = await _communityRepo.getAllCommunities(communityId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
