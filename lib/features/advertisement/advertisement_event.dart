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

class ShowBannerAdEvent extends AdvertisementEvent {}
