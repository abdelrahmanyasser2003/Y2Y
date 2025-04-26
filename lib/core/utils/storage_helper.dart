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

  // حفظ الريأكت
  Future<void> saveUserReact(String opportunityId, String react) async {
    await storage.write(key: 'react_$opportunityId', value: react);
  }

  // جلب الريأكت
  Future<String?> getUserReact(String opportunityId) async {
    return await storage.read(key: 'react_$opportunityId');
  }

  // حذف الريأكت
  Future<void> removeUserReact(String opportunityId) async {
    await storage.delete(key: 'react_$opportunityId');
  }

  // حفظ اللون
  Future<void> saveUserReactColor(String opportunityId, String color) async {
    await storage.write(key: 'reactColor_$opportunityId', value: color);
  }

  // جلب اللون
  Future<String?> getUserReactColor(String opportunityId) async {
    return await storage.read(key: 'reactColor_$opportunityId');
  }

  // حذف اللون
  Future<void> removeUserReactColor(String opportunityId) async {
    await storage.delete(key: 'reactColor_$opportunityId');
  }

  Future<void> saveData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeData({required String key}) async {
    await storage.delete(key: key);
  }
}
