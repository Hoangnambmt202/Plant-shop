// lib/providers/favorite_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>(
  (ref) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<List<Product>> {
  FavoriteNotifier() : super([]);

  bool isFavorite(Product product) {
    return state.any((p) => p.id == product.id);
  }

  void addFavorite(Product product) {
    if (!isFavorite(product)) {
      state = [...state, product];
    }
  }

  void removeFavorite(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      removeFavorite(product);
    } else {
      addFavorite(product);
    }
  }
}
