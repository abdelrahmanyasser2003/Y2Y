import 'dart:developer';
import 'package:y2y/core/networking/dio_helper.dart';  // إذا كنت تستخدم Dio Helper
import 'package:y2y/core/networking/api_endpoints.dart';

class ForgotPasswordApiServices {
  Future<bool> forgotPassword({
    required String email,
  }) async {
    Map<String, dynamic> requestData = {
      'email': email,
    };

    log('📤 طلب إعادة تعيين كلمة المرور: $requestData');

    try {
      var response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.forgerPasswordEndpoint, // أو endpoint السيرفر المخصص لإعادة تعيين كلمة المرور
        data: requestData,
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          log('✅ تم إرسال طلب إعادة تعيين كلمة المرور بنجاح: ${response.data}');
          return true;  // تم إرسال الطلب بنجاح
        } else {
          log('❌ فشل في إرسال طلب إعادة تعيين كلمة المرور، كود الاستجابة: ${response.statusCode}');
          return false;  // فشل في إرسال الطلب
        }
      } else {
        log('❌ استجابة غير صالحة من الخادم');
        return false;  // فشل في الاتصال بالخادم
      }
    } catch (e) {
      log('⚠️ خطأ أثناء إرسال طلب إعادة تعيين كلمة المرور: ${e.toString()}');
      return false;  // حدث خطأ أثناء الاتصال بالخادم
    }
  }
}
