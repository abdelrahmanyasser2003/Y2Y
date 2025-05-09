import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';

class BecomeVolunteerRepo {
  Future<String?> becomeVolunteer({
    required BecomeVolunteerModel model,
  }) async {
    final formData = FormData();

    // إضافة الصور
    formData.files.add(MapEntry(
      'frontIdCardImage',
      await MultipartFile.fromFile(model.frontIdCardImage.path, filename: 'frontIdCardImage.jpg'),
    ));
    formData.files.add(MapEntry(
      'backIdCardImage',
      await MultipartFile.fromFile(model.backIdCardImage.path, filename: 'backIdCardImage.jpg'),
    ));

    // إضافة التعليم
    formData.fields.add(MapEntry('education', model.education));

    // إضافة المهارات
    formData.fields.add(MapEntry('skills', jsonEncode(model.skills)));

    try {
      final token = await StorageHelper().getToken();

      final response = await DioHelper().puttRequest(
        endPoint: '${ApiEndpoints.userEndpoint}/${ApiEndpoints.becomeVolunteerEndpoint}',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null; // Success
      } else {
        return 'حدث خطأ أثناء إرسال البيانات. كود: ${response.statusCode}';
      }
    } catch (e) {
      return 'فشل في إرسال البيانات: ${e.toString()}';
    }
  }
}
