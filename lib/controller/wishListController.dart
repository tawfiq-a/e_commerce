// lib/controllers/wishlist_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart'; // Ensure the path is correct

class WishlistController extends GetxController {
  // Use RxList for reactive state management
  final RxList<Product> wishlistItems = <Product>[].obs;

  void toggleWishlist(Product product) {
    if (isProductInWishlist(product)) {
      removeFromWishlist(product);
    } else {
      addToWishlist(product);
    }
  }

  void addToWishlist(Product product) {
    wishlistItems.add(product);
    Get.snackbar(
      "Added to Wishlist ❤️",
      "${product.name} added to your favorites.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.pink.shade50,
    );
  }

  void removeFromWishlist(Product product) {
    wishlistItems.removeWhere((item) => item.id == product.id);
    Get.snackbar(
      "Removed from Wishlist",
      "${product.name} has been removed.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.shade100,
    );
  }

  bool isProductInWishlist(Product product) {
    // Check if any item in the list has the same ID as the product
    return wishlistItems.any((item) => item.id == product.id);
  }
}