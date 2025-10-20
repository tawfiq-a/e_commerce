import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/pages/mainPages/home_view.dart';


class MainController extends GetxController {
  // 0.obs - Home, 1.obs - Wishlist, 2.obs - Cart
  var selectedIndex = 0.obs;


  final List<Widget> screens = [
    const HomeView(), // 0
    const WishlistView(), // 1
    const CartView(), // 2
  ];

  // tab index change
  void changeTabIndex(int index) {
    if (index >= 0 && index < screens.length) {
      selectedIndex.value = index;
    }
  }
}


class WishlistView extends StatelessWidget {
  const WishlistView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Wishlist Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Cart Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}