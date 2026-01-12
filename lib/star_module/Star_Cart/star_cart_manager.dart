import 'package:flutter/material.dart';

class StarCartManager {
  static List<Map<String, dynamic>> cartItems = [];

  static ValueNotifier<int> cartCount = ValueNotifier<int>(0);

  static void addToCart(Map<String, dynamic> product, int quantity) {
    cartItems.add({"product": product, "quantity": quantity});

    cartCount.value = cartItems.length;
  }

  static void removeFromCart(int index) {
    cartItems.removeAt(index);
    cartCount.value = cartItems.length;
  }

  static void clearCart() {
    cartItems.clear();
    cartCount.value = 0;
  }
}
