part of 'advertisement_bloc.dart';

class AdvertisementState {
  // REWARD VIDEO AD
  final bool isRewardVideoAdViewed;
  final RewardedAd? rewardedAd;
  final bool isRewardedAdReady;
  // BANNER AD
  final BannerAd? bannerAd;
  final bool isBannerAdReady;

  AdvertisementState({
    // REWARD VIDEO AD
    required this.isRewardVideoAdViewed,
    required this.rewardedAd,
    required this.isRewardedAdReady,
    // BANNER AD
    required this.bannerAd,
    required this.isBannerAdReady,
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
    );
  }
}
