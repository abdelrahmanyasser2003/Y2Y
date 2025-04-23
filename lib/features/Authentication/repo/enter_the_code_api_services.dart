import 'dart:developer';
import 'package:y2y/core/networking/dio_helper.dart';  // إذا كنت تستخدم Dio Helper
import 'package:y2y/core/networking/api_endpoints.dart';

class EnterTheCodeApiServices {
  Future<bool> verifyCode({
    required String email,
    required String otp,
  }) async {
    Map<String, dynamic> requestData = {
      'email': email,
      'OTP': otp,
    };

    log('📤 طلب التحقق من الكود: $requestData');

    try {
      var response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.enterTheCodeEndpoint, // أو endpoint السيرفر المخصص للتحقق من الكود
        data: requestData,
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          log('✅ تم التحقق من الكود بنجاح: ${response.data}');
          return true;  // تم التحقق بنجاح
        } else {
          log('❌ فشل في التحقق من الكود، كود الاستجابة: ${response.statusCode}');
          return false;  // فشل في التحقق
        }
      } else {
        log('❌ استجابة غير صالحة من الخادم');
        return false;  // فشل في الاتصال بالخادم
      }
    } catch (e) {
      log('⚠️ خطأ أثناء التحقق من الكود: ${e.toString()}');
      return false;  // حدث خطأ أثناء الاتصال بالخادم
    }
  }
}
