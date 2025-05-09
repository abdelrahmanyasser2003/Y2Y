import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:y2y/core/networking/api_endpoints.dart';

class DioHelper {
  static Dio? dio;

  // تأكد من تهيئة Dio في البداية
  static void initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
    required Options? options,
  }) async {
    try {
      // تأكد إن dio متهيئ
      if (dio == null) initDio();

      // تأكد إن endPoint مفيهوش '/' في البداية
      final cleanedEndpoint =
          endPoint.startsWith('/') ? endPoint.substring(1) : endPoint;

      Response response = await dio!.get(
        cleanedEndpoint,
        queryParameters: query,
        options: options,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await dio!.post(endPoint, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  posttRequest({
    required String endPoint,
    required FormData data,
    required Options options,
  }) async {
    try {
      final Response response = await dio!.post(
        endPoint,
        data: data,
        options: options,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final Response response =
          await dio!.put(endPoint, data: data, options: options);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  puttRequest({
    required String endPoint,
    required FormData data,
    Options? options,
  }) async {
    try {
      final Response response =
          await dio!.put(endPoint, data: data, options: options);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final Response response = await dio!.delete(
        endPoint,
        data: data,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
