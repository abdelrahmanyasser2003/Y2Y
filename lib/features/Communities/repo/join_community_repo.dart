import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class JoinCommunityRepo {
  Future<String> sendRequestToCommunity(
      String communityId, BuildContext context) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.getALLCommunitiesEndpoint}/${ApiEndpoints.joinRequestCommuntiyCommunitiesEndpoint}/$communityId',
        data: {},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');

      if (response.data['success'] == true) {
        print('✔️ الطلب تم بنجاح');
        final message = response.data['message'] ?? 'الطلب تم بنجاح';
        showAnimatedSnackDialog(
          context,
          type: AnimatedSnackBarType.success,
          message: message,
        );
        return message; // ✅ رجع الرسالة هنا
      } else {
        print('❌ فشل في إرسال الطلب');
        final message = response.data['message'] ?? 'فشل في إرسال الطلب';
        showAnimatedSnackDialog(
          context,
          type: AnimatedSnackBarType.error,
          message: message,
        );
        return message; // ✅ رجع الرسالة هنا
      }
    } catch (e) {
      String errorMessage = 'فشل في إرسال الطلب';
      if (e is DioException) {
        print('❌ DioException: ${e.response?.statusCode}');
        print('❌ DioError message: ${e.message}');
        print('❌ DioError response: ${e.response?.data}');

        if (e.response != null) {
          print('📦 نوع الداتا: ${e.response?.data.runtimeType}');
        }

        if (e.response != null && e.response?.data is Map<String, dynamic>) {
          errorMessage = (e.response?.data['message']) ?? 'خطأ غير متوقع';
        } else {
          if (e.response?.data != null) {
            errorMessage = e.response!.data.toString();
          } else {
            errorMessage = 'خطأ غير متوقع';
          }
        }
      } else {
        print('❌ Unknown error: $e');
      }

      showAnimatedSnackDialog(
        context,
        type: AnimatedSnackBarType.error,
        message: errorMessage,
      );
      return errorMessage;
    }
  }
}
