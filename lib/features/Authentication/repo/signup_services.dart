import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'dart:developer';

class SignUpServices {
  Future<void> sendSignData({
    required String firstName,
    required String lastName,
    required String state,
    required String city,
    required String street,
    required String phone,
    required String gender,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> requestData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'address': {
        'state': state,
        'city': city,
        'street': street,
      },
      'phone': phone,
      'gender': gender,
    };

    log('🔹 بيانات التسجيل المرسلة: $requestData');

    try {
      var response = await DioHelper().postRequest(
        endPoint: ApiEndpoints.signUpEndpoint,
        data: requestData,
      );

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        log('✅ تم تسجيل المستخدم بنجاح: ${response.data}');
      } else if (response?.statusCode == 409) {
        log('⚠️ هذا البريد الإلكتروني مستخدم من قبل.');
      } else {
        log('❌ فشل في تسجيل المستخدم، كود الاستجابة: ${response?.statusCode}');
      }
    } catch (e) {
      log('⚠️ خطأ أثناء تسجيل المستخدم: ${e.toString()}');
    }
  }
}
