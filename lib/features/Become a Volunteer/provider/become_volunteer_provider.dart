import 'package:flutter/material.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';
import 'package:y2y/features/Become%20a%20Volunteer/repo/become_volunteer_repo.dart';


class BecomeVolunteerProvider with ChangeNotifier {
  final BecomeVolunteerRepo _repo = BecomeVolunteerRepo();

  bool isLoading = false;

  Future<bool> submitVolunteerForm(BecomeVolunteerModel model) async {
    isLoading = true;
    notifyListeners();

    final success = await _repo.sendVolunteerRequest(model);

    isLoading = false;
    notifyListeners();

    return success;
  }
}
