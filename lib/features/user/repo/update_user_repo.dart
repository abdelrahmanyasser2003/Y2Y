import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class UpdateUserRepo {
  Future<Map<String, dynamic>> updateUserProfile({
     String? firstName,
     String? lastName,
     Map<String, String>? address,
     String? phone,
     String? bD,
     String? bio,
     String? gender,
     String? userName,
     List<String>? interested,
    File? imageFile,
  }) async {
    try {
      final token = await StorageHelper().getToken();
      
      // إنشاء FormData
      final formData = FormData.fromMap({
        'firstName': firstName,
        'lastName': lastName,
        'address': jsonEncode(address), // تحويل الـ Map إلى JSON string
        'phone': phone,
        'BD': bD,
        'bio': bio,
        'gender': gender,
        'userName': userName,
        'interested': jsonEncode(interested), // تحويل الـ List إلى JSON string
        if (imageFile != null) 'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
          contentType: MediaType('image', 'jpg')
        ),
      });

      final response = await DioHelper().puttRequest(
        endPoint: ApiEndpoints.userEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': response.data,
        };
      } else {
        throw Exception('فشل في التحديث: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ خطأ في تحديث الملف الشخصي: $e');
      rethrow;
    }
  }

  // دالة لتحديث حقل واحد فقط
  Future<void> updateSingleField({
    required String fieldName,
    required dynamic fieldValue,
  }) async {
    try {
      final token = await StorageHelper().getToken();
      
      final formData = FormData.fromMap({
        fieldName: fieldValue is Map || fieldValue is List
            ? jsonEncode(fieldValue)
            : fieldValue.toString(),
      });

      await DioHelper().puttRequest(
        endPoint: ApiEndpoints.userEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
    } catch (e) {
      print('❌ خطأ في تحديث الحقل $fieldName: $e');
      rethrow;
    }
  }
}