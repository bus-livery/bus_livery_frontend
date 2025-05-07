import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ReviewService {
  final InAppReview _inAppReview = InAppReview.instance;
  final SharedPreferences _prefs;
  static const String _lastReviewRequestKey = 'last_review_request';
  static const int _minDaysBetweenReviews =
      10; // Minimum days between review requests

  ReviewService(this._prefs);

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
    try {
      // Check if enough time has passed since last review request
      final lastReviewRequest = _prefs.getInt(_lastReviewRequestKey) ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;
      final daysSinceLastRequest =
          (now - lastReviewRequest) / (1000 * 60 * 60 * 24);

      if (daysSinceLastRequest >= _minDaysBetweenReviews) {
        if (await isAvailableForReview()) {
          await _inAppReview.requestReview();
          // Save the current timestamp
          await _prefs.setInt(_lastReviewRequestKey, now);
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
