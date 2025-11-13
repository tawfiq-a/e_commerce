import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';
import '../../base/custom_button.dart';


class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});
  final controller = Get.put(ProductDetailController());

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
                // Image Header Section
                Stack(
                    children:[
                  _buildImageHeader(imagePath),
                      Positioned(
                        top: 50,
                        left: 20,
                          child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                              child: CircleAvatar(


                                backgroundColor: Colors.white,
                                child: Icon(Icons.arrow_back,color: Colors.black,size: 20,),
                              ),
                          ),
                      ),
                    ]
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      //  Product Name and Price Row
                      _buildNamePriceRow(controller),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Image(
                              image: AssetImage("assets/images/style4.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ]
                      ),

                      // _buildThumbnailRow(imagePath),

                      const SizedBox(height: 25),

                      // Size Selector
                      _buildSizeSelector(controller),

                      const SizedBox(height: 25),

                      //  Description
                      _buildDescription(),

                      const SizedBox(height: 25),

                      //  Reviews Section
                      _buildReviewsSection(),

                      const SizedBox(height: 50),

                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text("Total Price ", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),
                      //           Text("Include VAT,SD ", style: TextStyle(fontSize: 18, color: Colors.black38, fontWeight: FontWeight.w600)),
                      //
                      //
                      //         ],
                      //       ),
                      //       Text("\$125", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),
                      //
                      //     ]
                      //
                      // ),
                      // const SizedBox(height: 25), // Space for the floating total/button
                      //
                      // CustomButton(lebel: "Add to Cart",onPressed: (){
                      //   Get.offAllNamed("/cart_view");
                      // },),
                      const SizedBox(height: 100), // Space for the floating total/button






                    ],
                  ),
                ),
              ],
            ),
          ),



          //  Floating Total Price and Button
          _buildFloatingFooter(controller),
        ],
      ),
    );
  }

  // --- Widget Builders ---

  //  Image Header
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

  //  Product Name and Price Row
  Widget _buildNamePriceRow(ProductDetailController controller) {
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            Obx(() => Text(
              '\$${controller.basePrice.value.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            )),
          ],
        ),
      ],
    );
  }

   // Image Thumbnails
  Widget _buildThumbnailRow(String imagePath) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          for (int i = 0; i < 4; i++)
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: i < 3 ? 10 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: i == 0 ? Colors.black : Colors.transparent,
                  width: 1,
                ),
                color: Colors.grey.shade100,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),

          // Size Guide Text
          const Text('Size Guide', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  // Size Selector
  Widget _buildSizeSelector(ProductDetailController controller) {
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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: controller.selectedSize.value == size
                        ? Border.all(color: Colors.black, width: 1.5)
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

  // Description
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

        // Single Review Card
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
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

  //  Floating Footer
  Widget _buildFloatingFooter(ProductDetailController controller) {

    const Color purpleColor = Color(0xFF9C27B0);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Total Price', style: TextStyle(fontSize: 20, color: Colors.black87)),
                    Text("Include VAT,SD ", style: TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.w600)),
                  ],
                ),
                Obx(() => Text(
                  '\$${controller.totalPrice.toStringAsFixed(0)}', // Display as $125
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
                // Total Price Column



              ],
            ),
            const SizedBox(height: 10),

            CustomButton(
                  lebel: "Add to Cart",
                  onPressed: () {
                    Get.offAllNamed("/cart_view");
                  },
                ),
          ],
        ),
      ),
    );
  }
}