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

  final isLoading = false.obs;
  final totalReviews = 245.obs;


  final reviewList = <Review>[].obs;

  @override
  void onInit() {
    super.onInit();

    _fetchReviews();
  }

  // --- Logic/Data Fetching ---
  void _fetchReviews() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));


    reviewList.value = [
      Review(
        name: 'Jenny Wilson',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/jenny.png',
      ),
      Review(
        name: 'Ronald Richards',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/ronald.png',
      ),
      Review(
        name: 'Guy Hawkins',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/guy.png',
      ),
      Review(
        name: 'Savannah Nguyen',
        date: '13 Sep, 2020',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        rating: 4.8,
        avatarPath: 'assets/avatars/savannah.png',
      ),
    ];
    isLoading.value = false;
  }

  void addReview() {
    // Navigate to the add review screen
    Get.to(() => const AddReview());

    Get.snackbar(
        'Feature Not Yet Implemented',
        'Tapping "Add Review" would open a submission form.',
        snackPosition: SnackPosition.BOTTOM
    );
  }
}