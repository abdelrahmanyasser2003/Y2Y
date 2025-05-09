import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class UpdateCommunityRepo {
  Future<String?> updateCommunity({
    required String communityId,
    String? name,
    List<String>? types,
    String? desc,
    String? category,
    String? subcategory,
    int? limitOfUsers,
    String? roles,
    Map<String, String>? location,
    Map<String, dynamic>? date,
    File? imagePath,
  }) async {
    final formData = FormData();

    if (name != null) formData.fields.add(MapEntry('name', name));
    if (types != null) {
      formData.fields.add(MapEntry('types', jsonEncode(types)));
    }
    if (desc != null) formData.fields.add(MapEntry('desc', desc));
    if (category != null) formData.fields.add(MapEntry('category', category));
    if (subcategory != null) {
      formData.fields.add(MapEntry('subcategory', subcategory));
    }
    if (limitOfUsers != null) {
      formData.fields.add(MapEntry('limitOfUsers', limitOfUsers.toString()));
    }
    if (roles != null) formData.fields.add(MapEntry('roles', roles));
    if (location != null) {
      formData.fields.add(MapEntry('location', jsonEncode(location)));
    }
    if (date != null) formData.fields.add(MapEntry('date', jsonEncode(date)));
    if (imagePath != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(imagePath.path,
            filename: 'update.jpeg', contentType: MediaType('image', 'jpg')),
      ));
    }

    try {
      final token = await StorageHelper().getToken();

      final response = await DioHelper().puttRequest(
        endPoint: '${ApiEndpoints.getALLCommunitiesEndpoint}/$communityId',
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
        return 'حدث خطأ أثناء تعديل المجتمع. كود: ${response.statusCode}';
      }
    } catch (e) {
      return 'فشل في تعديل المجتمع: ${e.toString()}';
    }
  }
}
