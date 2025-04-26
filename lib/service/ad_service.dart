import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/custom_print.dart';

@singleton
class AdService {
  RewardedAd? _rewardedAd;
  InterstitialAd? _interstitialAd;
  bool _isRewardedAdReady = false;
  bool _isInterstitialAdReady = false;
  bool _isFirstDownload = true; // Track if this is the first download

  // Ad unit IDs - replace with your production IDs before release
  static const String rewardedAdUnitId =
      'ca-app-pub-3940256099942544/5224354917'; // Test ID
  static const String interstitialAdUnitId =
      'ca-app-pub-3940256099942544/1033173712'; // Test ID

  // Preference key
  static const String firstDownloadKey = 'first_download_completed';

  // Initialize ads when app starts
  Future<void> initAds() async {
    await MobileAds.instance.initialize();
    await loadRewardedAd();
    await loadInterstitialAd();
  }

  // Load rewarded video ad
  Future<void> loadRewardedAd() async {
    if (_isRewardedAdReady) return;

    try {
      await RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _rewardedAd = ad;
            _isRewardedAdReady = true;

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                _isRewardedAdReady = false;
                ad.dispose();
                loadRewardedAd(); // Load the next ad
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                customPrint('Ad failed to show: ${error.message}');
                _isRewardedAdReady = false;
                ad.dispose();
                loadRewardedAd(); // Try loading another ad
              },
              onAdShowedFullScreenContent: (ad) {
                customPrint('Ad showed fullscreen content.');
              },
              onAdImpression: (ad) {
                customPrint('Ad impression recorded.');
              },
            );
          },
          onAdFailedToLoad: (error) {
            customPrint('Failed to load rewarded ad: ${error.message}');
            _isRewardedAdReady = false;
            // Retry after delay
            Future.delayed(const Duration(minutes: 1), loadRewardedAd);
          },
        ),
      );
    } catch (e) {
      customPrint('Exception while loading rewarded ad: $e');
      _isRewardedAdReady = false;
      // Retry after delay
      Future.delayed(const Duration(minutes: 1), loadRewardedAd);
    }
  }

  // Load interstitial ad
  Future<void> loadInterstitialAd() async {
    if (_isInterstitialAdReady) return;

    try {
      await InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
            _isInterstitialAdReady = true;

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                _isInterstitialAdReady = false;
                ad.dispose();
                loadInterstitialAd(); // Load the next ad
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                customPrint('Interstitial ad failed to show: ${error.message}');
                _isInterstitialAdReady = false;
                ad.dispose();
                loadInterstitialAd(); // Try loading another ad
              },
            );
          },
          onAdFailedToLoad: (error) {
            customPrint('Failed to load interstitial ad: ${error.message}');
            _isInterstitialAdReady = false;
            // Retry after delay
            Future.delayed(const Duration(minutes: 1), loadInterstitialAd);
          },
        ),
      );
    } catch (e) {
      customPrint('Exception while loading interstitial ad: $e');
      _isInterstitialAdReady = false;
    }
  }

  // Check if this is the first download (should show rewarded ad)
  bool isFirstDownload() {
    return _isFirstDownload;
  }

  // Show rewarded ad and return whether user should get reward
  Future<bool> showRewardedAd() async {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      await loadRewardedAd();
      if (!_isRewardedAdReady) {
        // If can't load the ad, mark first download complete anyway
        if (_isFirstDownload) {}
        return true; // Let user proceed if ad can't be shown
      }
    }

    bool userRewarded = false;
    try {
      await _rewardedAd!.show(
        onUserEarnedReward: (_, reward) {
          userRewarded = true;
          customPrint('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
    } catch (e) {
      customPrint('Error showing rewarded ad: $e');
      return true; // Let user proceed if ad fails
    }

    _isRewardedAdReady = false;

    // Mark first download as complete after showing rewarded ad
    if (_isFirstDownload) {
      _isFirstDownload = false;
    }

    loadRewardedAd(); // Preload next ad
    return userRewarded;
  }

  // Show interstitial ad for non-first downloads
  Future<void> showInterstitialAd() async {
    if (!_isInterstitialAdReady || _interstitialAd == null) {
      await loadInterstitialAd();
      if (!_isInterstitialAdReady) return;
    }

    try {
      await _interstitialAd!.show();
    } catch (e) {
      customPrint('Error showing interstitial ad: $e');
    }

    _isInterstitialAdReady = false;
    loadInterstitialAd(); // Preload next ad
  }

  void dispose() {
    _rewardedAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd = null;
    _interstitialAd = null;
  }
}
