import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';

import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';

class BecomeVolunteerRepo {
  Future<bool> sendVolunteerRequest(BecomeVolunteerModel model) async {
    try {
      final token = await StorageHelper().getToken();

      if (token == null || token.isEmpty) {
        print('❌ Token is invalid');
        return false;
      }

      final response = await DioHelper().putRequest(
        endPoint:
            '${ApiEndpoints.baseUrl}/${ApiEndpoints.becomeVolunteerEndpoint}',
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Request sent successfully');
        return true;
      } else {
        print('❌ Failed to send request: ${response.data}');
        return false;
      }
    } catch (e) {
      print('❌ Exception: $e');
      return false;
    }
  }
}
