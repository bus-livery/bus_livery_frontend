import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/advertisement/advertisement_bloc.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/view/widgets/points_card.dart';
import 'package:livery/features/profile/view/widgets/ad_section.dart';
import 'package:livery/features/profile/view/widgets/leaderboard_section.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/toast.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  String? _pendingAdType;

  @override
  void initState() {
    super.initState();
    // Refresh user profile and leaderboard on load
    context.read<ProfileBloc>().add(ProfileGetMyApiEvent());
    context.read<ProfileBloc>().add(GetLeaderboardEvent());
  }

  Future<void> _onRefresh() async {
    context.read<ProfileBloc>().add(ProfileGetMyApiEvent());
    context.read<ProfileBloc>().add(GetLeaderboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        // Listen to rewarded advertisement view completion
        BlocListener<AdvertisementBloc, AdvertisementState>(
          listenWhen: (previous, current) =>
              !previous.isRewardVideoAdViewed && current.isRewardVideoAdViewed,
          listener: (context, state) {
            // Watch ad success -> call backend to credit points
            context.read<ProfileBloc>().add(
              WatchAdPointsEvent(adType: 'rewarded'),
            );
            // Reset the viewed state in ad bloc
            context.read<AdvertisementBloc>().add(
              StoreRewardVideoAd(isRewardViewed: false),
            );
          },
        ),
        // Listen to interstitial advertisement view completion
        BlocListener<AdvertisementBloc, AdvertisementState>(
          listenWhen: (previous, current) =>
              !previous.isInterstitialAdViewed &&
              current.isInterstitialAdViewed,
          listener: (context, state) {
            // Watch ad success -> call backend to credit points
            context.read<ProfileBloc>().add(
              WatchAdPointsEvent(adType: 'interstitial'),
            );
          },
        ),
        // Listen to WatchAd backend API call result
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) =>
              previous.watchAdRes.status != current.watchAdRes.status,
          listener: (context, state) {
            if (state.watchAdRes.status == ApiStatus.success) {
              successToast("Claimed reward points successfully!");
              // Refresh leaderboard
              context.read<ProfileBloc>().add(GetLeaderboardEvent());
            } else if (state.watchAdRes.status == ApiStatus.failure) {
              failureToast(
                state.watchAdRes.errorMessage ??
                    "Failed to claim reward points",
              );
            }
          },
        ),
        // Listen to Ad Limit Status backend check result
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) =>
              previous.adLimitStatusRes.status !=
              current.adLimitStatusRes.status,
          listener: (context, state) {
            final res = state.adLimitStatusRes;
            if (res.status == ApiStatus.success) {
              final limitStatus = res.apiData;
              if (limitStatus != null) {
                if (limitStatus.reachedLimit) {
                  failureToast(
                    "You have reached your daily limit of 200 points from ads today. Please try again tomorrow.",
                  );
                  setState(() {
                    _pendingAdType = null;
                  });
                } else {
                  // Trigger the appropriate ad depending on which button was clicked
                  if (_pendingAdType == 'interstitial') {
                    context.read<AdvertisementBloc>().add(
                      StoreInterstitialAdEvent(adViewed: false),
                    );
                    context.read<AdvertisementBloc>().add(
                      InterstitialAdEvent(),
                    );
                  } else if (_pendingAdType == 'rewarded') {
                    context.read<AdvertisementBloc>().add(
                      ShowRewardVideoAdEvent(),
                    );
                  }
                  setState(() {
                    _pendingAdType = null;
                  });
                }
              }
            } else if (res.status == ApiStatus.failure) {
              failureToast(
                res.errorMessage ?? "Failed to verify daily ad limit",
              );
              setState(() {
                _pendingAdType = null;
              });
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: WwText(
            text: 'Rewards & Leaderboard',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          color: theme.colorScheme.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: AppSize.swPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSize.sizedBox2h,
                  const PointsCard(),
                  AppSize.sizedBox3h,
                  AdSection(
                    pendingAdType: _pendingAdType,
                    onWatchSelected: (adType) {
                      setState(() {
                        _pendingAdType = adType;
                      });
                      context.read<ProfileBloc>().add(CheckAdLimitEvent());
                    },
                  ),
                  AppSize.sizedBox3h,
                  const LeaderboardSection(),
                  AppSize.sizedBox5h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
