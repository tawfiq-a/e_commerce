import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- Models ---
class CartItem {
  final String id;
  final String name;
  final String size;
  final double price;
  final double tax;
  final String imagePath;
  final int maxStock;
  var quantity = 1.obs;

  CartItem({
    required this.id,
    required this.name,
    required this.size,
    required this.price,
    required this.tax,
    required this.imagePath,
    required int initialQuantity,
    required this.maxStock,
  }) {

    quantity.value = initialQuantity > maxStock ? maxStock : initialQuantity;
  }
}

class Address {
  final String name;
  final String details;
  final String city;
  final String iconPath;

  Address({required this.name, required this.details, required this.city, required this.iconPath});
}

class PaymentMethod {
  final String name;
  final String lastFour;
  final String iconPath;

  PaymentMethod({required this.name, required this.lastFour, required this.iconPath});
}


class CartController extends GetxController {

  final cartItems = <CartItem>[].obs;
  final shippingCost = 10.0.obs;
  final selectedAddressIndex = 0.obs;
  final selectedPaymentIndex = 0.obs;

  // --- Data Lists ---
  final addressList = [
    Address(
      name: 'Chhatak, Sunamgonj 12/BAB',
      details: 'Sylhet',
      city: 'Sylhet',
      iconPath: 'assets/icons/location.png',
    )
  ];

  final paymentList = [
    PaymentMethod(
      name: 'Visa Classic',
      lastFour: '7690',
      iconPath: 'assets/icons/visa.png',
    )
  ];

  @override
  void onInit() {
    super.onInit();

    // Updated Cart Items with NEW stock value
    cartItems.addAll([
      CartItem(
        id: 'T1',
        name: "Men's Tie-Dye T-Shirt Nike Sportswear",
        size: 'L',
        price: 45.00,
        tax: 4.00,
        imagePath: 'assets/images/cart1.png',
        initialQuantity: 1,
        maxStock: 5,
      ),
      CartItem(
        id: 'T2',
        name: "Men's Tie-Dye T-Shirt Nike Sportswear",
        size: 'M',
        price: 45.00,
        tax: 4.00,
        imagePath: 'assets/images/cart2.png',
        initialQuantity: 1,
        maxStock: 1,
      ),
      CartItem(
        id: 'T3',
        name: "Unisex Hooded Sweatshirt (OOS)",
        size: 'S',
        price: 60.00,
        tax: 5.00,
        imagePath: 'assets/images/cart1.png',
        initialQuantity: 1,
        maxStock: 5,
      ),
    ]);
  }



  // Calculate Subtotal
  double get subtotal => cartItems.fold(
      0.0, (sum, item) => sum + (item.price * item.quantity.value));

  // Calculate Total
  double get total => subtotal + shippingCost.value;

  // Calculate Total Tax
  double get totalTax => cartItems.fold(
      0.0, (sum, item) => sum + (item.tax * item.quantity.value));


  // --- Logic Methods ---

  // Check stock before incrementing
  void incrementQuantity(CartItem item) {
    if (item.quantity.value < item.maxStock) {
      item.quantity.value++;


    } else {

      Get.snackbar(
        'Stock Limit Reached',
        'You have reached the maximum available stock (${item.maxStock}) for this item.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;

    }
  }

  void removeItem(String itemId) {
    Get.defaultDialog(
        title: 'Remove Item',
        middleText: 'Are you sure you want to remove this item?',

        actions: [
          TextButton(onPressed: (){
            Get.back();
            cartItems.removeWhere((item) => item.id == itemId);
          }, child: const Text("Yes")),
          TextButton(onPressed: (){
            Get.back();
          }, child: const Text("No")),
        ]
    );
  }

  // Checks if the cart contains any item that is entirely out of stock (maxStock == 0)
  bool get hasOutOfStockItems => cartItems.any((item) => item.maxStock == 0);

  void checkout() {

    if (hasOutOfStockItems) {

      Get.snackbar(
        'Cannot Checkout',
        'Please remove all items that are currently out of stock.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.toNamed("/order_confirm");


    Get.snackbar('Checkout', 'Proceeding to payment with Total: \$${total.toStringAsFixed(2)}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.purple,
      colorText: Colors.white,
    );
  }
}