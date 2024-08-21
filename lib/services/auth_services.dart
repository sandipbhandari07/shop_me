import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class AuthService {
  static const String _baseUrl = "http://192.168.1.68/ims/api";
  static const storage = FlutterSecureStorage();
  static String? username;
  static String? userEmail;

  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/customer/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "success") {
          username = data["data"]["name"];
          userEmail = data["data"]["email"];
          print('Username: $username'); // Debug print
          print('UserEmail: $userEmail'); // Debug print
          return "Login successful";
        } else {
          return data["message"];
        }
      } else {
        return "Something went wrong. Please try again.";
      }
    } on SocketException {
      return "No Internet connection. Please check your network.";
    } on HttpException {
      return "Couldn't connect to the server. Please try again later.";
    } on FormatException {
      return "Bad response format from the server.";
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  static Future<String?> register(String name, String email, String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/customer/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "success") {
          username = data["data"]["name"];
          userEmail = data["data"]["email"];
          print('Username: $username'); // Debug print
          print('UserEmail: $userEmail'); // Debug print
          return "Registration successful";
        } else {
          return data["message"];
        }
      } else {
        return "Something went wrong. Please try again.";
      }
    } on SocketException {
      return "No Internet connection. Please check your network.";
    } on HttpException {
      return "Couldn't connect to the server. Please try again later.";
    } on FormatException {
      return "Bad response format from the server.";
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  static getUsername() {}

  static getUserEmail() {}
}
