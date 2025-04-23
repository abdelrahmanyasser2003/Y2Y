import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class LoginApiServices {
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    try {
      var response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.logINEndpoint,
        data: loginData,
      );

      if (response != null && response.statusCode == 200) {
        final responseData = response.data;

        // ✅ التوكن موجود مباشرة في الـ response
        final token = responseData['token'];

        if (token == null || token.isEmpty) {
          print("❌ التوكن غير موجود أو فارغ");
          return false;
        }

        print("🪪 التوكن: $token");

        // حفظ التوكن
        final storage = StorageHelper();
        await storage.saveToken(token);

        print("✅ تم تخزين التوكن بنجاح");

        return true;
      } else {
        print("❌ فشل في تسجيل الدخول: ${response?.statusMessage}");
        return false;
      }
    } catch (e) {
      print("❌ حدث خطأ أثناء تسجيل الدخول: $e");
      return false;
    }
  }
}
