
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/wishListController.dart';
import '../../../models/product.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.find<WishlistController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist ❤️'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (wishlistController.wishlistItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                const SizedBox(height: 10),
                Text(
                  'Your Wishlist is Empty!',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Start Shopping'),
                ),
              ],
            ),
          );
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: wishlistController.wishlistItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final product = wishlistController.wishlistItems[index];
              return WishlistItemCard(
                product: product,
                controller: wishlistController,
              );
            },
          );
        }
      }),
    );
  }
}


class WishlistItemCard extends StatelessWidget {
  final Product product;
  final WishlistController controller;

  const WishlistItemCard({
    required this.product,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: product.image,
                ),
                // Remove button instead of favorite button
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      controller.removeFromWishlist(product);
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.close, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}