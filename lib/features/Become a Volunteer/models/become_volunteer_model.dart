class BecomeVolunteerModel {
  final String frontIdCardImage;
  final String backIdCardImage;
  final String education;

  final List<String> skills;

  BecomeVolunteerModel({
    required this.frontIdCardImage,
    required this.backIdCardImage,
    required this.education,
    required this.skills,
  });

  Map<String, dynamic> toJson() {
    return {
      'frontIdCardImage': frontIdCardImage,
      'backIdCardImage': backIdCardImage,
      'education': education,
      'skills': skills,
    };
  }
}
