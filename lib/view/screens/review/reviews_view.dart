import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reviewsController.dart';


class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ReviewsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Header Row
            _buildHeaderRow(controller),

            // Separator
            const Divider(height: 1, thickness: 0.5, color: Colors.grey),

            // Reviews List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: controller.reviewList.length,
                itemBuilder: (context, index) {
                  return _buildReviewItem(controller.reviewList[index]);
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  // --- Widget Builders ---

  Widget _buildHeaderRow(ReviewsController controller) {

    const Color buttonColor = Color(0xFFFF7D48);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Obx(() => Row(
            children: [
              Text(
                '${controller.totalReviews.value} Reviews',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              _buildStarRating(4.5, size: 16),
            ],
          )),

          // Add Review Button
          ElevatedButton.icon(
            onPressed: controller.addReview,
            icon: const Icon(Icons.edit_note, color: Colors.white, size: 20),
            label: const Text('Add Review', style: TextStyle(color: Colors.white, fontSize: 14)),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Review review) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer Info and Rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,

                backgroundColor: Colors.grey.shade300,

              ),
              const SizedBox(width: 10),

              // Name and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          review.date,
                          style: const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${review.rating.toStringAsFixed(1)} rating',
                    style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  _buildStarRating(review.rating, size: 16),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),


          Text(
            review.content,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700, height: 1.4),
          ),
        ],
      ),
    );
  }

  // Helper to build star icons
  Widget _buildStarRating(double rating, {required double size}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        IconData icon;
        Color color;
        if (index < rating.floor()) {
          icon = Icons.star;
          color = Colors.orange;
        } else if (index < rating) {
          icon = Icons.star_half;
          color = Colors.orange;
        } else {
          icon = Icons.star_border;
          color = Colors.orange;
        }
        return Icon(icon, size: size, color: color);
      }),
    );
  }
}