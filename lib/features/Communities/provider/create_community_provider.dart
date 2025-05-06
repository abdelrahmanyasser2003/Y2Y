import 'dart:io';

import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/repo/create_community_repo.dart';

class CreateCommunityProvider with ChangeNotifier {
  final CreateCommunityRepo _repo = CreateCommunityRepo();

  bool isLoading = false;
  String? errorMessage;
  bool isSuccess = false;

  // دالة لإنشاء المجتمع
  Future<void> createCommunity({
    required String name,
    required List<String> types,
    required String desc,
    required String category,
    required String subcategory,
    required int limitOfUsers,
    required String roles,
    required Map<String, String> location,
    required Map<String, dynamic> date,
    required File imagePath,
  }) async {
    // تغيير حالة التحميل
    isLoading = true;
    isSuccess = false;
    errorMessage = null; // مسح أي رسالة خطأ سابقة
    notifyListeners();

    try {
      // استدعاء دالة إنشاء المجتمع من الريبو
      final error = await _repo.createCommunity(
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

      // إذا كانت النتيجة بلا أخطاء، نجعل isSuccess = true
      if (error == null) {
        isSuccess = true;
      } else {
        isSuccess = false;
        errorMessage = error; // تخزين رسالة الخطأ
      }
    } catch (e) {
      // في حالة حدوث استثناء، سجل الخطأ
      isSuccess = false;
      errorMessage = 'فشل في إنشاء المجتمع: ${e.toString()}';
    } finally {
      isLoading = false; // إعادة تعيين حالة التحميل
      notifyListeners(); // إشعار الواجهة بتغيير الحالة
    }
  }
}
