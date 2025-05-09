import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class UpdateOpportunityRepo {
  Future<String?> updateOpportunity({
    required String opportunityId,
    File? image,
    String? title,
    String? company,
    String? description,
    String? responsibilities,
    String? requirements,
    String? duration,
    String? deadline,
  }) async {
    final formData = FormData();

    if (title != null) {
      formData.fields.add(MapEntry('title', title));
    }
    if (company != null) {
      formData.fields.add(MapEntry('company', company));
    }
    if (description != null) {
      formData.fields.add(MapEntry('description', description));
    }
    if (responsibilities != null) {
      formData.fields.add(MapEntry('responsibilities', responsibilities));
    }
    if (requirements != null) {
      formData.fields.add(MapEntry('requirements', requirements));
    }
    if (duration != null) {
      formData.fields.add(MapEntry('duration', duration));
    }
    if (deadline != null) {
      formData.fields.add(MapEntry('deadline', deadline));
    }

    if (image != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(image.path,
            filename: 'update.jpg', contentType: MediaType('image', 'jpg')),
      ));
    }

    try {
      final token = await StorageHelper().getToken();

      final response = await DioHelper().puttRequest(
        endPoint:
            '${ApiEndpoints.createAndGetALLOpportunitiesEndpoint}/$opportunityId',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null; // ✅ تم التحديث بنجاح
      } else {
        return 'خطأ في التحديث. كود: ${response.statusCode}';
      }
    } catch (e) {
      return 'فشل التحديث: ${e.toString()}';
    }
  }
}
