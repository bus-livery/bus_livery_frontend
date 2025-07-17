part of 'advertisement_bloc.dart';

abstract class AdvertisementEvent {}

// REWARD VIDEO AD

class LoadRewardVideoAdEvent extends AdvertisementEvent {}

class ShowRewardVideoAdEvent extends AdvertisementEvent {}

// BANNER AD

class LoadBannerAdEvent extends AdvertisementEvent {}

class ShowBannerAdEvent extends AdvertisementEvent {}
