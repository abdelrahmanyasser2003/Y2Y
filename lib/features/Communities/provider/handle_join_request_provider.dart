import 'package:flutter/material.dart';
import 'package:y2y/features/Communities/repo/handle_join_request_repo.dart';

class HandleJoinRequestProvider extends ChangeNotifier {
  final HandleJoinRequestRepo _repo = HandleJoinRequestRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> handleJoinRequest({
    required String communityId,
    required String userId,
    required String status, // "accepted" أو "rejected"
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final success = await _repo.handleJoinRequest(
      communityId: communityId,
      userId: userId,
      status: status,
    );

    _isLoading = false;
    if (!success) {
      _errorMessage = 'فشل في إرسال الطلب. حاول مرة أخرى.';
    }
    notifyListeners();

    return success;
  }
}
