import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class UpdateUserRepo {
  Future<void> updateUserDetails({
    required String firstName,
    required String lastName,
    required String email,
    required Map<String, String> address,
    required String phone,
    required String bD,
    required String bio,
    required String gender,
    required String userName,
    required List<dynamic> interested,
  }) async {
    try {
      final token = await StorageHelper().getToken();

      final response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.userEndpoint, // ✏️ Endpoint الخاص بالتحديث
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "address": address,
          "phone": phone,
          "BD": bD,
          "bio": bio,
          "gender": gender,
          "userName": userName,
          "interested": interested,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('✅ تم تحديث البيانات بنجاح');
      } else {
        throw Exception('فشل في تحديث البيانات');
      }
    } catch (e) {
      print('❌ Error: $e');
      throw Exception('فشل في تحديث البيانات');
    }
  }
}
