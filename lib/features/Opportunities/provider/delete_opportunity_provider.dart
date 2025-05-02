import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/repo/delete_opportunity_repo.dart';

class OpportunityDeleteProvider with ChangeNotifier {
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  // دالة لحذف الفرصة
  Future<void> deleteOpportunity(String opportunityId) async {
    try {
      // استدعاء دالة الحذف من الريبو
      _isDeleted =
          await DeleteOpportunityRepo().deleteOpportunity(opportunityId);
      notifyListeners(); // إعلام الـ UI بالتغيير
    } catch (e) {
      print('Error in deleting opportunity: $e');
      _isDeleted = false;
      notifyListeners();
    }
  }
}
