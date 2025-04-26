import 'package:flutter/material.dart';
import 'package:y2y/features/Search/repo/get_all_subcategories_repo.dart';

class GetAllSubcategoriesProvider with ChangeNotifier {
  final GetAllSubcategoriesRepo _service = GetAllSubcategoriesRepo();

  List<dynamic> _subcategories = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<dynamic> get subcategories => _subcategories;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchSubcategories(String categoryId) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      // استدعاء خدمة الـ Repo لجلب البيانات
      _subcategories = await _service.getSubcategories(categoryId);
    } catch (e) {
      _hasError = true;
      print('❌ Error in fetchSubcategories: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
