
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/profile/edit_profile.dart';

class UserController extends GetxController {

  final name = 'Zakaria Rabby'.obs;
  final email = 'name@example.com'.obs;
  final phoneNumber = '0123654789'.obs;
  final country = 'Bangladesh'.obs;
  final city = 'Sylhet'.obs;
  final address = 'Chhatak, Sunamgonj 12/8AB'.obs;
  final profileImageUrl = 'assets/images/user_profile.png'.obs;


  final isEditing = false.obs;

  // --- TextEditingControllers for the Edit Form ---
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController addressController;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with current reactive data
    nameController = TextEditingController(text: name.value);
    emailController = TextEditingController(text: email.value);
    phoneController = TextEditingController(text: phoneNumber.value);
    countryController = TextEditingController(text: country.value);
    cityController = TextEditingController(text: city.value);
    addressController = TextEditingController(text: address.value);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void openEditView() {
    // Before opening the edit view, ensure controllers have the latest data
    nameController.text = name.value;
    emailController.text = email.value;
    // ... update all controllers

    // Navigate to the separate edit view
    Get.to(() => const EditProfile());
  }

  void saveChanges() {
    // Update reactive data from form controllers
    name.value = nameController.text;
    email.value = emailController.text;
    phoneNumber.value = phoneController.text;
    country.value = countryController.text;
    city.value = cityController.text;
    address.value = addressController.text;


    Get.back(); // Close the edit screen
    Get.snackbar('Success', 'Profile information saved!',
        backgroundColor: Colors.green.shade100);
  }
}