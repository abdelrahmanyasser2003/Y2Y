import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class HandleJoinRequestRepo {
  Future<bool> handleJoinRequest({
    required String communityId,
    required String userId,
    required String status, // "accepted" أو "rejected"
  }) async {
    try {
      final token = await StorageHelper().getToken();

      if (token == null || token.isEmpty) {
        print('❌ Token is missing or invalid');
        return false;
      }

      print(
          '📤 Sending join request with status "$status" for user: $userId in community: $communityId');

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.getALLCommunitiesEndpoint}/${ApiEndpoints.handleJoinRequestEndpoint}/$communityId',
        data: {
          "user": userId,
          "status": status,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('✅ Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('🎉 Join request updated successfully: ${response.data}');
        return true;
      } else {
        print(
            '❌ Failed: Status Code ${response.statusCode}, Data: ${response.data}');
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        print('❌ DioException: ${e.response?.statusCode}, ${e.response?.data}');
      } else {
        print('❌ Unexpected error: $e');
      }
      return false;
    }
  }
}
