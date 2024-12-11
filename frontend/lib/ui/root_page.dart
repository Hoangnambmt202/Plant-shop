import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/ui/screens/cart_page.dart';
import 'package:frontend/ui/screens/favorite_page.dart';
import 'package:frontend/ui/screens/home_page.dart';
import 'package:frontend/ui/screens/profile_page.dart';
import 'package:frontend/ui/screens/widgets/base_scaff.dart';
import 'package:frontend/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:http/http.dart' as http;

class RootPage extends ConsumerStatefulWidget {
  const RootPage({super.key});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  List<Product> _products = [];
  List<Product> _favorites = [];
  int _selectedIndex = 0;
  bool _isLoading = false;

  final String _baseUrl = "http://127.0.0.1:8000/api/v1";

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(cartProvider.notifier).loadCart();
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);

    try {
      await Future.wait([_loadProducts(), _loadFavoriteProducts()]);
    } catch (e) {
      print('Error loading initial data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['products'] != null) {
          setState(() {
            _products = List<Product>.from(
              data['products'].map((json) => Product.fromJson(json)),
            );
          });
        }
      }
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  Future<void> _loadFavoriteProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/favorites'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['products'] != null) {
          setState(() {
            _favorites = List<Product>.from(
              data['products'].map((json) => Product.fromJson(json)),
            );
          });
        }
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return FavoritePage();
      case 2:
        return const CartPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    final AppBar appBar = AppBar(
      title: Text(
        _selectedIndex == 0
            ? 'Trang chủ'
            : _selectedIndex == 1
                ? 'Yêu thích'
                : _selectedIndex == 2
                    ? 'Giỏ hàng (${cart.length})'
                    : 'Tài khoản',
      ),
      centerTitle: true,
    );

    return BaseScaffold(
      currentIndex: _selectedIndex,
      onIndexChanged: (index) => setState(() => _selectedIndex = index),
      appBar: appBar,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildCurrentPage(),
    );
  }
}
