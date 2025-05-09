import 'dart:io';
import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/repo/update_opportunity_repo.dart';


class UpdateOpportunityProvider extends ChangeNotifier {
  final UpdateOpportunityRepo _repo = UpdateOpportunityRepo();

  bool isLoading = false;
  String? error;

  Future<void> updateOpportunity({
    required String opportunityId,
    File? image,
    String? title,
    String? company,
    String? description,
    String? responsibilities,
    String? requirements,
    String? duration,
    String? deadline,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await _repo.updateOpportunity(
      opportunityId: opportunityId,
      image: image,
      title: title,
      company: company,
      description: description,
      responsibilities: responsibilities,
      requirements: requirements,
      duration: duration,
      deadline: deadline,
    );

    isLoading = false;

    if (result == null) {
      onSuccess();
    } else {
      error = result;
    }

    notifyListeners();
  }
}
