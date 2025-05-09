import 'dart:io';
import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/repo/update_community_repo.dart';

class UpdateCommunityProvider extends ChangeNotifier {
  final UpdateCommunityRepo _repo = UpdateCommunityRepo();

  String? successMessage;
  String? errorMessage;

  Future<bool> updateCommunity({
    required String communityId,
    String? name,
    List<String>? types,
    String? desc,
    String? category,
    String? subcategory,
    int? limitOfUsers,
    String? roles,
    Map<String, String>? location,
    Map<String, dynamic>? date,
    File? imagePath,
  }) async {
    successMessage = null;
    errorMessage = null;

    final result = await _repo.updateCommunity(
      communityId: communityId,
      name: name,
      types: types,
      desc: desc,
      category: category,
      subcategory: subcategory,
      limitOfUsers: limitOfUsers,
      roles: roles,
      location: location,
      date: date,
      imagePath: imagePath,
    );

    if (result == null) {
      successMessage = 'تم تعديل المجتمع بنجاح';
      notifyListeners();
      return true; // ✅ تم بنجاح
    } else {
      errorMessage = result;
      notifyListeners();
      return false; // ❌ فشل
    }
  }
}
