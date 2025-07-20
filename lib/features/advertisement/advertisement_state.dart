part of 'advertisement_bloc.dart';

class AdvertisementState {
  // REWARD VIDEO AD
  final bool isRewardVideoAdViewed;
  final RewardedAd? rewardedAd;
  final bool isRewardedAdReady;

  // BANNER AD
  final BannerAd? bannerAd;
  final bool isBannerAdReady;

  // INTERSTITIAL AD
  InterstitialAd? interstitialAd;
  bool isInterstitialAdReady;
  bool isInterstitialAdViewed;

  AdvertisementState({
    // REWARD VIDEO AD
    required this.isRewardVideoAdViewed,
    required this.rewardedAd,
    required this.isRewardedAdReady,

    // BANNER AD
    required this.bannerAd,
    required this.isBannerAdReady,

    // INTERSTITIAL AD
    required this.interstitialAd,
    required this.isInterstitialAdReady,
    required this.isInterstitialAdViewed,
  });

  factory AdvertisementState.initail() {
    return AdvertisementState(
      // REWARD VIDEO AD
      isRewardVideoAdViewed: false,
      rewardedAd: null,
      isRewardedAdReady: false,

      // BANNER AD
      bannerAd: null,
      isBannerAdReady: false,

      // INTERSTITIAL AD
      interstitialAd: null,
      isInterstitialAdReady: false,
      isInterstitialAdViewed: false,
    );
  }

  AdvertisementState copyWith({
    // REWARD VIDEO AD
    final bool? isRewardVideoAdViewed,

    RewardedAd? rewardedAd,
    bool? isRewardedAdReady,

    // BANNER AD
    BannerAd? bannerAd,
    bool? isBannerAdReady,

    // INTERSTITIAL AD
    InterstitialAd? interstitialAd,
    bool? isInterstitialAdReady,
    bool? isInterstitialAdViewed,
  }) {
    return AdvertisementState(
      // REWARD VIDEO AD
      isRewardVideoAdViewed:
          isRewardVideoAdViewed ?? this.isRewardVideoAdViewed,
      rewardedAd: rewardedAd ?? this.rewardedAd,
      isRewardedAdReady: isRewardedAdReady ?? this.isRewardedAdReady,

      // BANNER AD
      bannerAd: bannerAd ?? this.bannerAd,
      isBannerAdReady: isBannerAdReady ?? this.isBannerAdReady,

      // INTERSTITIAL AD
      interstitialAd: interstitialAd ?? this.interstitialAd,
      isInterstitialAdReady:
          isInterstitialAdReady ?? this.isInterstitialAdReady,
      isInterstitialAdViewed:
          isInterstitialAdViewed ?? this.isInterstitialAdViewed,
    );
  }
}
