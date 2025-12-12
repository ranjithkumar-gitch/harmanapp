import 'package:flutter/material.dart';

class CartManager {
  static List<Map<String, dynamic>> cartItems = [];

  static void addToCart(Map<String, dynamic> product, int quantity) {
    cartItems.add({"product": product, "quantity": quantity});
  }
}
