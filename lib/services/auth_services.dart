import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class AuthService {
  static const _storage = FlutterSecureStorage();

  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://inventory.anoopinnovations.com/api/customer/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['data']['token'];
        await _storage.write(key: 'auth_token', value: token);

        return 'success';
      } else {
        return 'Login failed: ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String?> register(String name, String email, String phone, String password, String passwordConfirmation) async {
    try {
      final response = await http.post(
        Uri.parse('https://inventory.anoopinnovations.com/api/customer/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['data']['token'];

        // Save the token securely
        await _storage.write(key: 'auth_token', value: token);

        return 'success';
      } else {
        return 'Registration failed: ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<Map<String, dynamic>?> fetchProfile() async {
    try {
      final token = await _storage.read(key: 'auth_token');
      if (token == null) return null;

      final response = await http.get(
        Uri.parse('https://inventory.anoopinnovations.com/api/customer/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data']['user'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  static Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
