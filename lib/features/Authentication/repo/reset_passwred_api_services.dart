import 'dart:developer';
import 'package:y2y/core/networking/dio_helper.dart';  // إذا كنت تستخدم Dio Helper
import 'package:y2y/core/networking/api_endpoints.dart';

class ResetPasswordApiServices {
  Future<bool> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
    required String otp,  // OTP (رمز التحقق)
  }) async {
    Map<String, dynamic> requestData = {
      'email': email,
      'password': newPassword,
      'repassword': confirmPassword,
      'OTP': otp,  // الـ OTP
    };

    log('📤 طلب إعادة تعيين كلمة المرور: $requestData');

    try {
      var response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.resetPasswordEndpoint, // endpoint السيرفر المخصص لإعادة تعيين كلمة المرور
        data: requestData,
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          log('✅ تم إعادة تعيين كلمة المرور بنجاح: ${response.data}');
          return true;  // تم إعادة تعيين كلمة المرور بنجاح
        } else {
          log('❌ فشل في إعادة تعيين كلمة المرور، كود الاستجابة: ${response.statusCode}');
          return false;  // فشل في إعادة تعيين كلمة المرور
        }
      } else {
        log('❌ استجابة غير صالحة من الخادم');
        return false;  // فشل في الاتصال بالخادم
      }
    } catch (e) {
      log('⚠️ خطأ أثناء إعادة تعيين كلمة المرور: ${e.toString()}');
      return false;  // حدث خطأ أثناء الاتصال بالخادم
    }
  }
}
