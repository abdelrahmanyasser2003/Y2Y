import 'dart:io';

class BecomeVolunteerModel {
  final File frontIdCardImage;
  final File backIdCardImage;
  final String education;
  final List<String> skills;

  BecomeVolunteerModel({
    required this.frontIdCardImage,
    required this.backIdCardImage,
    required this.education,
    required this.skills,
  });

  Map<String, dynamic> toMap() {
    return {
      'frontIdCardImage': frontIdCardImage,
      'backIdCardImage': backIdCardImage,
      'education': education,
      'skills': skills,
    };
  }
}
