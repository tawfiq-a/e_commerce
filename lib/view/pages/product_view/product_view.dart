import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';
import '../../base/custom_button.dart';
// import 'product_controller.dart'; // Assume the controller is in the same folder

class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {



    const String imagePath = 'assets/images/as.png';


    return Scaffold(
      backgroundColor: Colors.white,
             body:

          Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Image Header Section
                _buildImageHeader(imagePath),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // 2. Product Name and Price Row
                      _buildNamePriceRow(controller),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style1.png"),
                              fit: BoxFit.cover, // Good practice for images
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style2.png"),
                              fit: BoxFit.cover, // Good practice for images
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style3.png"),
                              fit: BoxFit.cover, // Good practice for images
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style4.png"),
                              fit: BoxFit.cover, // Good practice for images
                            ),
                          ),
                        ]
                      ),
                      //
                      // // 3. Image Thumbnails
                      // // _buildThumbnailRow(imagePath),

                      const SizedBox(height: 25),

                      // 4. Size Selector (Reactive)
                      _buildSizeSelector(controller),

                      const SizedBox(height: 25),

                      // 5. Description
                      _buildDescription(),

                      const SizedBox(height: 25),

                      // 6. Reviews Section
                      _buildReviewsSection(),

                      const SizedBox(height: 50), // Space for the floating total/button

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Price ", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),
                                Text("Include VAT,SD ", style: TextStyle(fontSize: 18, color: Colors.black38, fontWeight: FontWeight.w600)),


                              ],
                            ),
                            Text("\$125", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),

                          ]

                      ),
                      const SizedBox(height: 25), // Space for the floating total/button

                      CustomButton(lebel: "Add to Cart",onPressed: (){
                        Get.offAllNamed("/main_view");
                      },),
                      const SizedBox(height: 30), // Space for the floating total/button






                    ],
                  ),
                ),
              ],
            ),
          ),



          // 7. Floating Total Price and Button
          // _buildFloatingFooter(controller),
        ],
      ),
    );
  }

  // --- Widget Builders ---

  // 1. Image Header
  Widget _buildImageHeader(String imagePath) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Stack(
        children: [
          // Main Image Background
          Container(
            color: Colors.grey.shade50,

              child: Image.asset(imagePath, fit: BoxFit.fill, width: double.infinity),
          ),


        ],
      ),
    );
  }

  // 2. Product Name and Price Row
  Widget _buildNamePriceRow(ProductController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Men's Printed Pullover Hoodie",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              "Price",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Nike Club Fleece',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800), // Bolder font
            ),
            Obx(() => Text(
              '\$${controller.basePrice.value.toStringAsFixed(0)}', // Display as $120
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            )),
          ],
        ),
      ],
    );
  }

  // // 3. Image Thumbnails
  Widget _buildThumbnailRow(String imagePath) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Thumbnails (Fixed width and border for selection)
          for (int i = 0; i < 4; i++)
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: i < 3 ? 10 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: i == 0 ? Colors.black : Colors.transparent, // Black border for selected
                  width: 1,
                ),
                color: Colors.grey.shade100,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover), // Placeholder for thumbnails
              ),
            ),

          // Size Guide Text
          const Text('Size Guide', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  // 4. Size Selector (Reactive)
  Widget _buildSizeSelector(ProductController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.availableSizes.length,
            itemBuilder: (context, index) {
              String size = controller.availableSizes[index];
              return Obx(() => GestureDetector(
                onTap: () => controller.changeSize(size),
                child: Container(
                  width: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background is always light grey
                    borderRadius: BorderRadius.circular(10),
                    border: controller.selectedSize.value == size
                        ? Border.all(color: Colors.black, width: 1.5) // Black border for selected
                        : null,
                  ),
                  child: Text(
                    size,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ));
            },
          ),
        ),
      ],
    );
  }

  // 5. Description
  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700, height: 1.5),
            children: <TextSpan>[
              const TextSpan(
                text: 'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with ',
              ),
              TextSpan(
                text: 'Read More..',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 6. Reviews Section
  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            InkWell(

                onTap: () {
                  // Navigate to the reviews view
                  Get.toNamed('/reviews_view');
                },
                child: Text('View All', style: TextStyle(fontSize: 14, color: Colors.grey.shade600))),
          ],
        ),
        const SizedBox(height: 15),

        // Single Review Card (Replicating the visual details)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey, // Placeholder for profile image
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ronald Richards',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('4.8 rating', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(
                                i < 4.8 ? Icons.star : Icons.star_border,
                                color: Colors.orange,
                                size: 14,
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text('13 Sep, 2020', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 5),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 7. Floating Footer (Total Price and Button)
  Widget _buildFloatingFooter(ProductController controller) {
    // The purple color from the image is approximately #9C27B0
    const Color purpleColor = Color(0xFF9C27B0);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100, // Fixed height for a distinct footer
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Total Price Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Total Price', style: TextStyle(fontSize: 14, color: Colors.grey)),
                Obx(() => Text(
                  '\$${controller.totalPrice.toStringAsFixed(0)}', // Display as $125
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
              ],
            ),

            // Add to Cart Button (Reactive)
            Obx(() => ElevatedButton(
              onPressed: controller.addToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: controller.isLoading.value
                  ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
              )
                  : const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )),
          ],
        ),
      ),
    );
  }
}