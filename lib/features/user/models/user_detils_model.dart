import 'package:y2y/core/networking/api_endpoints.dart';

class UserDetailsModel {
  final String imagepath;
  final String userNameModel;
  final String dateModel;
  final String educationModel;
  final String skillModel;
  final String bioModel;
  

  UserDetailsModel({
    required this.imagepath,
    required this.userNameModel,
    required this.dateModel,
    required this.educationModel,
    required this.skillModel,
    required this.bioModel,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    final baseUrl = ApiEndpoints.baseUrl; // غيّرها حسب سيرفرك
    final rawImagePath = json['profileImage'] ?? '';
    final fullImagePath = rawImagePath.isNotEmpty
        ? baseUrl + rawImagePath.replaceAll('\\', '/')
        : '';

    return UserDetailsModel(
      imagepath: fullImagePath,
      userNameModel: '${json['firstName']} ${json['lastName']}',
      dateModel: json['createdAt'] ?? '',
      educationModel: json['education'] ?? '',
      skillModel:
          json['skills'] != null ? (json['skills'] as List).join(', ') : '',
      bioModel: json['bioModel'] ?? '',
    );
  }
}
