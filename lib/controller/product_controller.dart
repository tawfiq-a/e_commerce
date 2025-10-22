import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  // State variables (Observables)
  final selectedSize = 'M'.obs;
  final basePrice = 120.0.obs;
  final totalTax = 5.0.obs;

  // Computed property for Total Price
  double get totalPrice => basePrice.value + totalTax.value;

  final isLoading = false.obs;

  // Static list for available sizes
  final List<String> availableSizes = ['S', 'M', 'L', 'XL', '2XL'];

  // Logic: Change the selected size
  void changeSize(String size) {
    selectedSize.value = size;
  }

  // Logic: Handle the 'Add to Cart' action
  void addToCart() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    Get.snackbar(
      'Cart Updated',
      '${selectedSize.value} Club Fleece added to your cart!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF9C27B0), // Purple-like color
      colorText: Colors.white,
    );
  }
}