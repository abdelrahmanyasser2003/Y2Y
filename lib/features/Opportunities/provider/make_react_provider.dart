import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/provider/get_all_reacts_provider.dart';
import 'package:y2y/features/Opportunities/repo/make_react_repo.dart';

class MakeReactProvider with ChangeNotifier {
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> makeReact(String opportunityId, String reactType) async {
    try {
      await MakeReactRepo().makeReact(opportunityId, reactType);
      await GetAllReactsProvider()
          .fetchReacts(opportunityId); // تحدث الأرقام بعد الريأكت
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
