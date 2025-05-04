import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class LeaveCommunityRepo {
  Future<bool> leaveCommunity(String communityId) async {
    try {
      final token = await StorageHelper().getToken();

      if (token == null || token.isEmpty) {
        print('❌ Token is invalid');
        return false;
      }

      print('📤 Sending leave request for community ID: $communityId');

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.getALLCommunitiesEndpoint}/${ApiEndpoints.leaveCommuntiyEndpoint}/$communityId',
        data: {}, // لو الـ API ما يحتاجش بيانات في الـ body
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('✅ Left community successfully: ${response.data}');
        return true;
      } else {
        print(
            '❌ Failed to leave: Status Code ${response.statusCode}, Response: ${response.data}');
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        print('❌ DioError: ${e.response?.statusCode}, ${e.response?.data}');
      } else {
        print('❌ Error: $e');
      }
      return false;
    }
  }
}
