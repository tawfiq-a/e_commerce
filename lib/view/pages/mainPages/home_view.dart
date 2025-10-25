// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../../helpers/brand_chip.dart';
// import '../../../helpers/section_header.dart';
// import 'main_view.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//
//               Align(
//                 alignment: Alignment.centerLeft,
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                    const Text(
//                             'Hello',
//                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                             ),
//                             const Text(
//                               'Welcome to Laza.',
//                            style: TextStyle(fontSize: 16, color: Colors.grey),
//                           ),],
//
//                 ),
//               ),
//               // ---  Greeting and Subtitle ---
//
//
//               const SizedBox(height: 25),
//
//               // --- Search Bar
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search',
//                           border: InputBorder.none,
//                           prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.purple.shade400,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: SvgPicture.asset(
//                       'assets/icons/voice.svg',
//                       width: 15,
//                       height: 14,
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 30),
//               BrandChip(),
//
//                SizedBox(height: 30),
//
//                SectionHeader(title: 'New Arrival', subTitle: 'View All', onTap: () {}),
//                SizedBox(height: 15),
//
//               // Product Grid View
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//                 childAspectRatio: 0.65,
//                 children: const [
//                   _ProductCard(
//                     name: 'Nike Sportswear Club \n Fleece',
//                     price: '\$89',
//                     image: Image(image: AssetImage("assets/images/as.png"),height: 210,width: 170,fit: BoxFit.fill),
//                   ),
//                   _ProductCard(
//                     name: 'Trail Running Jacket Nike Windrunner',
//                     price: '\$99',
//                     image: Image(image: AssetImage("assets/images/product2.png"),height: 213,width: 170,fit: BoxFit.fill),
//                   ),
//                   _ProductCard(
//                     name: 'Another Product Title',
//                     price: '\$75',
//                     image: Image(image: AssetImage("assets/images/product3.png"),height: 213,width: 170,fit: BoxFit.fill),
//                   ),
//                   _ProductCard(
//                     name: 'Last Item in New Arrival',
//                     price: '\$110',
//                     image: Image(image: AssetImage("assets/images/product4.png"),height: 213,width: 170,fit: BoxFit.fill),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _appBar() {
//     return AppBar(
//       leading: InkWell(
//         onTap: () {
//           scaffoldKey.currentState!.openDrawer();
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: CircleAvatar(
//             backgroundColor: Color(0xffF5F6FA),
//             child: SvgPicture.asset("assets/icons/menu.svg"),
//           ),
//         ),
//       ),
//
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: CircleAvatar(
//             backgroundColor: Color(0xffF5F6FA),
//             child: SvgPicture.asset("assets/icons/cart.svg"),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // -----------------------------------------------------------------------------
// // --- Helper Widgets ---
// // ------------------------------------------------------------------
//
// class _ProductCard extends StatelessWidget {
//   final String name;
//   final String price;
//   // final Function onTap;
//   // final Color color;
//
//   final Image image; // Placeholder color for the image area
//   const _ProductCard({
//     required this.name,
//     required this.price,
//     required this.image,
//     // required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: InkWell(
//         onTap: () {
//           Get.toNamed("/product_view");
//         },
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Expanded(
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(1
//                     ),
//                     child: image,
//                   ),
//
//                   // Heart Icon (Favorite Button)
//                   Positioned(
//                     top: 20,
//                     right: 20,
//                     child: SvgPicture.asset(
//                       'assets/icons/fav.svg',
//                       width: 24,
//                       height: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // --- Product Details ---
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     price,
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/wishListController.dart';
import '../../../helpers/brand_chip.dart';
import '../../../helpers/section_header.dart';
import '../../base/custom_drawer.dart';
import 'main_view.dart';

import '../../../models/product.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();




class HomeView extends StatelessWidget {
     HomeView({super.key});

  // 3. Instantiate the WishlistController using Get.put
  final WishlistController wishlistController = Get.put(WishlistController());

  // 4. Define product data using the Product model
  final List<Product> newArrivalProducts = const [
    Product(
      id: 'p1', // Important: Unique ID for each product
      name: 'Nike Sportswear Club \n Fleece',
      price: '\$89',
      image: Image(image: AssetImage("assets/images/as.png"), height: 210, width: 170, fit: BoxFit.fill),
    ),
    Product(
      id: 'p2',
      name: 'Trail Running Jacket Nike Windrunner',
      price: '\$99',
      image: Image(image: AssetImage("assets/images/product2.png"), height: 213, width: 170, fit: BoxFit.fill),
    ),
    Product(
      id: 'p3',
      name: 'Another Product Title',
      price: '\$75',
      image: Image(image: AssetImage("assets/images/product3.png"), height: 213, width: 170, fit: BoxFit.fill),
    ),
    Product(
      id: 'p4',
      name: 'Last Item in New Arrival',
      price: '\$110',
      image: Image(image: AssetImage("assets/images/product4.png"), height: 213, width: 170, fit: BoxFit.fill),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: CustomDrawer(),
      key: scaffoldKey,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Welcome to Laza.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),],
                ),
              ),

              const SizedBox(height: 25),

              // --- Search Bar (Existing Code)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/voice.svg',
                        width: 15,
                        height: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              BrandChip(),

              const SizedBox(height: 30),

              SectionHeader(title: 'New Arrival', subTitle: 'View All', onTap: () {}),
              const SizedBox(height: 15),

              // 5. Product Grid View - Switched to GridView.builder
              GridView.builder(
                itemCount: newArrivalProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = newArrivalProducts[index];
                  // Pass the Product object to the card
                  return _ProductCard(
                    product: product,
                    wishlistController: wishlistController,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: InkWell(
        onTap: () {

          if (scaffoldKey.currentState != null) {
            scaffoldKey.currentState!.openDrawer();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: const Color(0xffF5F6FA),
            child: SvgPicture.asset("assets/icons/menu.svg"),
          ),
        ),
      ),

      actions: [
        InkWell(
          onTap: () {
            Get.toNamed("/cart_view");
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: const Color(0xffF5F6FA),
              child: SvgPicture.asset("assets/icons/cart.svg"),
            ),
          ),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// --- Helper Widgets ---
// ------------------------------------------------------------------

class _ProductCard extends StatelessWidget {
  // 6. Update properties to use Product model and Controller
  final Product product;
  final WishlistController wishlistController;

  const _ProductCard({
    required this.product,
    required this.wishlistController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed("/product_view"); // Card tap still navigates to product detail
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: product.image, // Use image from the Product model
                  ),

                  // 7. Heart Icon (Favorite Button) - The Key Change
                  Positioned(
                    top: 20,
                    right: 20,
                    // Use Obx to reactively listen to changes in the wishlist
                    child: Obx(() {
                      final isFavorite = wishlistController.isProductInWishlist(product);
                      return GestureDetector(
                        onTap: () {
                          // Toggle logic: add if not present, remove if present
                          wishlistController.toggleWishlist(product);
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: Icon(
                            // Show filled heart if favorite, outlined if not
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey.shade600,
                            size: 16,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            // --- Product Details ---
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
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






