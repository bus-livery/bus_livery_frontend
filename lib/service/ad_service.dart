import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdService {
  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;

  // TODO: Replace with your actual AdMob rewarded ad unit ID
  static const String rewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917'; // Test ID

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
                print('Ad failed to show: ${error.message}');
                _isRewardedAdReady = false;
                ad.dispose();
                loadRewardedAd(); // Try loading another ad
              },
              onAdShowedFullScreenContent: (ad) {
                print('Ad showed fullscreen content.');
              },
              onAdImpression: (ad) {
                print('Ad impression recorded.');
              },
            );
          },
          onAdFailedToLoad: (error) {
            print('Failed to load rewarded ad: ${error.message}');
            _isRewardedAdReady = false;
          },
        ),
      );
    } catch (e) {
      print('Exception while loading rewarded ad: $e');
      _isRewardedAdReady = false;
    }
  }

  Future<bool> showRewardedAd() async {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      await loadRewardedAd();
      return false;
    }

    bool userRewarded = false;
    try {
      await _rewardedAd!.show(
        onUserEarnedReward: (_, reward) {
          userRewarded = true;
          print('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
    } catch (e) {
      print('Error showing rewarded ad: $e');
      return false;
    }
    
    _isRewardedAdReady = false;
    return userRewarded;
  }

  void dispose() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
  }
}
