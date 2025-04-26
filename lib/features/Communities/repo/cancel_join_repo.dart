import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class CancelJoinRepo {
  Future<String> cancelJoinRequest(
      String communityId, BuildContext context) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}${ApiEndpoints.getALLCommunitiesEndpoint}/${ApiEndpoints.cancelJoinCommuntiyCommunitiesEndpoint}/$communityId',
        data: {},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');

      if (response.data['success'] == true) {
        final message = response.data['message'] ?? 'تم إلغاء الطلب بنجاح';
        showAnimatedSnackDialog(
          context,
          type: AnimatedSnackBarType.warning,
          message: message,
        );
        return message;
      } else {
        final message = response.data['message'] ?? 'فشل في إلغاء الطلب';
        showAnimatedSnackDialog(
          context,
          type: AnimatedSnackBarType.error,
          message: message,
        );
        return message;
      }
    } catch (e) {
      String errorMessage = 'فشل في إلغاء الطلب';
      showAnimatedSnackDialog(
        context,
        type: AnimatedSnackBarType.error,
        message: errorMessage,
      );
      return errorMessage;
    }
  }
}
