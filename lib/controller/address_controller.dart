import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressFormController extends GetxController {
  final country = 'Bangladesh'.obs;
  final city = 'Sylhet'.obs;
  final phoneNumber = '+880 1453-987533'.obs;
  final addressDetails = 'Chhatak, Sunamgonj 12/BAB'.obs;
  final isPrimary = true.obs;

  void saveAddress() {
    Get.snackbar(
      'Address Saved',
      'Address details updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.purple,
      colorText: Colors.white,
    );
    // In a real app call an API here.
    // Get.back(); // Go back to the previous screen (CartView)
  }
}