part of 'advertisement_bloc.dart';

abstract class AdvertisementEvent {}

// REWARD VIDEO AD

class LoadRewardVideoAdEvent extends AdvertisementEvent {}

class ShowRewardVideoAdEvent extends AdvertisementEvent {}

class StoreRewardVideoAd extends AdvertisementEvent {
  final bool? isRewardViewed;
  final bool? rewardReady;
  final RewardedAd? ad;

  StoreRewardVideoAd({this.rewardReady, this.ad, this.isRewardViewed});
}

// BANNER AD

class LoadBannerAdEvent extends AdvertisementEvent {}

// INTERSTITIAL AD

class InterstitialAdEvent extends AdvertisementEvent {}

class StoreInterstitialAdEvent extends AdvertisementEvent {
  final bool adViewed;

  StoreInterstitialAdEvent({required this.adViewed});
}
