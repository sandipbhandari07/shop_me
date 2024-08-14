import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://localhost/ims/api';
  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/customer/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      await storage.write(key: 'token', value: data['token']);
      return {'success': true, 'data': data};
    } else {
      var errorData = json.decode(response.body);
      return {'success': false, 'message': errorData['message'] ?? 'Login failed'};
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      await storage.write(key: 'token', value: data['token']);
      return {'success': true, 'data': data};
    } else {
      var errorData = json.decode(response.body);
      return {'success': false, 'message': errorData['message'] ?? 'Registration failed'};
    }
  }
}
