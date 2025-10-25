import 'package:e_commerce/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cartController.dart';
// import 'cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    const Color purpleColor = Color(0xFF9C27B0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.toNamed('/main_view'),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Cart Items List ---
                  ...controller.cartItems.map((item) => _buildCartItemCard(item, controller)).toList(),

                  const SizedBox(height: 15),

                  // --- Delivery Address ---
                  _buildInfoRow(
                    title: 'Delivery Address',
                    detailWidget: _buildAddressDetail(controller.addressList.first),
                    onTap: () {
                      Get.toNamed('/address_view');
                    },
                  ),

                  const SizedBox(height: 15),

                  // --- Payment Method ---
                  _buildInfoRow(
                    title: 'Payment Method',
                    detailWidget: _buildPaymentDetail(controller.paymentList.first),
                    onTap: () {
                      Get.toNamed('/payment_screen');
                    },
                  ),

                  const SizedBox(height: 25),

                  // --- Order Info & Summary ---
                  _buildOrderInfo(controller),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // --- Checkout Button (Bottom Fixed Area) ---
          _buildCheckoutFooter(controller, purpleColor),
        ],
      )),
    );
  }

  // --- Widget Builders ---

  Widget _buildCartItemCard(CartItem item, CartController controller) {
    // Obx here listens only to the item's quantity change, but the main build
    // method's Obx handles removal/addition of items to the list.
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.shopping_bag_outlined)),
              ),
            ),
            const SizedBox(width: 10),

            // Details and Quantity Control
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${item.price.toStringAsFixed(2)} (-\$${item.tax.toStringAsFixed(2)} Tax)',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Control
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Decrement
                            IconButton(
                              onPressed: () => controller.decrementQuantity(item),
                              icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            // Quantity Value (Reactive)
                            Obx(() => Text(
                              '${item.quantity.value}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )),
                            // Increment
                            IconButton(
                              onPressed: () => controller.incrementQuantity(item),
                              icon: const Icon(Icons.keyboard_arrow_up, size: 20),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ),

                      // Delete Icon
                      IconButton(
                        onPressed: () => controller.removeItem(item.id),
                        icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 24),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String title, required Widget detailWidget, required VoidCallback onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        detailWidget,
      ],
    );
  }

  Widget _buildAddressDetail(Address address) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.location_on_outlined, color: Colors.deepOrange),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address.name, style: const TextStyle(fontSize: 15)),
                Text(address.details, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Icon(Icons.check_circle, color: Colors.green, size: 24),
      ],
    );
  }

  Widget _buildPaymentDetail(PaymentMethod method) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text('VISA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10))),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(method.name, style: const TextStyle(fontSize: 15)),
                Text('**** ${method.lastFour}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Icon(Icons.check_circle, color: Colors.green, size: 24),
      ],
    );
  }

  Widget _buildOrderInfo(CartController controller) {
    Widget _buildSummaryRow(String title, double amount) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 15, color: Colors.grey.shade700)),
            Text('\$${amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 15)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Order Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),

        // Subtotal (Reactive)
        Obx(() => _buildSummaryRow('Subtotal', controller.subtotal)),

        // Shipping Cost (Reactive)
        Obx(() => _buildSummaryRow('Shipping cost', controller.shippingCost.value)),

        // Total (Reactive)
        const Divider(height: 20, thickness: 1, color: Colors.grey),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('\$${controller.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        )),
      ],
    );
  }

  Widget _buildCheckoutFooter(CartController controller, Color purpleColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius:5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: CustomButton(lebel: "Checkout", onPressed: controller.checkout,)


      // ElevatedButton(
      //   onPressed:
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: purpleColor,
      //     minimumSize: const Size(double.infinity, 55),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //   ),
      //   child: const Text(
      //     'Checkout',
      //     style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
      //   ),
      // ),
    );
  }
}