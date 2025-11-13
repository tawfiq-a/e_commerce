

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddCardController extends GetxController {
  // --- Payment Method Selection State ---
  final selectedMethod = 'card'.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  // --- Form Field States (For demonstration/data storage) ---
  final cardOwner = ''.obs;
  final cardNumber = ''.obs;
  final expDate = ''.obs;
  final cvv = ''.obs;



  void addCard() {
    // Basic Validation
    if (cardOwner.isEmpty || cardNumber.isEmpty || expDate.isEmpty || cvv.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all card details.',
        backgroundColor: Colors.red.shade100,
      );
      return;
    }

    // Process the data
    print('Selected Method: ${selectedMethod.value}');
    print('Card Owner: ${cardOwner.value}');
    print('Card Number: ${cardNumber.value}');

    // Show success message and navigate back
    Get.snackbar(
      'Success!',
      'New card added successfully.',
      backgroundColor: Colors.green.shade100,
    );
    // Get.back(); // Uncomment to return to the previous screen after success
  }
}