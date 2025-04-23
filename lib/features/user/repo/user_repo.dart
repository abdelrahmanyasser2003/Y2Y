import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart'; // استيراد DioHelper
import 'package:y2y/core/utils/storage_helper.dart'; // استيراد StorageHelper
import 'package:y2y/features/user/models/profile_model.dart';
import 'package:y2y/features/user/models/user_model.dart'; // استيراد الموديلات

class UserRepo {
  // دالة لجلب بيانات البروفايل
  Future<ProfileModel> getProfileData() async {
    try {
      // الحصول على التوكن من الـ Storage
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      // إرسال طلب GET باستخدام DioHelper
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
        print('📥 Profile Response Data: ${response.data}');

        // تحويل البيانات إلى نموذج User
        final user = User.fromJson(response.data);

        // التحقق من وجود بيانات المستخدم في الاستجابة
        if (user.data != null) {
          // إرجاع بيانات البروفايل باستخدام نموذج ProfileModel
          return ProfileModel.fromUserModel(user.data!);
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
