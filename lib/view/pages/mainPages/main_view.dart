import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/main_controller.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final MainController controller = Get.put(MainController());

    // Get.put(MainController());

    return Scaffold(
      // Obx: selectedIndex পরিবর্তন হলে স্ক্রিন পরিবর্তন হবে
      body: Obx(
            () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple.shade400,
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: true, // লেবেল দেখাতে চাইলে true করুন
          showUnselectedLabels: false,

          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex, // controller-এর পদ্ধতি কল করা হচ্ছে

          items: const <BottomNavigationBarItem>[
            // Home Tab (Index 0)
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            // Wishlist Tab (Index 1)
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            // Cart Tab (Index 2)
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}