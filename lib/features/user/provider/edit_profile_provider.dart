import 'package:flutter/material.dart';

class EditProfileProvider with ChangeNotifier {
  String name = "";
  String subname = "";
  String email = "";
  String phone = "";
  String gender = "";
  String street = "";
  String state = "";
  String city = "";
  String bio = "";
  String education = "";
  String skill = "";
  String dateOfBirth = "";
  String imgpath = ""; // تغيير إلى String بدلاً من Uint8List

  // Method to set the profile data (used when the user signs up or logs in)
  void loginData({
    required String newName,
    required String newEmail,
    required String newPhone,
    required String newGender,
    required String newStreet,
    required String newState,
    required String newCity,
  }) {
    name = newName;
    email = newEmail;
    phone = newPhone;
    gender = newGender;
    street = newStreet;
    state = newState;
    city = newCity;

    notifyListeners();
  }

  // Method to update the profile data (used when editing the profile)
  void setUpProfile({
    required String newsubName,
    required String newBio,
    required String newEducation,
    required String newSkill,
    required String newDateOfBirth,
    required String newImgpath, // تغيير إلى String
  }) {
    subname = newsubName;

    bio = newBio;
    education = newEducation;
    skill = newSkill;
    dateOfBirth = newDateOfBirth;
    imgpath = newImgpath; // قبول المسار كـ String
    notifyListeners();
  }

  void updateProfile({
    required String newName,
    required String newSubName,
    required String newGender,
    required String newStreet,
    required String newState,
    required String newCity,
    required String newBio,
    required String newEducation,
    required String newSkill,
    required String newDateOfBirth,
    required String newImgpath, // تغيير إلى String
  }) {
    name = newName;
    subname = newSubName;

    gender = newGender;
    street = newStreet;
    state = newState;
    city = newCity;
    bio = newBio;
    education = newEducation;
    skill = newSkill;
    dateOfBirth = newDateOfBirth;
    imgpath = newImgpath; // قبول المسار كـ String
    notifyListeners();
  }
}
