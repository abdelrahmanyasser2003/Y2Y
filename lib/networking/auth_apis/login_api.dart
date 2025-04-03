import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiService {
  final String baseUrl = "http://localhost:4000/auth";

  Future<String?> login(String email, String password) async {
    final response = await http.put(
      Uri.parse("$baseUrl/signin"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["token"]; // احفظ التوكن لاستخدامه لاحقًا
    } else {
      return null; // تسجيل الدخول فشل
    }
  }
}
