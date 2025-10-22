import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddReviewController extends GetxController {
  // --- Reactive State ---
  final rating = 0.0.obs; // Tracks the star rating slider value
  final isLoading = false.obs;

  // --- Input Controllers ---
  final nameController = TextEditingController();
  final experienceController = TextEditingController();

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    experienceController.dispose();
    super.onClose();
  }

  // --- Logic ---

  // Method to handle rating slider changes
  void updateRating(double newRating) {
    rating.value = newRating;
  }

  // Method to handle form submission
  void submitReview() async {
    // Simple validation
    if (nameController.text.isEmpty || experienceController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in your name and experience.', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (rating.value == 0.0) {
      Get.snackbar('Error', 'Please provide a star rating.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Start loading
    isLoading.value = true;

    // Simulate API submission
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Show success message and navigate back
    Get.snackbar(
      'Success!',
      'Thank you for your ${rating.value} star review!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.purple,
      colorText: Colors.white,
    );
    // You would typically navigate back to the Reviews list after successful submission
    // Get.back();
  }
}