import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // حفظ التوكن
  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  // جلب التوكن
  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  // حذف التوكن
  Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }

  Future<void> saveUserId(String userId) async {
    await storage.write(key: 'userId', value: userId);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: 'userId');
  }

  Future<void> clearUserData() async {
    await storage.delete(key: 'userId');
  }
}
