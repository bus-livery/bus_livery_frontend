import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/di/injection.dart';

@lazySingleton
class ReviewService {
  final InAppReview _inAppReview = InAppReview.instance;
  static const String _lastReviewRequestKey = 'last_review_request';
  static const int _minDaysBetweenReviews =
      10; // Minimum days between review requests

  // Check if the app is available for review
  Future<bool> isAvailableForReview() async {
    try {
      return await _inAppReview.isAvailable();
    } catch (e) {
      customPrint('Error checking review availability: $e');
      return false;
    }
  }

  // Request review if enough time has passed since the last request
  Future<void> requestReviewIfAppropriate() async {
    final prefs = getIt<SharedPrefService>();
    try {
      // Check if enough time has passed since last review request
      final lastReviewRequest = prefs.getInt(_lastReviewRequestKey) ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;
      final daysSinceLastRequest =
          (now - lastReviewRequest) / (1000 * 60 * 60 * 24);

      if (daysSinceLastRequest >= _minDaysBetweenReviews) {
        if (await isAvailableForReview()) {
          await _inAppReview.requestReview();
          // Save the current timestamp
          await prefs.saveInt(_lastReviewRequestKey, now);
        }
      }
    } catch (e) {
      customPrint('Error requesting review: $e');
    }
  }

  // Open the store listing page
  Future<void> openStoreListing() async {
    try {
      await _inAppReview.openStoreListing();
    } catch (e) {
      customPrint('Error opening store listing: $e');
    }
  }
}
