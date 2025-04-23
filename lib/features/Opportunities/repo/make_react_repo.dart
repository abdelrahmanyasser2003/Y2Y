import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class MakeReactRepo {
  Future<void> makeReact(String opportunityId, String reactType) async {
    try {
      final token = await StorageHelper().getToken();

      // التحقق من أن التوكن صالح
      if (token == null || token.isEmpty) {
        print('❌ Token is invalid');
        return;
      }

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

      if (response.statusCode == 200) {
        print('✅ React made successfully: ${response.data}');
      } else {
        print(
            '❌ Error: Status Code ${response.statusCode}, Response Data: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        print('❌ DioError: ${e.response?.statusCode}, ${e.response?.data}');
      } else {
        print('❌ Error: $e');
      }
      rethrow;
    }
  }
}
