import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/model/opportnmity_state_model.dart';

class GetUserOpportunitiesRepo {
  Future<List<GetAllOpportunities>> fetchUserOpportunities() async {
    try {
      // الحصول على التوكن
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      // إرسال الطلب باستخدام DioHelper
      final response = await DioHelper().getRequest(
        endPoint:
            '${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/${ApiEndpoints.userEndpoint}', // رابط الـ API لجلب الفرص الخاصة بالمستخدم
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // إضافة التوكن في الهيدر
          },
        ),
      );

      // التحقق من أن الرد هو 200 (OK)
      if (response.statusCode == 200) {
        print('📥 Response Data: ${response.data}');
        // تحويل البيانات إلى موديل UserOpportunity
        final opportunities = OpportnmityStateModel.fromJson(response.data);
        return opportunities.data ?? []; // إرجاع الفرص الخاصة بالمستخدم
      } else {
        // في حالة وجود خطأ في حالة الـ statusCode
        throw Exception('حدث خطأ أثناء جلب الفرص: ${response.statusCode}');
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('❌ Error fetching user opportunities: $e');
      throw Exception('فشل في جلب الفرص الخاصة بالمستخدم');
    }
  }
}
