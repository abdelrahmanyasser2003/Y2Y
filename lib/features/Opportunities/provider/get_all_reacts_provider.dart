import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/repo/get_all_reacts_repo.dart';
import 'package:y2y/features/Opportunities/repo/make_react_repo.dart';

class GetAllReactsProvider with ChangeNotifier {
  final GetAllReactsRepo _repo = GetAllReactsRepo();

  List<React> _reacts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<React> get reacts => _reacts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// ✅ تعديل: الدالة بترجع List<React> بدل void
  Future<List<React>?> fetchReacts(String opportunityId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reacts = (await _repo.fetchReacts(opportunityId))!;
      return _reacts;
    } catch (e) {
      _errorMessage = e.toString();
      _reacts = [];
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> makeReact(String opportunityId, String reactType) async {
    try {
      await MakeReactRepo().makeReact(opportunityId, reactType);
      await fetchReacts(opportunityId); // تحدث الأرقام بعد الريأكت
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
