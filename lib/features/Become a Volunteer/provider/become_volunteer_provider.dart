import 'package:flutter/material.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';
import 'package:y2y/features/Become%20a%20Volunteer/repo/become_volunteer_repo.dart';

class BecomeVolunteerProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _success = false; // تعديل قيمة success لتخزين الحالة
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get success => _success;

  Future<void> becomeVolunteer(BecomeVolunteerModel model) async {
    _isLoading = true;
    _success = false; // إعادة تعيين قيمة _success عند بدء العملية
    notifyListeners();

    final repo = BecomeVolunteerRepo();
    final result = await repo.becomeVolunteer(model: model);

    if (result == null) {
      _errorMessage = null; // Reset any previous errors
      _success = true; // ضبط النجاح إذا كانت العملية ناجحة
    } else {
      _errorMessage = result;
      _success = false; // ضبط الفشل إذا كان هناك خطأ
    }

    _isLoading = false;
    notifyListeners();
  }
}
