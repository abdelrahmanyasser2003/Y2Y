import 'package:y2y/features/user/models/user_model.dart';

class ProfileModel {
  final String name;
  final String phone;
  final String email;
  final String street;
  final String city;
  final String state;
  final String gender;

  ProfileModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.street,
    required this.city,
    required this.state,
    required this.gender,
  });

  // تحويل البيانات من UserModel إلى ProfileModel
  factory ProfileModel.fromUserModel(UserModel userModel) {
    return ProfileModel(
      name: '${userModel.firstName} ${userModel.lastName}', // دمج الاسم الأول والأخير
      phone: userModel.phone ?? '',
      email: userModel.email ?? '',
      street: userModel.address?.street ?? '',
      city: userModel.address?.city ?? '',
      state: userModel.address?.state ?? '',
      gender: userModel.gender ?? '',
    );
  }

  // دالة لتحويل JSON إلى ProfileModel
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: '${json['firstName']} ${json['lastName']}', // دمج الاسم الأول والأخير من JSON
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      street: json['address']?['street'] ?? '',
      city: json['address']?['city'] ?? '',
      state: json['address']?['state'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  // تحويل ProfileModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': name.split(' ')[0], // الجزء الأول من الاسم
      'lastName': name.split(' ').length > 1 ? name.split(' ')[1] : '', // الجزء الثاني من الاسم
      'phone': phone,
      'email': email,
      'address': {
        'street': street,
        'city': city,
        'state': state,
      },
      'gender': gender,
    };
  }
}
