import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/advertisement/advertisement_bloc.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/leaderboard_model.dart';
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
    final adBloc = context.read<AdvertisementBloc>();

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
                  _buildPointsCard(theme),
                  AppSize.sizedBox3h,
                  _buildAdSection(theme, adBloc),
                  AppSize.sizedBox3h,
                  _buildLeaderboardHeader(theme),
                  AppSize.sizedBox2h,
                  _buildLeaderboardList(theme),
                  AppSize.sizedBox5h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPointsCard(ThemeData theme) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.getProfileRes.status != current.getProfileRes.status ||
          previous.leaderboardRes.status != current.leaderboardRes.status,
      builder: (context, state) {
        final profile = state.getProfileRes.apiData;
        final leaderboard = state.leaderboardRes.apiData;
        final points = profile?.points ?? 0;
        final rank = leaderboard?.currentUserRank ?? 0;

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E266F), Color(0xFF4A3BB7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2E266F).withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WwText(
                      text: "POINTS BALANCE",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    if (rank > 0)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          child: WwText(
                            text: "Rank #$rank",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                AppSize.sizedBox1h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    WwText(
                      text: "$points",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSize.sizedBox1w,
                    WwText(
                      text: "pts",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                AppSize.sizedBox2h,
                Divider(color: Colors.white24, height: 1.h),
                AppSize.sizedBox2h,
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white70,
                      size: 16,
                    ),
                    AppSize.sizedBox2w,
                    Expanded(
                      child: WwText(
                        text:
                            "Spend points to download liveries and horns. 10 pts per new download.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdSection(ThemeData theme, AdvertisementBloc adBloc) {
    return Column(
      spacing: 12.h,
      children: [
        _buildInterstitialAdCard(theme, adBloc),
        _buildRewardedAdCard(theme, adBloc),
      ],
    );
  }

  Widget _buildInterstitialAdCard(ThemeData theme, AdvertisementBloc adBloc) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.r,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Icon(
                  Icons.play_circle_fill,
                  color: theme.colorScheme.primary,
                  size: 32.r,
                ),
              ),
            ),
            AppSize.sizedBox3w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WwText(
                    text: "Watch Interstitial Ad",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  WwText(
                    text: "Earn +10 pts instantly. Limit: 200 pts/day.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            AppSize.sizedBox2w,
            _buildInterstitialWatchButton(theme, adBloc),
          ],
        ),
      ),
    );
  }

  Widget _buildInterstitialWatchButton(
    ThemeData theme,
    AdvertisementBloc adBloc,
  ) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        final isCheckingLimit =
            profileState.adLimitStatusRes.status == ApiStatus.loading &&
            _pendingAdType == 'interstitial';
        final isAdApiLoading =
            profileState.watchAdRes.status == ApiStatus.loading;

        if (isCheckingLimit || isAdApiLoading) {
          return SizedBox(
            width: 80.w,
            height: 36.h,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () {
            setState(() {
              _pendingAdType = 'interstitial';
            });
            context.read<ProfileBloc>().add(CheckAdLimitEvent());
          },
          child: WwText(
            text: "Watch",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget _buildRewardedAdCard(ThemeData theme, AdvertisementBloc adBloc) {
    return BlocBuilder<AdvertisementBloc, AdvertisementState>(
      builder: (context, adState) {
        final bool isReady = adState.isRewardedAdReady;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1.r,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Icon(
                      Icons.play_circle_fill,
                      color: theme.colorScheme.primary,
                      size: 32.r,
                    ),
                  ),
                ),
                AppSize.sizedBox3w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WwText(
                        text: "Watch Rewarded Ad",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      WwText(
                        text: "Earn +30 pts instantly. Limit: 200 pts/day.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSize.sizedBox2w,
                _buildRewardedWatchButton(theme, adBloc, isReady),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRewardedWatchButton(
    ThemeData theme,
    AdvertisementBloc adBloc,
    bool isReady,
  ) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        final isCheckingLimit =
            profileState.adLimitStatusRes.status == ApiStatus.loading &&
            _pendingAdType == 'rewarded';
        final isAdApiLoading =
            profileState.watchAdRes.status == ApiStatus.loading;

        if (isCheckingLimit || isAdApiLoading) {
          return SizedBox(
            width: 80.w,
            height: 36.h,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        if (!isReady) {
          return TextButton(
            onPressed: () {
              adBloc.add(LoadRewardVideoAdEvent());
              successToast("Loading ad, please try again in a few seconds.");
            },
            child: WwText(
              text: "Load Ad",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          );
        }

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () {
            setState(() {
              _pendingAdType = 'rewarded';
            });
            context.read<ProfileBloc>().add(CheckAdLimitEvent());
          },
          child: WwText(
            text: "Watch",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget _buildLeaderboardHeader(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WwText(
            text: "Weekly Leaderboard",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 20.r,
              color: theme.colorScheme.primary,
            ),
            onPressed: () {
              context.read<ProfileBloc>().add(GetLeaderboardEvent());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList(ThemeData theme) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.leaderboardRes.status != current.leaderboardRes.status ||
          previous.getProfileRes.apiData?.username !=
              current.getProfileRes.apiData?.username,
      builder: (context, state) {
        final status = state.leaderboardRes.status;
        final leaderboard = state.leaderboardRes.apiData;
        final currentUsername = state.getProfileRes.apiData?.username ?? '';

        if (status == ApiStatus.loading) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (status == ApiStatus.failure) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                WwText(
                  text:
                      state.leaderboardRes.errorMessage ??
                      "Failed to load leaderboard",
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ProfileBloc>().add(GetLeaderboardEvent());
                  },
                  child: const WwText(text: "Retry"),
                ),
              ],
            ),
          );
        }

        if (leaderboard == null || leaderboard.data.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: const Center(
              child: WwText(text: "No rankings available yet."),
            ),
          );
        }

        final entries = leaderboard.data;
        final isCurrentUserInTop = entries.any(
          (e) => e.username == currentUsername,
        );

        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entries.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final entry = entries[index];
                final isMe = entry.username == currentUsername;
                return _buildLeaderboardItem(theme, entry, isMe);
              },
            ),
            if (!isCurrentUserInTop && currentUsername.isNotEmpty) ...[
              SizedBox(height: 16.h),
              WwText(
                text: "Your Position",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.h),
              _buildLeaderboardItem(
                theme,
                LeaderboardEntry(
                  id: 0,
                  username: currentUsername,
                  points: leaderboard.currentUserPoints,
                  rank: leaderboard.currentUserRank,
                  dp: state.getProfileRes.apiData?.dp,
                ),
                true,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildLeaderboardItem(
    ThemeData theme,
    LeaderboardEntry entry,
    bool isMe,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isMe
            ? theme.colorScheme.primary.withValues(alpha: 0.12)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isMe
              ? theme.colorScheme.primary.withValues(alpha: 0.4)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
          width: isMe ? 1.5.r : 1.r,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          children: [
            _buildRankBadge(entry.rank),
            AppSize.sizedBox3w,
            CircleAvatar(
              radius: 18.r,
              backgroundImage: entry.dp != null && entry.dp!.isNotEmpty
                  ? NetworkImage(entry.dp!)
                  : null,
              child: entry.dp == null || entry.dp!.isEmpty
                  ? Icon(Icons.person, size: 18.r, color: Colors.grey)
                  : null,
            ),
            AppSize.sizedBox3w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: WwText(
                          text: entry.username,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: isMe
                                ? FontWeight.bold
                                : FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (entry.rank == 1) ...[
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.workspace_premium,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ],
                      if (isMe) ...[
                        SizedBox(width: 6.w),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            child: WwText(
                              text: "YOU",
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            AppSize.sizedBox2w,
            WwText(
              text: "${entry.points} pts",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankBadge(int rank) {
    Color badgeColor;
    Color textColor = Colors.white;

    switch (rank) {
      case 1:
        badgeColor = Colors.amber;
        break;
      case 2:
        badgeColor = const Color(0xFFC0C0C0); // Silver
        break;
      case 3:
        badgeColor = const Color(0xFFCD7F32); // Bronze
        break;
      default:
        badgeColor = Colors.grey.withValues(alpha: 0.2);
        textColor = Colors.grey[700]!;
        break;
    }

    final isTop3 = rank <= 3;

    return SizedBox(
      width: 28.w,
      height: 28.w,
      child: DecoratedBox(
        decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
        child: Center(
          child: WwText(
            text: "$rank",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: isTop3 ? Colors.black87 : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
