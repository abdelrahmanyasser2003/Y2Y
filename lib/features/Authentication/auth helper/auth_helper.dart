import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:y2y/core/utils/storage_helper.dart';

class AuthHelper {
  static Future<String> getUserIdFromToken() async {
    String? token = await StorageHelper().getData(key: 'token');
    if (token == null) return '';

    Map<String, dynamic> payload = JwtDecoder.decode(token);
    return payload['id'] ?? ''; // حسب المفتاح اللي جوا التوكن
  }
}
