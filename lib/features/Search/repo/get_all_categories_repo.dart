import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Search/models/category_model.dart';
import 'package:y2y/features/Search/models/get_all_categories_model';

class GetAllCategoriesRepo {
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint: ApiEndpoints.getAllCategoriesEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');
      final allCategories = GetAllCategories.fromJson(response.data);
      return allCategories.data ?? [];
    } catch (e) {
      print('❌ Error fetching categories: $e');
      throw Exception('فشل في جلب الكاتيجوريز');
    }
  }
}
