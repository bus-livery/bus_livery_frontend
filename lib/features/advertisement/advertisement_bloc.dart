import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/ad_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:bloc/bloc.dart';
import 'package:livery/utils/custom_print.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

@injectable
class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState>
    with BlocLifeCycle {
  AdvertisementBloc() : super(AdvertisementState.initail()) {
    //
    initstate();
    //

    on<AdvertisementEvent>((event, emit) {});

    // REWARD VIDEO AD

    on<LoadRewardVideoAdEvent>(_loadRewardVideoAd);

    on<ShowRewardVideoAdEvent>(_showRewardVideoAd);

    on<StoreRewardVideoAd>(_storeRewardVideoAd);

    // BANNER AD

    on<LoadBannerAdEvent>(_loadBannerAdEvent);

    on<ShowBannerAdEvent>(_showBannerAdEvent);
  }

  @override
  void initstate() {
    customPrint('ADVERTISEMENT BLOC INITIALIZED');

    WidgetsBinding.instance.addPostFrameCallback((v) async {
      await MobileAds.instance.initialize(); // Initialize ad service
      add(LoadRewardVideoAdEvent());
      add(LoadBannerAdEvent());
    });
  }

  void _storeRewardVideoAd(StoreRewardVideoAd event, emit) async {
    emit(
      state.copyWith(
        isRewardVideoAdViewed: event.isRewardViewed,
        isRewardedAdReady: event.rewardReady,
        rewardedAd: event.ad,
      ),
    );
  }

  void _loadRewardVideoAd(LoadRewardVideoAdEvent event, emit) async {
    if (state.isRewardedAdReady) return;

    try {
      await RewardedAd.load(
        adUnitId: AdService.rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) async {
            customPrint('RewardVideo ad loaded successfully');

            add(StoreRewardVideoAd(rewardReady: true, ad: ad));

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                add(StoreRewardVideoAd(rewardReady: false, ad: ad));

                ad.dispose();
                add(LoadRewardVideoAdEvent()); // Load the next ad
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                customPrint('RewardVideoAd failed to show: ${error.message}');
                add(StoreRewardVideoAd(rewardReady: false, ad: ad));

                ad.dispose();
                add(LoadRewardVideoAdEvent()); // Try loading another ad
              },
              onAdShowedFullScreenContent: (ad) {
                customPrint('RewardVideoAd showed fullscreen content.');
              },
              onAdImpression: (ad) {
                customPrint('RewardVideoAd impression recorded.');
              },
            );
          },
          onAdFailedToLoad: (error) async {
            customPrint('Failed to load rewarded ad: ${error.message}');
            add(StoreRewardVideoAd(rewardReady: false, ad: null));

            // Retry after delay
            await Future.delayed(const Duration(minutes: 1));
            add(LoadRewardVideoAdEvent());
          },
        ),
      );
    } catch (e) {
      customPrint('Exception while loading rewarded ad: $e');
      emit(state.copyWith(isRewardedAdReady: false));

      // Retry after delay
      await Future.delayed(const Duration(minutes: 1));
      add(LoadRewardVideoAdEvent());
    }
  }

  void _showRewardVideoAd(ShowRewardVideoAdEvent event, emit) async {
    log('${state.rewardedAd == null} : ${state.isRewardedAdReady}');

    if (!state.isRewardedAdReady || state.rewardedAd == null) {
      add(LoadRewardVideoAdEvent());
      return;
    }

    try {
      await state.rewardedAd!.show(
        onUserEarnedReward: (_, reward) {
          add(StoreRewardVideoAd(isRewardViewed: true));
          customPrint('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
    } catch (e) {
      customPrint('Error showing rewarded ad: $e');
    }

    emit(state.copyWith(isRewardedAdReady: false));
    add(LoadRewardVideoAdEvent()); // Preload next ad
  }

  void _loadBannerAdEvent(LoadBannerAdEvent event, emit) async {
    if (state.isBannerAdReady) return;

    try {
      BannerAd? bannerAd;
      bannerAd = BannerAd(
        adUnitId: AdService.bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            customPrint('Banner ad loaded successfully');
            emit(state.copyWith(isBannerAdReady: true));
          },
          onAdFailedToLoad: (ad, error) async {
            customPrint('Banner ad failed to load: ${error.message}');
            customPrint('Error code: ${error.code}');
            customPrint('Error domain: ${error.domain}');
            emit(state.copyWith(isBannerAdReady: false));
            ad.dispose();
            bannerAd = null;
            // Retry after delay
            await Future.delayed(const Duration(minutes: 1));
            add(LoadBannerAdEvent());
          },
          onAdOpened: (ad) {
            customPrint('Banner ad opened');
          },
          onAdClosed: (ad) {
            customPrint('Banner ad closed');
          },
          onAdImpression: (ad) {
            customPrint('Banner ad impression recorded');
          },
        ),
      );

      await bannerAd?.load();
      emit(state.copyWith(bannerAd: bannerAd));
    } catch (e) {
      customPrint('Exception while loading banner ad: $e');
      emit(state.copyWith(isBannerAdReady: false));

      await Future.delayed(const Duration(minutes: 1));
      add(LoadBannerAdEvent());
    }
  }

  void _showBannerAdEvent(ShowBannerAdEvent event, emit) {}
}
