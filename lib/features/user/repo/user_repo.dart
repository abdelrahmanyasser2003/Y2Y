import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/user/models/user_model.dart';

class UserRepo {
  // دالة لجلب بيانات البروفايل
  Future<UserModel> getProfileData() async {
    try {
      // الحصول على التوكن من التخزين
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      // تنفيذ طلب GET عبر DioHelper
      final response = await DioHelper().getRequest(
        endPoint: ApiEndpoints.userEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print('📥 بيانات البروفايل: ${response.data}');

        // تحويل الريسبونس إلى موديل User
        final user = User.fromJson(response.data);

        if (user.data != null) {
          return user.data!;
        } else {
          throw Exception('لا توجد بيانات مستخدم في الريسبونس');
        }
      } else {
        throw Exception('فشل في جلب البيانات: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ خطأ أثناء جلب بيانات البروفايل: $e');
      throw Exception('فشل في جلب بيانات البروفايل');
    }
  }
}
