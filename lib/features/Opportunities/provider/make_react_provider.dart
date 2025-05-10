import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/repo/make_react_repo.dart';

class MakeReactProvider with ChangeNotifier {
  final MakeReactRepo _reactRepo = MakeReactRepo();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // خريطة تخزن التفاعلات لكل فرصة
  Map<String, List<React>> opportunityReacts = {};
  

  /// 🔁 دالة للتبديل بين تفاعل وإزالته
  Future<bool> makeOrRemoveReact({
    required String opportunityId,
    required String reactType,
    required String userId,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      bool success = false;

      final currentReacts = opportunityReacts[opportunityId] ?? [];

      final existingReact = currentReacts.firstWhere(
        (react) => react.user == userId && react.react == reactType,
        orElse: () => React(user: '', react: ''),
      );

      if (existingReact.user!.isNotEmpty) {
        // ✅ موجود بالفعل، نرسل طلب إزالة
        success = await _reactRepo.makeReact(opportunityId, 'remove');
        if (success) {
          currentReacts.removeWhere(
              (react) => react.user == userId && react.react == reactType);
          opportunityReacts[opportunityId] = currentReacts;
        }
      } else {
        // ➕ نضيف التفاعل
        success = await _reactRepo.makeReact(opportunityId, reactType);
        if (success) {
          currentReacts.add(React(user: userId, react: reactType));
          opportunityReacts[opportunityId] = currentReacts;
        }
      }

      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      print('❌ Error in makeOrRemoveReact: $e');
      return false;
    }
  }

  /// 📥 جلب التفاعلات الخاصة بفرصة واحدة
  Future<void> fetchReacts(String opportunityId) async {
    try {
      final reacts = await _reactRepo.fetchReacts(opportunityId);
      opportunityReacts[opportunityId] = reacts ?? [];
      notifyListeners();
    } catch (e) {
      print('❌ Error fetching reacts: $e');
    }
  }

  /// ℹ️ هل قام المستخدم بهذا التفاعل على الفرصة؟
  bool hasReacted({
    required String opportunityId,
    required String reactType,
    required String userId,
  }) {
    final reacts = opportunityReacts[opportunityId] ?? [];
    return reacts
        .any((react) => react.user == userId && react.react == reactType);
  }
}
