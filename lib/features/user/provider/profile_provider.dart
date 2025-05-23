import 'package:flutter/material.dart';
import 'package:y2y/features/user/models/profile_model.dart';



class ProfileProvider extends ChangeNotifier {
  String _name = "";
  String _phone = "";
  String _email = "";
  String _street = "";
  String _city = "";
  String _state = "";
  String _gender = "";

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get gender => _gender;
  String get city => _city;
  String get street => _street;
  String get state => _state;

  void updateProfile(ProfileModel newProfile) {
    _name = newProfile.name;
    _email = newProfile.email;
    _phone = newProfile.phone;
    _gender = newProfile.gender;
    _city = newProfile.city;
    _street = newProfile.street;
    _state = newProfile.state;

    notifyListeners();
  }

  void updateProfilee({
    required String newName,
    required String newEmail,
    required String newPhone,
    required String newGender,
    required String newCity,
    required String newStreet,
    required String newState,
  }) {
    _name = newName;
    _email = newEmail;
    _phone = newPhone;
    _gender = newGender;
    _city = newCity;
    _street = newStreet;
    _state = newState;

    notifyListeners(); // إشعار التغيير في البيانات
  }
}
