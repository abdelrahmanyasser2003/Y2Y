import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/repo/delete_community_repo.dart';

class DeleteCommunityProvider with ChangeNotifier {
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  // دالة لحذف الفرصة
  Future<void> deleteCommunity(String communityId) async {
    try {
      // استدعاء دالة الحذف من الريبو
      _isDeleted = await DeleteCommunityRepo().deleteCommunity(communityId);
      notifyListeners(); // إعلام الـ UI بالتغيير
    } catch (e) {
      print('Error in deleting Community: $e');
      _isDeleted = false;
      notifyListeners();
    }
  }
}
