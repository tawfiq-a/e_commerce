import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/Cart_view/cart_view.dart';
import '../view/screens/mainPages/home_view.dart';
import '../view/screens/mainPages/wish_list.dart';


class MainController extends GetxController {

  var selectedIndex = 0.obs;


  final List<Widget> screens = [
     HomeView(),
    const WishlistView(),
    const CartView(),
  ];

  // tab index change
  void changeTabIndex(int index) {
    if (index >= 0 && index < screens.length) {
      selectedIndex.value = index;
    }
  }
}


// class WishlistView extends StatelessWidget {
//   const WishlistView({super.key});
//   @override
//   Widget build(BuildContext context) => const Center(child: Text('Wishlist Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
// }

// class CartView extends StatelessWidget {
//   const CartView({super.key});
//   @override
//   Widget build(BuildContext context) => const Center(child: Text('Cart Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
// }