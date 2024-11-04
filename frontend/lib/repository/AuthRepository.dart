import 'package:http/http.dart' as http;
import 'package:plant_shoap_app/constant/API_list.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // For storing token securely
import '../model/user.dart';

class AuthRepository {
  final String apiUrlRegister = API_register;
  final String apiUrlLogin = API_login;
  final _storage = const FlutterSecureStorage();

  // Registration function
  Future<void> register(User user) async {
    final response = await http.post(
      Uri.parse(apiUrlRegister),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to register");
    }
  }

  // Login function with token-based authentication
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(apiUrlLogin),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Parse response to get token
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final token = responseBody['token'];

      // Save token securely
      await _storeToken(token);

      return token;
    } else {
      throw Exception("Failed to login");
    }
  }

  // Store token securely using Flutter Secure Storage
  Future<void> _storeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  // Retrieve token securely
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // Logout function to remove token
  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }
}
