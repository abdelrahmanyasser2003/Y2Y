import 'package:flutter/material.dart';
import 'package:y2y/networking/auth_apis/login_api.dart';

class LoginProvider with ChangeNotifier {
   final LoginApiService _apiService = LoginApiService();
  String? _token;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;

  Future<bool> login(String email, String password) async {
    _token = await _apiService.login(email, password);
    _isAuthenticated = _token != null;
    notifyListeners();
    return _isAuthenticated;
  }

  void logout() {
    _token = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
