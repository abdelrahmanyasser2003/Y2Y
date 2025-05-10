import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';

class MakeReactRepo {
  // دالة لإضافة أو إزالة التفاعل
  Future<bool> makeReact(String opportunityId, String reactType) async {
    try {
      final token = await StorageHelper().getToken();

      if (token == null || token.isEmpty) {
        print('❌ Token is invalid');
        return false;
      }

      print('✅ Sending $reactType to API for opportunity ID: $opportunityId');

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/${ApiEndpoints.getALLReactsEndpoint}/$opportunityId',
        data: {
          "react": reactType,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('✅ React made successfully: ${response.data}');
        return true;
      } else {
        print(
            '❌ Error: Status Code ${response.statusCode}, Response Data: ${response.data}');
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

  // دالة للحصول على التفاعلات الخاصة بالفرصة
  Future<List<React>?> fetchReacts(String opportunityId) async {
    try {
      final token = await StorageHelper().getToken();

      if (token == null || token.isEmpty) {
        print('❌ Token is invalid');
        return null;
      }

      final response = await DioHelper().getRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/${ApiEndpoints.getALLReactsEndpoint}/$opportunityId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((item) => React.fromJson(item)).toList();
      } else {
        print('❌ Failed to fetch reacts: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ Exception while fetching reacts: $e');
      return null;
    }
  }
}
