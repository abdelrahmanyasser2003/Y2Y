import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';

class GetAllReactsRepo {
  Future<List<React>?> fetchReacts(String opportunityId) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/${ApiEndpoints.getALLReactsEndpoint}/$opportunityId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');

      // مباشرة من data إلى List<React>
      final List<dynamic> data = response.data["data"];
      return data.map((json) => React.fromJson(json)).toList();
    } catch (e) {
      print('❌ Error fetching reacts: $e');
      throw Exception('فشل في جلب الريأكتات: $e');
    }
  }
}
