import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';

Future<void> createOpportunityRepo({
  required String title,
  required String deadline,
  required String description,
  required String company,
  required String responsibilities,
  required String requirements,
  required String duration,
  required String link,
  required File imageFile, // تم تعديل نوع المتغير هنا إلى File
}) async {
  try {
    final token = await StorageHelper().getToken();
    print('🪪 التوكن اللي هيتبعت: Bearer $token');

    FormData formData = FormData.fromMap({
      'title': title,
      'deadline': deadline,
      'description': description,
      'company': company,
      'responsibilities': responsibilities,
      'requirements': requirements,
      'duration': duration,
      'link': link,
      'image': await MultipartFile.fromFile(imageFile.path,
          filename: 'opportunity.jpg', contentType: MediaType('image', 'jpeg')),
    });

    final response = await DioHelper().posttRequest(
      endPoint: ApiEndpoints.createAndGetALLOpportunitiesEndpoint,
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    if (response.statusCode == 201) {
      print("✅ Opportunity created successfully");
    } else {
      print("❌ Failed to create opportunity: ${response.statusCode}");
    }
  } catch (e) {
    print("🚨 Error creating opportunity: $e");
    rethrow;
  }
}
