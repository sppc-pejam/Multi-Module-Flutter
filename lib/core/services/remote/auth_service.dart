import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String loginUrl = 'https://example.com/api/login'; // URL لاگین
  final storage = FlutterSecureStorage(); // برای ذخیره امن توکن

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['token']; // فرض بر این است که پاسخ شامل توکن JWT است.
      // ذخیره توکن
      await storage.write(key: 'jwt_token', value: token);
      return token;
    } else {
      throw Exception('Login failed');
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token'); // حذف توکن هنگام خروج
  }
}
