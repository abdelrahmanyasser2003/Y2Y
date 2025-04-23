import 'package:flutter/material.dart';
import 'package:y2y/features/Search/models/category_model.dart';
import 'package:y2y/features/Search/repo/get_all_categories_repo.dart';

class GetAllCategoriesProvider with ChangeNotifier {
  final GetAllCategoriesRepo _service = GetAllCategoriesRepo();

  bool isLoading = false;
  List<CategoryModel> categories = [];

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      categories = await _service.getAllCategories();
    } catch (e) {
      print('❌ Error in fetchCategories: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
