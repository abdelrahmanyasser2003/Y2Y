import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:y2y/features/user/repo/update_user_repo.dart';

class UpdateUserProvider with ChangeNotifier {
  final UpdateUserRepo _repo;

  UpdateUserProvider(this._repo);

  // حالات التحميل والأخطاء
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMessage;
  String? get successMessage => _successMessage;

  // 1. دالة لتحديث الملف الشخصي كامل
  Future<void> updateFullProfile({
    String? firstName,
    String? lastName,
    Map<String, String>? address,
    String? phone,
    String? bD,
    String? bio,
    String? gender,
    String? userName,
    List<String>? interested,
    File? imageFile,
  }) async {
    _startLoading();

    try {
      await _repo.updateUserProfile(
        firstName: firstName,
        lastName: lastName,
        address: address,
        phone: phone,
        bD: bD,
        bio: bio,
        gender: gender,
        userName: userName,
        interested: interested,
        imageFile: imageFile,
      );

      _setSuccess('تم تحديث الملف الشخصي بنجاح');
    } catch (e) {
      _setError(_parseError(e));
    } finally {
      _stopLoading();
    }
  }

  // 2. دالة لتحديث حقل واحد
  Future<void> updateSingleField({
    required String fieldName,
    required dynamic fieldValue,
  }) async {
    _startLoading();

    try {
      await _repo.updateSingleField(
        fieldName: fieldName,
        fieldValue: fieldValue,
      );

      _setSuccess('تم تحديث $fieldName بنجاح');
    } catch (e) {
      _setError(_parseError(e));
    } finally {
      _stopLoading();
    }
  }

  // 3. دالة خاصة لتحديث الصورة
  Future<void> updateProfileImage(File imageFile) async {
    _startLoading();

    try {
      await _repo.updateUserProfile(
        firstName: '', // يمكن إرسال قيم افتراضية
        lastName: '',
        address: {},
        phone: '',
        bD: '',
        bio: '',
        gender: '',
        userName: '',
        interested: [],
        imageFile: imageFile,
      );

      _setSuccess('تم تحديث الصورة بنجاح');
    } catch (e) {
      _setError(_parseError(e));
    } finally {
      _stopLoading();
    }
  }

  // ------ الدوال المساعدة ------
  void _startLoading() {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _successMessage = null;
    notifyListeners();
  }

  void _setSuccess(String message) {
    _successMessage = message;
    _errorMessage = null;
    notifyListeners();
  }

  String _parseError(dynamic e) {
    final errorStr = e.toString();

    if (errorStr.contains('SocketException')) {
      return 'لا يوجد اتصال بالإنترنت';
    } else if (errorStr.contains('401')) {
      return 'انتهت صلاحية الجلسة، يرجى تسجيل الدخول مجدداً';
    } else if (errorStr.contains('400')) {
      return 'بيانات غير صالحة: ${_extractErrorMessage(e)}';
    } else if (errorStr.contains('500')) {
      return 'خطأ في الخادم، يرجى المحاولة لاحقاً';
    } else {
      return 'حدث خطأ غير متوقع: ${_extractErrorMessage(e)}';
    }
  }

  String _extractErrorMessage(dynamic e) {
    try {
      if (e is DioError) {
        return e.response?.data['message'] ?? e.message;
      }
      return e.toString().replaceAll('Exception: ', '');
    } catch (_) {
      return e.toString();
    }
  }

  void resetMessages() {
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }
}
