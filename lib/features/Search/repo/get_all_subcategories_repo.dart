import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class GetAllSubcategoriesRepo {
  Future<List<dynamic>> getSubcategories(String categoryId) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint: "${ApiEndpoints.getAllSubCategoriesEndpoint}/$categoryId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response.data['data'] ?? [];
    } catch (e) {
      print('❌ Error while fetching subcategories: $e');
      throw Exception('فشل في جلب البيانات');
    }
  }
}