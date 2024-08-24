import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wucommerce/config/config.dart';

class AuthService {
  static final _storage = FlutterSecureStorage();

  static Future<String?> register(
      String name,
      String email,
      String phone,
      String password,
      String passwordConfirmation,
      ) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/customer/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = responseData['token'];
        if (token != null) {
          await _storage.write(key: 'token', value: token);
        }
        return 'Registration successful';
      } else if (response.statusCode == 422) {
        return responseData['errors'].toString();
      } else {
        return 'Error: ${responseData['message']}';
      }
    } catch (e) {
      return 'An unexpected error occurred: $e';
    }
  }

  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/customer/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _storage.write(key: 'token', value: responseData['token']);
        return 'Login successful';
      } else if (response.statusCode == 401) {
        return 'Invalid email or password';
      } else {
        return 'An error occurred: ${responseData['message']}';
      }
    } catch (e) {
      return 'An unexpected error occurred: $e';
    }
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  static Future<void> clearToken() async {
    try {
      await _storage.delete(key: 'token');
    } catch (e) {
      print('An error occurred while clearing the token: $e');
    }
  }


  static Future<Map<String, dynamic>?> fetchProfileData() async {
    try {
      final token = await getToken();
      if (token == null) {
        return null;
      }

      final response = await http.get(
        Uri.parse('$apiUrl/customer/profile'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        print('Error fetching profile data: ${responseData['message']}');
        return null;
      }
    } catch (e) {
      print('An unexpected error occurred while fetching profile data: $e');
      return null;
    }
  }


}
