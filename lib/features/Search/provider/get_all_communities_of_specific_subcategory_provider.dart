import 'package:flutter/cupertino.dart';
import 'package:y2y/features/Search/repo/get_all_communities_of_specific_subcategory.dart';

class GetAllCommunitiesOfSpecificSubcategoryProvider with ChangeNotifier {
  final GetAllCommunitiesOfSpecificSubcategory _service =
      GetAllCommunitiesOfSpecificSubcategory();

  List<dynamic> _comm = [];
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';  // لتخزين رسالة الخطأ

  List<dynamic> get communities => _comm;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;  // للحصول على رسالة الخطأ

  Future<void> fetchCommunitiesBySubcategory(String subcategoryId) async {
    _isLoading = true;
    _hasError = false;
    _errorMessage = '';  // مسح رسالة الخطأ في بداية العملية
    notifyListeners();

    try {
      // استدعاء خدمة الـ Repo لجلب البيانات
      _comm = await _service.getcommunities(subcategoryId);
      if (_comm.isEmpty) {
        _errorMessage = 'لا توجد كوميونتيز لهذه الفئة';
      }
    } catch (e) {
      _hasError = true;
      _errorMessage = '❌ حدث خطأ أثناء جلب الكوميونتيز: $e';
      print('❌ Error in fetchCommunitiesBySubcategory: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
