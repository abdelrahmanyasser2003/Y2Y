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

      // إرسال طلب API لتحديث التفاعل
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
        return true; // العملية نجحت
      } else {
        print(
            '❌ Error: Status Code ${response.statusCode}, Response Data: ${response.data}');
        return false; // العملية فشلت
      }
    } catch (e) {
      if (e is DioException) {
        print('❌ DioError: ${e.response?.statusCode}, ${e.response?.data}');
      } else {
        print('❌ Error: $e');
      }
      return false; // حدث خطأ
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

      print('✅ Fetching reacts for opportunity ID: $opportunityId');

      final response = await DioHelper().getRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/${ApiEndpoints.getALLReactsEndpoint}/$opportunityId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('✅ Reacts fetched successfully: ${response.data}');
        // تحويل البيانات إلى List<React>
        final List<React> reacts = (response.data as List)
            .map((react) => React.fromJson(react))
            .toList();
        return reacts;
      } else {
        print(
            '❌ Error: Status Code ${response.statusCode}, Response Data: ${response.data}');
        return null; // فشل في جلب البيانات
      }
    } catch (e) {
      if (e is DioException) {
        print('❌ DioError: ${e.response?.statusCode}, ${e.response?.data}');
      } else {
        print('❌ Error: $e');
      }
      return null; // حدث خطأ أثناء جلب التفاعلات
    }
  }
}
