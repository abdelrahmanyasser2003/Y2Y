import 'package:dio/dio.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/networking/dio_helper.dart';
import 'package:y2y/core/utils/storage_helper.dart';
import 'package:y2y/features/Communities/model/get_spacific_community_model.dart';

class GetSpacificCommunityRepo {
  Future<List<GetSpacificCommunityModel>> getAllCommunities(
      String communityId) async {
    try {
      final token = await StorageHelper().getToken();
      print('🪪 التوكن اللي هيتبعت: Bearer $token');

      final response = await DioHelper().getRequest(
        endPoint:
            '${ApiEndpoints.getALLCommunitiesEndpoint}/${ApiEndpoints.getSpecificCommunitiesEndpoint}/$communityId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('📥 Response Data: ${response.data}');

      final allCommunities = (response.data['data'] as List)
          .map((e) => GetSpacificCommunityModel.fromJson(e))
          .toList();

      return allCommunities;
    } catch (e) {
      print('❌ Error fetching communities: $e');
      throw Exception('فشل في جلب المجتمعات');
    }
  }
}
