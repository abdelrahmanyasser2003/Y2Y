import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class CreateCommunityRepo {
  Future<String?> createCommunity({
    required String name,
    required List<String> types,
    required String desc,
    required String category,
    required String subcategory,
    required int limitOfUsers,
    required String roles,
    required Map<String, String> location,
    required Map<String, dynamic> date,
    required File imagePath,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'types': jsonEncode(types), // لازم تتحول JSON string
      'desc': desc,
      'category': category,
      'subcategory': subcategory,
      'limitOfUsers': limitOfUsers.toString(),
      'roles': roles,
      'location': jsonEncode(location), // <-- هنا الحل
      'status': 'private',
      'date': jsonEncode(date), // <-- هنا كمان
      'image': await MultipartFile.fromFile(
        imagePath.path,
        filename: 'community.jpg',
        contentType: MediaType('image', 'jpeg'),
      ),
    });

    try {
      final token = await StorageHelper().getToken();
      final response = await DioHelper().posttRequest(
        // التأكد من اسم الميثود
        endPoint:
            ApiEndpoints.getALLCommunitiesEndpoint, // تأكد من المسار الصحيح
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
        return 'حدث خطأ أثناء إنشاء المجتمع. كود: ${response.statusCode}';
      }
    } catch (e) {
      return 'فشل في إنشاء المجتمع: ${e.toString()}';
    }
  }
}
