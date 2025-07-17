import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/custom_print.dart';

@singleton
class AdService {
  RewardedAd? _rewardedAd;
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;
  bool _hasShownDownloadAd = false;

  // Ad unit IDs - replace with your production IDs before release
  static const String rewardedAdUnitId =
      // 'ca-app-pub-5333475889663851/2733781990';
      'ca-app-pub-3940256099942544/5224354917'; // Test ID

  static const String interstitialAdUnitId =
      // 'ca-app-pub-5333475889663851/6047191107';
      'ca-app-pub-3940256099942544/1033173712'; // Test ID

  static const String bannerAdUnitId =
      // 'ca-app-pub-5333475889663851/3936312322';
      'ca-app-pub-3940256099942544/6300978111'; // Test ID

  // Load interstitial ad
  Future<void> loadInterstitialAd() async {
    if (_isInterstitialAdReady) return;

    try {
      await InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            customPrint('loadInterstitialAd  loaded successfully');

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

  // Show interstitial ad for downloads
  Future<void> showInterstitialAd() async {
    if (_hasShownDownloadAd) {
      return;
    }

    if (!_isInterstitialAdReady || _interstitialAd == null) {
      await loadInterstitialAd();
      if (!_isInterstitialAdReady) return;
    }

    try {
      await _interstitialAd!.show();
      _hasShownDownloadAd = true;
    } catch (e) {
      customPrint('Error showing interstitial ad: $e');
    }

    _isInterstitialAdReady = false;
    loadInterstitialAd();
  }

  void dispose() {
    _rewardedAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd = null;
    _interstitialAd = null;
  }
}
