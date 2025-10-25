// lib/controllers/add_card_controller.dart

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddCardController extends GetxController {
  // --- Payment Method Selection State ---
  final selectedMethod = 'card'.obs; // 'card', 'paypal', or 'bank'

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  // --- Form Field States (For demonstration/data storage) ---
  final cardOwner = ''.obs;
  final cardNumber = ''.obs;
  final expDate = ''.obs;
  final cvv = ''.obs;

  // You would typically link these to TextEditingControllers in the view,
  // but for simple state management, we'll store the values here.

  void addCard() {
    // 1. Basic Validation (e.g., check if fields are not empty)
    if (cardOwner.isEmpty || cardNumber.isEmpty || expDate.isEmpty || cvv.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all card details.',
        backgroundColor: Colors.red.shade100,
      );
      return;
    }

    // 2. Process the data (e.g., call an API to save the card)
    print('Selected Method: ${selectedMethod.value}');
    print('Card Owner: ${cardOwner.value}');
    print('Card Number: ${cardNumber.value}');

    // 3. Show success message and navigate back
    Get.snackbar(
      'Success!',
      'New card added successfully.',
      backgroundColor: Colors.green.shade100,
    );
    // Get.back(); // Uncomment to return to the previous screen after success
  }
}