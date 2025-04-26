import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class GetAllCommunitiesOfSpecificSubcategory {
  Future<List<dynamic>> getcommunities(String subcategoryId) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint: "${ApiEndpoints.getALLCommunitiesEndpoint}/$subcategoryId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['data'] ?? []; // إرجاع الكوميونتيز إذا كانت موجودة
      } else {
        print('❌ Error: Response status code ${response.statusCode}');
        throw Exception('فشل في جلب البيانات');
      }
    } catch (e) {
      print('❌ Error while fetching communities: $e');
      throw Exception('فشل في جلب البيانات');
    }
  }
}
