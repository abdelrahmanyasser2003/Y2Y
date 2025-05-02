import 'package:dio/dio.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/core/networking/api_endpoints.dart';

class LogoutRepo {
  final StorageHelper _storage = StorageHelper();

  Future<bool> logout() async {
    try {
      final token = await _storage.getToken();

      if (token == null || token.isEmpty) return false;

      final response = await DioHelper().putRequest(
        endPoint: ApiEndpoints.logoutEndpoint,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        await _storage.removeToken(); // ✅ حذف التوكن بعد النجاح
        return true;
      } else {
        print("❌ Logout failed: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("❌ Logout error: $e");
      return false;
    }
  }
}
