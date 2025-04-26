import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';

class UserDetailsRepo {
  // دالة لجلب تفاصيل المستخدم من الـ API
  Future<UserDetailsModel> getUserDetails() async {
    try {
      final token = await StorageHelper().getToken();
      final response = await DioHelper().getRequest(
        endPoint: ApiEndpoints.userEndpoint, // تأكد من صحة الـ endpoint
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data =
            response.data['data']; // تأكد من أنك تأخذ البيانات من الـ "data"

        // تحويل البيانات إلى نموذج UserDetailsModel
        return UserDetailsModel.fromJson(data);
      } else {
        throw Exception('فشل في تحميل التفاصيل');
      }
    } catch (e) {
      print('❌ Error: $e');
      throw Exception('فشل في جلب البيانات');
    }
  }
}
