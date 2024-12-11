import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/loginProvider.dart';

class OrderService {
  static const String apiUrl = 'http://127.0.0.1:8000/api/v1/order';

  static Future<bool> createOrder(
      WidgetRef ref, Map<String, dynamic> orderData) async {
    try {
      final token = await ref.read(loginProvider.notifier).getToken();

      if (token == null) {
        throw Exception('Token không tồn tại');
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to create order: ${response.body}');
      }
    } catch (e) {
      print('Order Error: $e');
      return false;
    }
  }
}
