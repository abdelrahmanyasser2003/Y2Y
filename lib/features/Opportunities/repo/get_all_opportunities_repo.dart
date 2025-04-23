import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/model/opportnmity_state_model.dart';

class GetAllOpportunitiesRepo {
  Future<List<GetAllOpportunties>> fetchOpportunities() async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint: ApiEndpoints.createAndGetALLOpportunitiesEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');
      final allCategories = OpportnmityStateModel.fromJson(response.data);
      return allCategories.data ?? [];
    } catch (e) {
      print('❌ Error fetching categories: $e');
      throw Exception('فشل في جلب الكاتيجوريز');
    }
  }
}
