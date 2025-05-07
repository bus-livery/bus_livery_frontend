import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:flutter/widgets.dart';

@singleton
class AdService {
  RewardedAd? _rewardedAd;
  InterstitialAd? _interstitialAd;
  BannerAd? _bannerAd;
  bool _isRewardedAdReady = false;
  bool _isInterstitialAdReady = false;
  DateTime? _lastRewardedAdTime;
  static const Duration _rewardedAdInterval = Duration(minutes: 5);

  // Ad unit IDs - replace with your production IDs before release
  static const String rewardedAdUnitId =
      'ca-app-pub-5333475889663851/2733781990';
  // 'ca-app-pub-3940256099942544/5224354917'; // Test ID

  static const String interstitialAdUnitId =
      'ca-app-pub-5333475889663851/6047191107';
  // 'ca-app-pub-3940256099942544/1033173712'; // Test ID

  static const String bannerAdUnitId = 'ca-app-pub-5333475889663851/3936312322';
  // 'ca-app-pub-3940256099942544/6300978111'; // Test ID

  // Initialize ads when app starts
  Future<void> initAds() async {
    await MobileAds.instance.initialize();
    await loadBannerAd();
    await loadInterstitialAd();
    await loadRewardedAd();
  }

  // Load banner ad
  Future<void> loadBannerAd() async {
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          customPrint('Banner ad loaded');
        },
        onAdFailedToLoad: (ad, error) {
          customPrint('Banner ad failed to load: ${error.message}');
          ad.dispose();
          _bannerAd = null;
          // Retry after delay
          Future.delayed(const Duration(minutes: 1), loadBannerAd);
        },
      ),
    );

    await _bannerAd?.load();
  }

  // Get banner ad widget
  Widget? getBannerAdWidget() {
    if (_bannerAd == null) return null;
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
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
            // Check if enough time has passed since last ad
            if (_shouldShowRewardedAd()) {
              showRewardedAd();
            }

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                _isRewardedAdReady = false;
                _lastRewardedAdTime = DateTime.now();
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

  // Check if enough time has passed since last rewarded ad
  bool _shouldShowRewardedAd() {
    if (_lastRewardedAdTime == null) return true;
    return DateTime.now().difference(_lastRewardedAdTime!) >=
        _rewardedAdInterval;
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

  // Show rewarded ad
  Future<void> showRewardedAd() async {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      await loadRewardedAd();
      return;
    }

    if (!_shouldShowRewardedAd()) {
      return;
    }

    try {
      await _rewardedAd!.show(
        onUserEarnedReward: (_, reward) {
          customPrint('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
    } catch (e) {
      customPrint('Error showing rewarded ad: $e');
    }

    _isRewardedAdReady = false;
    _lastRewardedAdTime = DateTime.now();
    loadRewardedAd(); // Preload next ad
  }

  // Show interstitial ad for downloads
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
    _bannerAd?.dispose();
    _rewardedAd = null;
    _interstitialAd = null;
    _bannerAd = null;
  }
}
