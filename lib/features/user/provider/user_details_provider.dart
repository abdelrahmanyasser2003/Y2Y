import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';

class UserDetailsProvider extends ChangeNotifier {
  final List<UserDetailsModel> _userdetils = [];
  List<UserDetailsModel> get userdetils => _userdetils;

  void addUserDetils(UserDetailsModel userdetils) {
    _userdetils.add(userdetils);
    notifyListeners();
  }

  void updateProfile({
    required String newName,
    required String newskill,
    required String newedu,
    required String newdate,
    required String newbio,
    required Uint8List newimgpath,
  }) {
    subname = newName;
    skill = newskill;
    edu = newedu;
    date = newdate;
    bio = newbio;
    imgpath = newimgpath;

    notifyListeners(); // هذا سيتسبب في تحديث البيانات في واجهة المستخدم
  }

  String subname = '';
  String skill = '';
  String date = '';
  String edu = '';
  String bio = '';
  Uint8List imgpath = Uint8List(0);
}