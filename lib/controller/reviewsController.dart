import 'package:get/get.dart';


import '../view/screens/review/add_review.dart';

// Dummy Review Model
class Review {
  final String name;
  final String date;
  final String content;
  final double rating;
  final String avatarPath;

  Review({
    required this.name,
    required this.date,
    required this.content,
    required this.rating,
    required this.avatarPath,
  });
}

class ReviewsController extends GetxController {
  // --- Reactive State ---
  final isLoading = false.obs;
  final totalReviews = 245.obs;

  // Observable list of reviews
  final reviewList = <Review>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    _fetchReviews();
  }

  // --- Logic/Data Fetching ---
  void _fetchReviews() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Placeholder data matching the names in your image
    reviewList.value = [
      Review(
        name: 'Jenny Wilson',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/jenny.png', // Placeholder
      ),
      Review(
        name: 'Ronald Richards',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/ronald.png', // Placeholder
      ),
      Review(
        name: 'Guy Hawkins',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/guy.png', // Placeholder
      ),
      Review(
        name: 'Savannah Nguyen',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/savannah.png', // Placeholder
      ),
    ];
    isLoading.value = false;
  }

  void addReview() {
    // Navigate to the add review screen
    Get.to(() => const AddReview());
    // In a real app, this would open a modal/new screen to submit a review
    Get.snackbar(
        'Feature Not Yet Implemented',
        'Tapping "Add Review" would open a submission form.',
        snackPosition: SnackPosition.BOTTOM
    );
  }
}