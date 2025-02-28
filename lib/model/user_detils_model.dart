import 'dart:typed_data';

class UserDetilsModel {
  Uint8List imagepath;
  String userNameModel;
  String dateModel;
  String educationModel;
  String skillModel;
  String bioModel;
  UserDetilsModel(
      {required this.imagepath,
      required this.userNameModel,
      required this.dateModel,
      required this.educationModel,
      required this.skillModel,
      required this.bioModel});
}
