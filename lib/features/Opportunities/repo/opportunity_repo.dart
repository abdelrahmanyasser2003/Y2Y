import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

Future<void> sendData({
  required String token,
  required String title,
  required String description,
  required String deadline,
  required Uint8List? imageBytes, File? imageFile,
}) async {
  // تحضير البيانات التي سيتم إرسالها في FormData
  final formData = FormData.fromMap({
    'title': title,
    'description': description,
    'deadline': deadline,
    if (imageBytes != null)
      'image': MultipartFile.fromBytes(
        imageBytes,
        filename: 'opportunity.jpg', // اسم افتراضي
        contentType: MediaType('image', 'jpeg'), // تحتاج import http_parser
      ),
  });

  try {
    final token = await StorageHelper().getToken();
    print('🪪 التوكن اللي هيتبعت: Bearer $token');
    // إرسال البيانات باستخدام DioHelper
    final response = await DioHelper().posttRequest(
      endPoint:
          ApiEndpoints.createAndGetALLOpportunitiesEndpoint, // رابط الـ API
      data: formData, // هنا يتم تمرير FormData
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // إضافة التوكين في الهيدر
        },
      ),
    );

    // طباعة الرد إذا تمت العملية بنجاح
    print('تم بنجاح: ${response.data}');
  } catch (e) {
    // التعامل مع الأخطاء
    print('خطأ في الإرسال: $e');
  }
}
