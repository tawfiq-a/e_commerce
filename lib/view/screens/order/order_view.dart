import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- Data Models (For Clean Code) ---

class OrderItem {
  final String id;
  final String name;
  final String brand;
  final String price;
  final String imageUrl;
  final int quantity;
  final OrderStatus status;

  const OrderItem({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.status,
  });
}

enum OrderStatus { completed, toReceive }


class OrderController extends GetxController {

  final List<OrderItem> allOrders = const [

    OrderItem(
      id: 'c1',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      price: '\$45',
      imageUrl: 'assets/images/as.png',
      quantity: 1,
      status: OrderStatus.completed,
    ),
    OrderItem(
      id: 'c2',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      price: '\$45',
      imageUrl: 'assets/images/as.png',
      quantity: 1,
      status: OrderStatus.completed,
    ),
    // To Received Orders (Screen 33)
    OrderItem(
      id: 'r1',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      price: '\$45',
      imageUrl: 'assets/images/as.png',
      quantity: 1,
      status: OrderStatus.toReceive,
    ),
    OrderItem(
      id: 'r2',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      price: '\$45',
      imageUrl: 'assets/images/as.png',
      quantity: 1,
      status: OrderStatus.toReceive,
    ),
  ];

  List<OrderItem> get completedOrders =>
      allOrders.where((item) => item.status == OrderStatus.completed).toList();

  List<OrderItem> get toReceiveOrders =>
      allOrders.where((item) => item.status == OrderStatus.toReceive).toList();
}

// ---  The Main View with TabBar ---

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {

    final OrderController controller = Get.put(OrderController());

    //  DefaultTabController for TabBar setup
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          title: const Text('Order', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // TabBar to switch between views
              child: TabBar(
                indicatorColor: const Color(0xFF9386E8),
                labelColor: const Color(0xFF9386E8),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'Completed'),
                  Tab(text: 'To received'),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [

            _OrderList(
              orders: controller.completedOrders,
              status: OrderStatus.completed,
            ),

            _OrderList(
              orders: controller.toReceiveOrders,
              status: OrderStatus.toReceive,
            ),
          ],
        ),
      ),
    );
  }
}

// ---  Widget for displaying the list of orders ---

class _OrderList extends StatelessWidget {
  final List<OrderItem> orders;
  final OrderStatus status;

  const _OrderList({required this.orders, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: _OrderItemCard(order: order, status: status),
        );
      },
    );
  }
}

// ---  Reusable Card Widget for a single order item ---

class _OrderItemCard extends StatelessWidget {
  final OrderItem order;
  final OrderStatus status;

  const _OrderItemCard({required this.order, required this.status});

  @override
  Widget build(BuildContext context) {

    final String buttonText =
    status == OrderStatus.completed ? 'Buy Again' : 'Cancel';
    final Color buttonColor = const Color(0xFF9386E8);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),

            ),
            child: Image.asset(
              order.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  order.brand,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  order.price,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Button and Quantity Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Text
                    Text(
                      'Qty: ${order.quantity}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    // Action Button
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Buy Again or Cancel logic here
                          if (status == OrderStatus.completed) {

                            Get.toNamed('/main_view', arguments: order.id);
                          } else {

                            //  controller.cancelOrder(order.id);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: buttonColor,
                          elevation: 0,
                          side: BorderSide(color: buttonColor, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}