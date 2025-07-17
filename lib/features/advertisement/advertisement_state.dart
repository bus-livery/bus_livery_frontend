part of 'advertisement_bloc.dart';

class AdvertisementState {
  // REWARD VIDEO AD
  final RewardedAd? rewardedAd;
  final bool isRewardedAdReady;
  // BANNER AD
  final BannerAd? bannerAd;
  final bool isBannerAdReady;

  AdvertisementState({
    // REWARD VIDEO AD
    required this.rewardedAd,
    required this.isRewardedAdReady,
    // BANNER AD
    required this.bannerAd,
    required this.isBannerAdReady,
  });

  factory AdvertisementState.initail() {
    return AdvertisementState(
      // REWARD VIDEO AD
      rewardedAd: null,
      isRewardedAdReady: false,

      // BANNER AD
      bannerAd: null,
      isBannerAdReady: false,
    );
  }

  AdvertisementState copyWith({
    // REWARD VIDEO AD
    RewardedAd? rewardedAd,
    bool? isRewardedAdReady,
    // BANNER AD
    BannerAd? bannerAd,
    bool? isBannerAdReady,
  }) {
    return AdvertisementState(
      // REWARD VIDEO AD
      rewardedAd: rewardedAd ?? this.rewardedAd,
      isRewardedAdReady: isRewardedAdReady ?? this.isRewardedAdReady,

      // BANNER AD
      bannerAd: bannerAd ?? this.bannerAd,
      isBannerAdReady: isBannerAdReady ?? this.isBannerAdReady,
    );
  }
}
