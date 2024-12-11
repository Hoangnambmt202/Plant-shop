import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/product.dart';

class CartProvider extends StateNotifier<List<Product>> {
  CartProvider() : super([]);
  bool isLoading = false;

  final String _baseUrl = "http://127.0.0.1:8000/api/v1";

  // Getter tính tổng tiền của giỏ hàng
  double get totalAmount {
    return state.fold(
      0,
      (sum, item) => sum + (item.price * (item.quantity ?? 1)),
    );
  }

  // Hàm tải giỏ hàng
  Future<void> loadCart() async {
    isLoading = true;

    try {
      final headers = await _getHeaders();
      final response =
          await http.get(Uri.parse('$_baseUrl/cart'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['data'] != null) {
          state = (data['data'] as List)
              .map<Product>((json) => Product.fromJson(json))
              .toList();
        }
      } else {
        print('Failed to load cart: ${response.statusCode}');
        state = [];
      }
    } catch (e) {
      print('Error loading cart: $e');
      state = [];
    } finally {
      isLoading = false;
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<bool> addToCart(Product product) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse('$_baseUrl/cart/add'),
        headers: headers,
        body: json.encode(
            {'product_id': product.id, 'quantity': product.quantity ?? 1}),
      );

      if (response.statusCode == 200) {
        state = [
          ...state.where((item) => item.id != product.id),
          product.copyWith(quantity: product.quantity ?? 1),
        ];
        return true;
      }
      return false;
    } catch (e) {
      print('Error adding to cart: $e');
      return false;
    }
  }

  Future<bool> removeFromCart(Product product) async {
    try {
      final headers = await _getHeaders();
      final response = await http
          .delete(Uri.parse('$_baseUrl/cart/${product.id}'), headers: headers);

      if (response.statusCode == 200) {
        state = state.where((item) => item.id != product.id).toList();
        return true;
      }
      return false;
    } catch (e) {
      print('Error removing from cart: $e');
      return false;
    }
  }

  // Cập nhật số lượng sản phẩm trong giỏ hàng
  void updateQuantity(Product product, int quantity) {
    state = state.map((item) {
      if (item.id == product.id) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
  }
}

final cartProvider = StateNotifierProvider<CartProvider, List<Product>>((ref) {
  return CartProvider();
});
