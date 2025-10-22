import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/add_review_controller.dart';
// import 'add_review_controller.dart';

class AddReview extends StatelessWidget {
  const AddReview({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate Controller
    final controller = Get.put(AddReviewController());

    // The purple color used in the image's button and slider
    const Color purpleColor = Color(0xFF9C27B0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Add Review',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Name Input ---
            const Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            _buildInputField(
              controller: controller.nameController,
              hintText: 'Type your name',
              minLines: 1,
            ),

            const SizedBox(height: 25),

            // --- 2. Experience Input (Large Text Area) ---
            const Text('How was your experience ?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            _buildInputField(
              controller: controller.experienceController,
              hintText: 'Describe your experience...',
              minLines: 6,
              maxLines: 6,
            ),

            const SizedBox(height: 35),

            // --- 3. Star Rating Slider ---
            _buildRatingSlider(controller, purpleColor),

            const SizedBox(height: 80),

            // --- 4. Submit Button (Reactive) ---
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.submitReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: controller.isLoading.value
                  ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
              )
                  : const Text(
                'Submit Review',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required int minLines,
    int? maxLines,
  }) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines ?? minLines,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }

  Widget _buildRatingSlider(AddReviewController controller, Color sliderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Star', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

        Obx(() => Row(
          children: [
            Text(
              '${controller.rating.value.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            Expanded(
              child: Slider(
                value: controller.rating.value,
                min: 0.0,
                max: 5.0,
                divisions: 10, // Allows steps of 0.5
                activeColor: sliderColor,
                inactiveColor: Colors.grey.shade300,
                onChanged: controller.updateRating,
              ),
            ),

            const Text('5.0', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        )),
      ],
    );
  }
}