import 'dart:io';
import 'package:flutter/material.dart';
import 'package:y2y/features/Opportunities/repo/opportunity_repo.dart';

class CreateOpportunityProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> createOpportunity({
    required String title,
    required String deadline,
    required String description,
    required String company,
    required String responsibilities,
    required String requirements,
    required String duration,
    required String link,
    required File imageFile,  // تم تعديل النوع هنا إلى File
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await createOpportunityRepo(
        title: title,
        deadline: deadline,
        description: description,
        company: company,
        responsibilities: responsibilities,
        requirements: requirements,
        duration: duration,
        link: link,
        imageFile: imageFile, // تمرير الـ File هنا
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
