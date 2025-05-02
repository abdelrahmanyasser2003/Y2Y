import 'package:flutter/material.dart';
import 'package:y2y/features/Settings/repo/logout_repo.dart';

class LogoutProvider extends ChangeNotifier {
  final LogoutRepo _logoutRepo = LogoutRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> logout() async {
    _isLoading = true;
    notifyListeners();

    final result = await _logoutRepo.logout();

    _isLoading = false;
    notifyListeners();

    return result;
  }
}
