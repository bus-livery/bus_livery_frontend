import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/advertisement/advertisement_bloc.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/toast.dart';

class AdSection extends StatelessWidget {
  final String? pendingAdType;
  final Function(String adType) onWatchSelected;

  const AdSection({
    super.key,
    required this.pendingAdType,
    required this.onWatchSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adBloc = context.read<AdvertisementBloc>();

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
            pendingAdType == 'interstitial';
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
          onPressed: () => onWatchSelected('interstitial'),
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
            pendingAdType == 'rewarded';
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
          onPressed: () => onWatchSelected('rewarded'),
          child: WwText(
            text: "Watch",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
