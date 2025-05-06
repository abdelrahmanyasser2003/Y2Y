import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class DeleteCommunityRepo {
    Future<bool> deleteCommunity(String communityId) async {
    try {
      final token = await StorageHelper().getToken();

      final response = await DioHelper().deleteRequest(
        endPoint:
            "${ApiEndpoints.getALLCommunitiesEndpoint}/$communityId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        

        print('Community deleted successfully.');
        return true; // إرجاع قيمة تدل على النجاح
      } else {
        print('Failed to delete: ${response.statusCode}');
        return false; // إرجاع قيمة تدل على الفشل
      }
    } catch (e) {
      print('Error deleting Community: $e');
      return false; // إرجاع قيمة تدل على حدوث خطأ
    }
  }
}