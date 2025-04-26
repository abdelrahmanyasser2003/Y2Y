import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/repo/make_react_repo.dart';

class MakeReactProvider with ChangeNotifier {
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, List<React>> opportunityReacts = {};

  Future<bool> makeOrRemoveReact(String opportunityId, String reactType) async {
    try {
      _isLoading = true;
      notifyListeners();

      bool success = false;

      if (opportunityReacts.containsKey(opportunityId)) {
        final reacts = opportunityReacts[opportunityId]!;

        final existingReact = reacts.firstWhere(
          (react) => react.user == 'userId' && react.react == reactType,
          orElse: () => React(user: '', react: ''),
        );

        if (existingReact.user!.isNotEmpty) {
          // حذف الريأكت
          success = await MakeReactRepo().makeReact(opportunityId, '');
          if (success) {
            reacts.removeWhere(
              (react) => react.user == 'userId' && react.react == reactType,
            );
            opportunityReacts[opportunityId] = reacts;
          }
        } else {
          // إضافة رياكت جديد
          success = await MakeReactRepo().makeReact(opportunityId, reactType);
          if (success) {
            reacts.add(React(user: 'userId', react: reactType));
            opportunityReacts[opportunityId] = reacts;
          }
        }
      } else {
        // إضافة أول رياكت على الفرصة دي
        success = await MakeReactRepo().makeReact(opportunityId, reactType);
        if (success) {
          opportunityReacts[opportunityId] = [React(user: 'userId', react: reactType)];
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
}
