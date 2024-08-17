import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static final _storage = FlutterSecureStorage();

  static Future<String?> register(String name, String email, String password, String passwordConfirmation) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/ims/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return 'Registration successful';
      } else if (response.statusCode == 422) {
        return responseData['errors'].toString();
      } else {
        return 'An error occurred: ${responseData['message']}';
      }
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }

  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/ims/api/login'),
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
      return 'An unexpected error occurred';
    }
  }
}
