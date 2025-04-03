import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupApiService {
  final String baseUrl = "http://192.168.1.14:4000/auth";

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String birthDate,
    required String state,
    required String city,
    required String street,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phone": phone,
        "BD": birthDate,
        "address": {
          "state": state,
          "city": city,
          "street": street,
        }
      }),
    );

    return response.statusCode == 201; // 201 = تم التسجيل بنجاح
  }
}
