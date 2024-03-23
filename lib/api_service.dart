import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3000'; // Use 'localhost' for emulator or '10.0.2.2' for Android emulator to connect to your local machine
  final Logger logger = Logger();

  Future<bool> signUp(String email, String username, String password) async {
    final Uri url = Uri.parse('$baseUrl/signup');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        logger.d('Signup successful');
        return true;
      } else {
        logger.w('Failed to sign up: ${response.body}');
        return false;
      }
    } catch (e) {
      logger.e('Exception during signup: $e');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final Uri url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        logger.d('Login successful');
        return true;
      } else {
        logger.w('Login failed: ${response.body}');
        return false;
      }
    } catch (e) {
      logger.e('Exception during login: $e');
      return false;
    }
  }
}
