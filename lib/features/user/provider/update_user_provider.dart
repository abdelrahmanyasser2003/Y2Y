import 'package:flutter/material.dart';
import 'package:y2y/features/user/repo/update_user_repo.dart';

class UpdateUserProvider with ChangeNotifier {
  final UpdateUserRepo _updateUserRepo = UpdateUserRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String email,
    required Map<String, String> address,
    required String phone,
    required String bD,
    required String bio,
    required String gender,
    required String userName,
    required List<dynamic> interested,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _updateUserRepo.updateUserDetails(
        firstName: firstName,
        lastName: lastName,
        email: email,
        address: address,
        phone: phone,
        bD: bD,
        bio: bio,
        gender: gender,
        userName: userName,
        interested: interested,
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
