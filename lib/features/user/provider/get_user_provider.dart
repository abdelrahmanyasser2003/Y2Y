import 'package:flutter/material.dart';
import 'package:y2y/features/user/models/user_model.dart';
import 'package:y2y/features/user/repo/user_repo.dart';

class GetUserProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // دالة لجلب بيانات البروفايل
  Future<void> fetchUserProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      // استدعاء الريبو لجلب البيانات
      final userRepo = UserRepo();
      _user = await userRepo.getProfileData();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
